# Bootstrap environment
Get-PackageProvider -Name 'NuGet' -ForceBootstrap | Out-Null

# Install InvokeBuild module if it is not already installed
if (-not (Get-Module -Name 'InvokeBuild' -ListAvailable))
{
    Write-Output "InvokeBuild is not yet installed...installing InvokeBuild now..."
    Install-Module -Name 'InvokeBuild' -Scope 'CurrentUser' -Force
}
else
{
    Write-Output "InvokeBuild already installed...skipping."
}