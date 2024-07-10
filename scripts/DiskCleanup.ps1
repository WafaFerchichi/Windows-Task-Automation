# DiskCleanup.ps1

# Clear Temp Files
Remove-Item -Path "C:\Windows\Temp\*" -Force -Recurse
Remove-Item -Path "$env:temp\*" -Force -Recurse

# Clear Recycle Bin
Clear-RecycleBin -Force

# Clear System Cache
# Not directly possible via PowerShell
# Cleanmgr.exe for disk cleanup
cleanmgr /sagerun:1
