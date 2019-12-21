
<p align="left">
  <a href="https://www.powershellgallery.com/packages/PSYamahaMusicCast"><img src="https://img.shields.io/azure-devops/build/mnadobnik/e0b7e400-0d25-496b-90c1-d3d3224f163c/4"></a>
  <a href="https://www.powershellgallery.com/packages/PSGitHubGist"><img src="https://img.shields.io/powershellgallery/v/PSGitHubGist.svg"></a>
  <a href="https://www.powershellgallery.com/packages/PSGitHubGist"><img src="https://img.shields.io/powershellgallery/p/PSGitHubGist.svg"></a>
  <a href="https://twitter.com/MateuszNadobnik"><img src="https://img.shields.io/twitter/follow/MateuszNadobnik.svg?label=Twitter%20%40MateuszNadobnik&style=social"></a>
  <a href="https://akademiapowershell.pl"><img src="https://img.shields.io/badge/Blog-AkademiaPowerShell-2A6496.svg"></a>
  <a href="https://www.linkedin.com/in/mnadobnik/"><img src="https://img.shields.io/badge/LinkedIn-mnadobnik-0077B5.svg?logo=LinkedIn"></a>
</p>



# PSGitHubGist
**PSGitHubGist** is PowerShell module helps manage gists on [GitHub](http://github.com/).

**PSGitHubGist** now has 3 functions:
- Get-GitHubGist
- New-GitHubGist
- Remove-GitHubGist

## ChangeLog

- 0.1.0 - 20.12.2019
  - First version

## To install

```powershell
Install-Module -Name PSGitHubGist -Force
```

Force isn't really necessary but they do skip errors in case some appear.

## And to update

```powershell
Update-Module -Name PSGitHubGist
```

Whenever there's new version you simply run the command and you can enjoy it. Remember, that you may need to close, reopen **PowerShell** session if you have already used module before updating it.

## Tip
Add to your profile a default value for parameter UserName and Token. It will help you on easier use the functions of PSGitHubGist.

```powershell
$PSDefaultParameterValues.Add("*-GitHubGist:UserName", "10.10.0.30")
$PSDefaultParameterValues.Add("*-GitHubGist:Token", "10.10.0.30")
```

## Examples
