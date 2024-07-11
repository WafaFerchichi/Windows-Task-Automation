# Backup.ps1

param (
    [string]$SourceDirectory = "C:\ImportantFiles",
    [string]$BackupDirectory = "E:\Backups"
)

# Create a timestamp for the backup
$Timestamp = Get-Date -Format "yyyyMMddHHmmss"

# Create a backup directory with the timestamp
$Destination = Join-Path -Path $BackupDirectory -ChildPath $Timestamp

# Create the backup directory
New-Item -ItemType Directory -Path $Destination -Force

# Copy the files to the backup directory
Copy-Item -Path $SourceDirectory -Destination $Destination -Recurse -Force

Write-Host "Backup completed successfully."
