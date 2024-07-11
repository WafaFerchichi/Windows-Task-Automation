# Windows Task Automation Documentation

This documentation provides detailed steps to set up and run the PowerShell scripts for automating system maintenance tasks.

## Tasks

- Disk Cleanup
- System Updates
- Backup
- Performance Monitoring

These tasks are further explained below.

### 1. Disk Cleanup

#### Script: `DiskCleanup.ps1`

This script automates the cleanup of temporary files, the recycle bin, and system caches.

#### Usage

```powershell
# Navigate to the scripts directory
cd scripts

# Run the disk cleanup script
.\DiskCleanup.ps1
```

### 2. System Updates

#### Script: `SystemUpdates.ps1`

This script automates the process of checking for and installing Windows updates.

#### Prerequisites

- Run PowerShell as an administrator.

#### Usage

```powershell
# Navigate to the scripts directory
cd scripts

# Run the system updates script
.\SystemUpdates.ps1

```

### 3. Backup

#### Script: `Backup.ps1`

This script automates the backup of important files to a specified location or external drive.

#### Prerequisites

- Ensure the backup drive is connected.

#### Usage

```powershell
# Navigate to the scripts directory
cd scripts

# Run the backup script
.\Backup.ps1 -SourceDirectory "C:\ImportantFiles" -BackupDirectory "E:\Backups"

```

### 4. Performance Monitoring

#### Script: `PerformanceMonitoring.ps1`

This script monitors system performance and generates an HTML report of the top 10 processes by CPU usage.

#### Prerequisites

- None

#### Usage

```powershell
# Navigate to the scripts directory
cd scripts

# Run the performance monitoring script
.\PerformanceMonitoring.ps1
```

Use Task Scheduler to run these scripts at regular intervals.

### Setting Up Task Scheduler

1. Open Task Scheduler.
2. Create a new task for each script:
   - General: Name the task and add a description.
   - Triggers: Set triggers (e.g., daily, weekly) for when the task should run.
   - Actions: Set the action to run the PowerShell script:
     \`\`\`powershell
     powershell.exe -File \"C:\Path\To\Your\Script.ps1\"
     \`\`\`
   - Conditions and Settings: Configure as needed, such as waking the computer to run the task.

For more detailed instructions on using Task Scheduler, refer to the [official documentation](https://docs.microsoft.com/en-us/windows/win32/taskschd/task-scheduler-start-page).
" >> docs/Documentation.md

git add docs/Documentation.md
git commit -m "Add Task Scheduler setup documentation"
git push origin master
