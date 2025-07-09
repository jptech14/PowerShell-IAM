# Remove-ADUser
# Deactivate or delete users.
# Offboarding automation.

# Remove a user by username
Remove-ADUser -Identity "bgates" -Confirm:$false

# Remove a user by distinguished name
Remove-ADUser -Identity "CN=Bill Gates,OU=Sales,DC=contoso,DC=com" -Confirm:$false

# Remove multiple users from a CSV
# Create a CSV on your C Drive called users_to_remove.csv
Import-Csv "C:\users_to_remove.csv" | ForEach-Object {
    Remove-ADUser -Identity $_.SamAccountName -Confirm:$false
}

# Disable a user account
Disable-ADAccount -Identity "bgates"

# Disable users from a list
# Create a CSV on your C Drive called users_to_disable.csv
Import-Csv "C:\users_to_disable.csv" | ForEach-Object {
    Disable-ADAccount -Identity $_.SamAccountName
}
