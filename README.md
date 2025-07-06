# PowerShell User Provisioning Simulation

This project simulates an automated user provisioning system using PowerShell. It is designed to work on **Windows Home editions** (no Active Directory required).

## 📁 Features

- 🧑‍💻 Reads user data from a CSV file
- 🔐 Generates secure random passwords
- 👥 Simulates group assignment
- 📝 Logs success/failure messages to a log file

## 📂 Files Included

| File | Purpose |
|------|---------|
| `create-users.ps1` | Main script to read CSV, generate passwords, and simulate provisioning |
| `users.csv` | Sample input file with user data |
| `logs/user_provision_log.txt` | Output log showing success/failure of each simulated user creation |
| `test-log-creation.ps1` | Standalone script to test log creation functionality |

## 🛠 How to Use

1. Clone or download this repository.
2. Make sure `users.csv` contains your user data in this format:

```csv
FirstName,LastName,Username,Group
John,Doe,jdoe,HR
Jane,Smith,jsmith,IT
