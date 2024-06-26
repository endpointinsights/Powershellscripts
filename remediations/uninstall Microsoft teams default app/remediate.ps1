# Write-Output is returned to Intune.
# Exit code 0 = configuration is correct.
# Exit code 1 = configuration is incorrect, trigger remediation script.
# Author: Mubashir Javaid

try
{
    Get-AppxPackage -Name MicrosoftTeams | Remove-AppxPackage -ErrorAction stop
    Write-Host "Remediation: Microsoft Teams app successfully removed"
    Exit 0
}
catch
{
    Write-Warning $_
    Exit 1
}
