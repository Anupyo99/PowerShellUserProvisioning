# create-users.ps1
# Simulate user creation from CSV and log results

$csvPath = ".\users.csv"
$logPath = ".\logs\user_provision_log.txt"

# Ensure logs folder exists
if (!(Test-Path -Path "./logs")) {
    New-Item -ItemType Directory -Path "./logs" | Out-Null
}

function Log {
    param (
        [string]$Message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $Message" | Out-File -FilePath $logPath -Append
}

function Generate-RandomPassword {
    param (
        [int]$length = 12
    )
    $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()'
    $password = -join ((1..$length) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] })
    return $password
}

# Check CSV exists
if (!(Test-Path $csvPath)) {
    Log "ERROR: CSV file not found at path $csvPath"
    Write-Host "CSV file not found at $csvPath. Exiting script."
    exit
}

# Import users from CSV
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {
    try {
        $username = $user.Username
        $group = $user.Group

        # Generate a random password
        $password = Generate-RandomPassword -length 12

        # Simulate user creation (replace with real AD commands when ready)
        Log "SUCCESS: Created user '$username' with password '$password' and added to group '$group'"
        Write-Host "User $username created and added to $group"
    }
    catch {
        Log "FAILURE: Could not create user '$($user.Username)'. Error: $_"
        Write-Host "Failed to create user $($user.Username): $_"
    }
}
