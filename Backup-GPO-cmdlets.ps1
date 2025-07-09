# Backup-GPO 
# Backup and restore Group Policy Objects.
# GPO version control and recovery.

# Backup a specific GPO by name
Backup-GPO -Name "BackupThisGPO" -Path "C:\GPOBackupsHere" -Comment "Weekly GPO Backup"

# Backup a GPO using its GUID
Backup-GPO -Guid "123456-6e2a-4b87-ab78-123456" -Path "\\ServerNameHere\GPOBackupsHere"

# Backup all GPOs in the domain
Backup-GPO -All -Path "\\ServerNameHere\GPOBackupsHere"
