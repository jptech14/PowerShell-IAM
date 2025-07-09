# ADUserResultantPasswordPolicy
# Determine effective password policy for a user.

# Troubleshooting Password Issues
Get-ADUserResultantPasswordPolicy -Identity bgates

# Auditing and Compliance
Get-ADUserResultantPasswordPolicy -Identity administrator

# Verifying FGPP Application
Get-ADUserResultantPasswordPolicy -Identity "bgates"

# Script to audit multiple users
$users = Get-ADUser -Filter * -SearchBase "OU=Employees,DC=contoso,DC=com"
foreach ($user in $users) {
    $policy = Get-ADUserResultantPasswordPolicy -Identity $user.SamAccountName
    [PSCustomObject]@{
        UserName = $user.SamAccountName
        PolicyName = $policy.Name
        MinPasswordLength = $policy.MinPasswordLength
        MaxPasswordAge = $policy.MaxPasswordAge
    }
}
