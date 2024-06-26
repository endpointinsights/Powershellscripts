#Script detects the new Microsoft Teams consumer app on Windows 11.
# Must be executed in logged-on credentials
# Exit code 0 = configuration is correct.
# Exit code 1 = configuration is incorrect, trigger remediation script.
# Author: Mubashir Javaid

try
{
    if ($null -eq (Get-AppxPackage -Name MicrosoftTeams)) 
    {
	    Write-Host "Detection: Microsoft Teams APPX package not found"
	    exit 0
    } 
    Else 
    {
	    Write-Warning "Detection: Microsoft Teams client found, run remediation to remove it."
	    Exit 1
    }
}
catch
{
    Write-Warning $_
    Exit 1
}
