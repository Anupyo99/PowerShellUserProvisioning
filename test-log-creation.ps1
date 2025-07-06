# Script: test-log-creation.ps1
# Purpose: Creates a logs folder and writes a test log entry

# Define file paths
$csvPath = ".\users.csv"
$logPath = ".\logs\user_provision_log.txt"

# Create 'logs' folder if it doesn't exist
if (!(Test-Path -Path "./logs")) {
    New-Item -ItemType Directory -Path "./logs" | Out-Null
}

# Write a test log entry
"Test log entry: Script ran successfully." | Out-File -FilePath $logPath -Append

# Display confirmation
Write-Host "✅ Log file created at $logPath"
