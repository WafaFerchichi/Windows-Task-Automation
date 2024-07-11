# PerformanceMonitoring.ps1

# Define the path to save the performance report
$ReportPath = "C:\PerformanceReports\PerformanceReport.html"

# Ensure the directory exists
$ReportDirectory = Split-Path -Path $ReportPath -Parent
if (-not (Test-Path -Path $ReportDirectory)) {
    New-Item -ItemType Directory -Path $ReportDirectory -Force
}

# Generate the performance report
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 | ConvertTo-Html -Property Name, CPU, ID, WS -Title "Top 10 Processes by CPU Usage" | Out-File -FilePath $ReportPath

Write-Host "Performance report generated successfully at $ReportPath."
