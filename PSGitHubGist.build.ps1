param (
    [Parameter(Mandatory = $false)]
    [string]$ModuleName,
    [Parameter(Mandatory = $false)]
    [ValidateSet('Development', 'Production')]
    $Configuration = 'Development'
)

# Default
task . RemoveImport
task tests InstallDependencies, Analyze, Test
task pub InstallDependencies, UpdateHelp, Analyze, Test, CopyFiles, Publish, Clean

# Local Publish
task version InstallDependencies, Analyze, Test, UpdateVersion

if (-not ($PSBoundParameters.ModuleName))
{
    $ModuleName = Split-Path -Path $BuildRoot -Leaf
}

# start azure-pipelines tasks
task InstallDependencies {
    Install-Module Pester -Force
    Install-Module PSScriptAnalyzer -Force
    Install-Module platyPS -Force
}

task UpdateHelp {
    Import-Module ".\$ModuleName" -Force
    Update-MarkdownHelp .\docs
    New-ExternalHelp -Path .\docs -OutputPath .\en-US -Force
}

task Analyze {
    $scriptAnalyzerParams = @{
        Path        = "$BuildRoot\public"
        Severity    = @('Error', 'Warning')
        Recurse     = $true
        Verbose     = $false
        ExcludeRule = 'PSUseDeclaredVarsMoreThanAssignments'
    }

    $saResults = Invoke-ScriptAnalyzer @scriptAnalyzerParams
    #    $saResults | ConvertTo-Html | Out-File -FilePath "$BuildRoot\tests\result.$ModuleName.scriptAnalyzer.html" -Force

    if ($saResults)
    {
        $saResults | Format-Table
        throw "One or more PSScriptAnalyzer errors/warnings where found."
    }
}

task Test {
    $invokePesterParams = @{
        Strict       = $true
        PassThru     = $true
        Verbose      = $false
        EnableExit   = $false
        OutputFormat = 'NUnitXml'
        OutputFile   = "$BuildRoot\tests\result.$ModuleName.test.xml"
    }

    # Publish Test Results as NUnitXml
    $testResults = Invoke-Pester ".\$((($BuildFile -split '\\')[-1] -split '\.')[0] + '.Tests.ps1')" @invokePesterParams

    $numberFails = $testResults.FailedCount
    assert($numberFails -eq 0) ('Failed "{0}" unit tests.' -f $numberFails)
}

task CopyFiles {
    # Copy Module Files to Output Folder
    $OutputPath = ".\output\$ModuleName"
    if (-not (Test-Path $OutputPath))
    {
        $null = New-Item -Path $OutputPath -ItemType Directory
    }

    '.\en-US\', '.\lib\' , '.\bin\' , '.\public\' , '.\private\' , '.\tests\' |
    ForEach-Object {
        if (Test-Path $_)
        {
            Copy-Item -Path $_ -Filter *.* -Recurse -Destination $OutputPath -Force
        }
    }

    # Copy Module Manifest files
    Copy-Item -Path @(
        ".\README.md"
        ".\$ModuleName.psd1"
        ".\$ModuleName.psm1"
        ".\$ModuleName.Format.ps1xml"
    ) -Destination $OutputPath -Force
}

task Publish -If ($Configuration -eq 'Production') {
    try
    {
        $params = @{
            Path        = ('{0}\Output\{1}' -f $PSScriptRoot, $ModuleName )
            NuGetApiKey = $Env:NuGetApiKey
            ErrorAction = 'Stop'
        }
        Publish-Module @params
        Write-Output "$ModuleName PowerShell Module version published to the PowerShell Gallery"
    }
    catch
    {
        throw $_
    }
}

task Clean {
    # Clean output folder
    if ((Test-Path .\output))
    {
        Remove-Item -Path .\Output -Recurse -Force
    }
}
# End azure-pipelines tasks

task RemoveImport {
    if (Get-Module $ModuleName)
    {
        Remove-Module -Name $ModuleName
    }
    Import-Module $BuildRoot
}

task TestFiles {
    Get-ChildItem "$BuildRoot\public" | ForEach-Object {
        if (-not (Test-Path -Path ("tests\$($_.BaseName).Tests.ps1")))
        {
            New-Item -Name "tests\$($_.BaseName).Tests.ps1" -ItemType File
        }
    }
}

task UpdateVersion {
    try
    {
        $manifestPath = ".\$ModuleName.psd1"

        # Import PlatyPS.
        Import-Module -Name PlatyPS

        # Start by importing the manifest to determine the version, then add 1 to the Build
        $manifest = Test-ModuleManifest -Path $manifestPath
        [System.Version]$Version = $manifest.Version
        [String]$NewVersion = New-Object -TypeName System.Version -ArgumentList ($version.Major, $version.Minor, ($version.Build + 1))
        Write-Output ('New Module version: {0}' -f $newVersion)

        #Update Module with new version
        Update-ModuleManifest -ModuleVersion $newVersion -Path $manifestPath -ReleaseNotes $ReleaseNotes
    }
    catch
    {
        Write-Error -Message $_.Exception.Message
        $host.SetShouldExit($LastExitCode)
    }
}

task CleanTest {
    [array]$Files = "test\result.PSNps.scriptAnalyzer.html", "test\result.PSNps.test.xml", "remove", ".vscode"
    $Files | Foreach-Object {
        Remove-Item -Path (Join-Path -Path $BuildRoot -ChildPath $_) -Recurse -Force
    }
}