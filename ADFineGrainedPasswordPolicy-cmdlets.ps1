# Get-ADFineGrainedPasswordPolicy
# View fine-grained password policies
# Password policy auditing

# Auditing Password Policies
Get-ADFineGrainedPasswordPolicy -Filter *

# Checking Which Policy Applies to a User
Get-ADUserResultantPasswordPolicy -Identity username

# Viewing Specific Policy Details
Get-ADFineGrainedPasswordPolicy -Identity "PolicyName"

# Export FGPPs for documentation or reporting
Get-ADFineGrainedPasswordPolicy -Filter * | 
Select-Object Name, MinPasswordLength, LockoutDuration, Precedence |
Export-Csv -Path "C:\FGPP_Report.csv" -NoTypeInformation
