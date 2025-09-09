# PS script to an AD Security Groups passwords to not expire.
# Replace 'YourGroupName' with the name of your security group.
$groupName = "YourGroupName"

# Get all members of the group
$groupMembers = Get-ADGroupMember -Identity $groupName -Recursive | Where-Object { $_.objectClass -eq 'user' }

# Set 'PasswordNeverExpires' to true for each user
foreach ($user in $groupMembers) {
    Set-ADUser -Identity $user.SamAccountName -PasswordNeverExpires $true
    Write-Host "Set PasswordNeverExpires for user: $($user.SamAccountName)"
}