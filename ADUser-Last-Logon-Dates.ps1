# Get-ADUser -Properties LastLogonDate
# Identify inactive users.
# Clean-up and license optimization.

# Identify Inactive Users
# Change 90 to days you need instead
$daysInactive = 90
$cutoffDate = (Get-Date).AddDays(-$daysInactive)

Get-ADUser -Filter * -Properties LastLogonDate |
Where-Object { $_.LastLogonDate -lt $cutoffDate } |
Select-Object Name, SamAccountName, LastLogonDate

# Audit User Login Activity
# Generate a report of all users and their last logon times
Get-ADUser -Filter * -Properties LastLogonDate |
Select-Object Name, SamAccountName, LastLogonDate |
Export-Csv -Path "C:\ADUserLogonReport.csv" -NoTypeInformation

# Monitor Specific Users
# Check when a specific user last logged in
Get-ADUser -Identity bgates -Properties LastLogonDate | Select-Object Name, LastLogonDate

# Real-Time Last Logon Across All DCs
# Define the user to check
$userSamAccountName = "bgates"

# Get the user's distinguished name
$user = Get-ADUser -Identity $userSamAccountName -Properties DistinguishedName
$dn = $user.DistinguishedName

# Get all domain controllers
$DCs = Get-ADDomainController -Filter *

# Initialize variable to store the latest logon
$latestLogon = 0
$latestDC = ""

foreach ($dc in $DCs) {
    # Query the lastLogon attribute from each DC
    $logon = Get-ADUser -Identity $dn -Server $dc.HostName -Properties lastLogon | Select-Object -ExpandProperty lastLogon

    if ($logon -gt $latestLogon) {
        $latestLogon = $logon
        $latestDC = $dc.HostName
    }
}

# Convert to readable date
if ($latestLogon -ne 0) {
    $lastLogonDate = [DateTime]::FromFileTime($latestLogon)
    Write-Host "User '$userSamAccountName' last logged on at $lastLogonDate (from DC: $latestDC)"
} else {
    Write-Host "No logon record found for user '$userSamAccountName'."
}

