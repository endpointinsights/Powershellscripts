# Detect if Wifi is public or private and highlight
# MUbashir Javaid
# Exit code 0 = configuration is correct.
# Exit code 1 = configuration is incorrect, trigger remediation script.

$ErrorActionPreference = "SilentlyContinue"
try
{
    $NetworkCategory = Get-NetConnectionProfile -Name "WifiName" | select NetworkCategory 
    Write-Output $NetworkCategory.NetworkCategory

    if($NetworkCategory.NetworkCategory -eq "Public") 
    {
        Write-Output "Vejession WiFi profile is public"
        Exit 1
    }
    else 
    {
        Write-Output "Vejession Wifi profile is private"
        Exit 0
    }

} 
catch
{
    Write-Output "Vejession Wifi profile Not found"
    Exit 1
}
