# Remove/reset PIN on windows if normal PIN reset is not working
# Author: Mubashir Javaid
# Exit code 0 = configuration is correct.
# Exit code 1 = configuration is incorrect, trigger remediation script.

$NGC_folder = "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Ngc"

# Check if NGC folder is already present
if (Test-Path $NGC_folder)
{
    takeown /f $NGC_folder /r /d y
    icacls $NGC_folder /reset /t /c /l /q
    
    Remove-Item $NGC_folder -recurse -force
    Write-Host "NGC Folder is remove, Please restart your device to set PIN"
    Exit 0
}
else
{
    Write-Error "NGC folder not found!"
    Exit 1 
}
