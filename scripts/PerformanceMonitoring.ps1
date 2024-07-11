# PerformanceMonitoring.ps1

# Get the current date and time in the format YYYY-MM-DD_HH-MM-SS
$timestamp = (Get-Date).ToString("yyyy-MM-dd_HH-mm-ss")

# Define the path to save the performance report
$ReportPath = "C:\PerformanceReports\PerformanceReport_$timestamp.html"

# Ensure the directory exists
$ReportDirectory = Split-Path -Path $ReportPath -Parent
if (-not (Test-Path -Path $ReportDirectory)) {
    New-Item -ItemType Directory -Path $ReportDirectory -Force
}

# Generate the performance report
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 | ConvertTo-Html -Property Name, CPU, ID, WS -Title "Top 10 Processes by CPU Usage" | Out-File -FilePath $ReportPath

Write-Host "Performance report generated successfully at $ReportPath."
