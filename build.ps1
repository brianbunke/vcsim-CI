# Mac/Linux boxes don't come with Pester
# Windows has the old v3 in-box version of Pester
# I can't figure out how to silence this step in the Azure DevOps logs
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module Pester, VMware.PowerCLI -Repository PSGallery -Scope CurrentUser -AllowClobber -SkipPublisherCheck -Force

# For PowerCLI, opt out of CEIP and suppress self-signed cert errors
Set-PowerCLIConfiguration -Scope User -InvalidCertificateAction Ignore -ParticipateInCEIP $false -Confirm:$false

# Record module versions for potential troubleshooting purposes
Get-Module Pester, VMware.VimAutomation.Core -ListAvailable | Select-Object Version, Name | Format-Table -Autosize
