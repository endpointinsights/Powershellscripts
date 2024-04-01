# Remediate if Vejessiens Wifi is public or private
# MUbashir Javaid
# 29 August, 2023
# Exit code 0 = configuration is correct.
# Exit code 1 = configuration is incorrect, trigger remediation script.

$ErrorActionPreference = "SilentlyContinue"
try
{
    $NetworkCategory = Get-NetConnectionProfile -Name "Vejessiens" | select NetworkCategory 
    Write-Output $NetworkCategory.NetworkCategory

    if($NetworkCategory.NetworkCategory -eq "Public") 
    {
        Set-NetConnectionProfile -Name "Vejessiens" -NetworkCategory Private
        Write-Output "Vejession Wifi profile is change from public to private"
        Exit 0
    }
    else 
    {
         Write-Output "Vejession Wifi profile is not changed, It's already public profile."
         Exit 1
    }

} 
catch
{
    Write-Output "Vejession Wifi profile Not found"
    Exit 1
}