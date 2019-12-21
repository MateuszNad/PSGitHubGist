<#
.Synopsis
     The function create new GitHub Gists
.DESCRIPTION
    All documentation find you on https://developer.github.com/v3/gists/#create-a-gist

.EXAMPLE
    New-GithubGist -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c' -Path .\Format-SQLCode.ps1

.EXAMPLE
    New-GithubGist -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c' -Path .\PSGitHubGist.ps1 -Name 'gist-example.ps1'


.NOTES
    Author: Mateusz Nadobnik
    Link: akademiapowershell.pl

    Date: 02-12-2019
    Version: version
    eywords: keywords
    Notes:
    Changelog:
#>
function New-GithubGist
{
    [Alias('New-Gists')]
    [cmdletbinding()]
    param(
        [Parameter(Mandatory)]
        [string]$UserName,
        [Parameter(Mandatory)]
        [string]$Token,
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$Path,
        [Parameter(Mandatory = $false)]
        $Name,
        [Parameter(Mandatory = $false)]
        $Description,
        [switch]$Private
    )

    begin
    {
        $Token = ('{0}:{1}' -f $UserName, $Token)

        $BaseAuth = [System.Convert]::ToBase64String([char[]]$Token)
        $Header = @{
            Authorization = "Basic $BaseAuth"
        }

        if ($Private.IsPresent)
        {
            $Public = 'false'
        }
        else
        {
            $Public = 'true'
        }

        if ($null -eq $Name)
        {
            $Name = Split-Path -Path $Path -Leaf
        }
    }
    process
    {
        [string]$Content = Get-Content $Path -Raw -Encoding Ascii


        $Obj = [PSCustomObject]@{
            description = "$Description"
            public      = "$Public"
            files       = @{
                $Name = @{
                    "content" = $Content
                }
            }
        }
        try
        {
            $Body = $Obj | ConvertTo-Json
                        Write-Verbose ($Header.Authorization)

            $Result = Invoke-RestMethod -Uri "https://api.github.com/gists" -Method Post -Headers $Header -Body $Body
            $Result | Add-Member -Name embed -MemberType NoteProperty -Value ('<script src="{0}.js"></script>' -f $Result.html_url)
            Write-Output $Result
        }
        catch
        {
            Write-Warning $_
        }
    }
}