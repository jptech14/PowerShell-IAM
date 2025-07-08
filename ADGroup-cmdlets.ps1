# Retrieves information about one or more AD groups.
Get-ADGroup -Identity "IT Team"

# Retrieve the Group and its properties.
Get-ADGroup -Filter 'Name -like "*Team*"'

# Creates a new AD group.
New-ADGroup -Name "IT Team" -SamAccountName "ITTeam" -GroupScope Global -GroupCategory Security -Path "OU=Groups,DC=example,DC=com"

# Adds one or more users, groups, or computers to an AD group.
Add-ADGroupMember -Identity "IT Team" -Members bgates, snadella

