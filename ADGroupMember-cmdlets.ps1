# Get all members of a group
Get-ADGroupMember -Identity "IT Team"

# Get members with additional properties
Get-ADGroupMember -Identity "IT Team" | Select-Object Name, SamAccountName, objectClass

# Export group members to CSV
Get-ADGroupMember -Identity "IT Team" | 
    Select-Object Name, SamAccountName | 
    Export-Csv -Path "C:\GroupMembers.csv" -NoTypeInformation

# Remove a single user from a group
Remove-ADGroupMember -Identity "IT Team" -Members bgates -Confirm:$false

# Remove multiple users from a group
$users = @("bgates", "snadella", "pallen")
Remove-ADGroupMember -Identity "IT Team" -Members $users -Confirm:$false


