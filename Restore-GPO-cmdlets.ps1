# Restore-GPO
# Restore Group Policy Objects.
# GPO version control and recover

# Restore a GPO by name from backup
Restore-GPO -Name "TestGPO" -Path "\\ServerNameHere\GPOBackupsHere"

# Restore a GPO using its GUID
Restore-GPO -Guid "fa4a9473-6e2a-4b87-ab78-175e68d97bde" -Path "\\ServerNameHere\GPOBackupsHere"

# Restore all GPOs from a backup directory
Restore-GPO -All -Domain "contoso.com" -Path "\\ServerNameHere\GPOBackupsHere"

# Restore a GPO using a specific backup ID
Restore-GPO -BackupId "0fc29b3c-fb83-4076-babb-6194c1b4fc26" -Path "\\ServerNameHere\GPOBackupsHere"

