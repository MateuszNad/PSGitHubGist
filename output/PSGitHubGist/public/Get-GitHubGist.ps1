<#
.Synopsis
    The function list GitHub Gists

.DESCRIPTION
    All documentation find you on https://developer.github.com/v3/gists/#list-a-users-gists

.EXAMPLE
    Get-GithubGist  -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c'

    List a user's gists.

.EXAMPLE
    Get-GithubGist  -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c' -Id 'bbc1363c779397143f9c5169dd22562a'

    Get a single gist

.EXAMPLE
    Get-GithubGist  -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c' -Starred

    List the authenticated user's starred gists

.EXAMPLE
    Get-GithubGist  -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c' -Public

    List all public gists sorted by most recently updated to least recently updated.

.EXAMPLE
    Get-GithubGist  -UserName 'mnadobnik' -Token 'bc972823d9c79084ebfaefdc7ee98cbc1d259d1c' -PerPage 100

    Note: With pagination, you can fetch up to 3000 gists. For example, you can fetch 100 pages with 30 gists per page or 30 pages with 100 gists per page.

.NOTES
    Author: Mateusz Nadobnik
    Link: akademiapowershell.pl

    Date: 02-12-2019
    Version: version
    eywords: keywords
    Notes:
    Changelog:
#>
function Get-GithubGist
{
    [Alias('Get-Gist')]
    [cmdletbinding(DefaultParameterSetName = 'Id')]
    param(
        [Parameter(Mandatory)]
        [string]$UserName,
        [Parameter(Mandatory)]
        [string]$Token,
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName, ParameterSetName = "Id")]
        [Alias('GistId')]
        [string]$Id,
        [Parameter(ParameterSetName = "Starred")]
        [switch]$Starred,
        [Parameter(ParameterSetName = "Public")]
        [switch]$Public,
        [Parameter(Mandatory = $false)]
        [ValidateRange(1, 100)]
        [int]$PerPage = 30,
        [Parameter(Mandatory = $false, ValueFromPipeline)]
        [int]$Page = 1
    )

    begin
    {
        # Create BaseAuth
        $Token = ('{0}:{1}' -f $UserName, $Token)

        $BaseAuth = [System.Convert]::ToBase64String([char[]]$Token)
        $Header = @{
            Authorization = "Basic $BaseAuth"
        }
    }
    process
    {
        if ($Starred.IsPresent)
        {
            $Uri = "https://api.github.com/gists/starred?page=$page&per_page=$PerPage"
        }
        elseif ($Public.IsPresent)
        {
            $Uri = "https://api.github.com/gists/public?page=$page&per_page=$PerPage"
        }
        elseif ($Id)
        {
            $Uri = "https://api.github.com/gists/$Id"
        }
        else
        {
            $Uri = "https://api.github.com/gists?page=$page&per_page=$PerPage"
        }

        try
        {
            Write-Verbose ($Header.Authorization)
            $Result = Invoke-RestMethod -Uri $Uri -Method Get -Headers $Header

            # Add property to returned objecd
            $Result | Add-Member -Name embed -MemberType NoteProperty -Value ('<script src="{0}.js"></script>' -f $Result.html_url)
            Write-Output $Result
        }
        catch
        {
            Write-Warning $_
        }
    }
}