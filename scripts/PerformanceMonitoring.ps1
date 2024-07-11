# PerformanceMonitoring.ps1

# Get the current date and time in the format YYYY-MM-DD_HH-MM-SS
$timestamp = (Get-Date).ToString("yyyy-MM-dd_HH-mm-ss")

# Define the path to save the performance report, including the timestamp in the filename
$ReportPath = "C:\PerformanceReports\PerformanceReport_$timestamp.html"

# Ensure the directory exists
$ReportDirectory = Split-Path -Path $ReportPath -Parent
if (-not (Test-Path -Path $ReportDirectory)) {
    New-Item -ItemType Directory -Path $ReportDirectory -Force
}

# Generate the performance report
$topProcesses = Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 | ConvertTo-Html -Property Name, CPU, ID, WS -Title "Top 10 Processes by CPU Usage"

# Add HTML boilerplate and include the table
$htmlContent = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Performance Report - $timestamp</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Performance Report - $timestamp</h1>
    $topProcesses
</body>
</html>
"@

# Save the HTML content to the report file
$htmlContent | Out-File -FilePath $ReportPath -Encoding utf8

Write-Host "Performance report generated successfully at $ReportPath."
