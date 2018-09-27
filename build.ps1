<#
# Mac/Linux boxes don't come with Pester
# Windows has the old v3 in-box version of Pester
Install-Module Pester -Scope CurrentUser -AllowClobber -SkipPublisherCheck -Force
Install-Module VMware.PowerCLI

Get-Module Pester, VMware.VimAutomation.Core -ListAvailable

Connect-VIServer -Server 192.168.0.1 -User u -Password p -Port 443
Get-VM

# Invoke-Pester runs all .Tests.ps1 in the order found by "Get-ChildItem -Recurse"
Invoke-Pester -OutputFormat NUnitXml -OutputFile ".\TestResults.xml"
#>

Test-Connection 192.168.0.1 -TCPPort 443
