<#
.Synopsis
     The function remove GitHub Gists
.DESCRIPTION
    All documentation find you on https://developer.github.com/v3/gists/#delete-a-gist

.EXAMPLE
    Remove-GithubGist  -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c' -Id '7cfe221a77c7110fb3a33b3c297a69a9'

    Delete a gist
.EXAMPLE
    Get-GithubGist | Where-Object files -like *gist-test* | Remove-GithubGist

.NOTES
    Author: Mateusz Nadobnik
    Link: akademiapowershell.pl

    Date: 02-12-2019
    Version: version
    eywords: keywords
    Notes:
    Changelog:
#>
function Remove-GithubGist
{
    [Alias('Remove-Gist')]
    [cmdletbinding()]
    param(
        [Parameter(Mandatory)]
        [string]$UserName,
        [Parameter(Mandatory)]
        [string]$Token,
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('GistId')]
        [string]$Id
    )

    begin
    {
        $Token = ('{0}:{1}' -f $UserName, $Token)

        $BaseAuth = [System.Convert]::ToBase64String([char[]]$Token)
        $Header = @{
            Authorization = "Basic $BaseAuth"
        }
    }
    process
    {
        try
        {
            $Uri = "https://api.github.com/gists/$Id"

            Write-Verbose ($Header.Authorization)
            $Result = Invoke-RestMethod -Uri $Uri -Method Delete -Headers $Header
            Write-Output $Result
        }
        catch
        {
            Write-Warning $_.Error
        }
    }
}