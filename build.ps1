# Mac/Linux boxes don't come with Pester
# Windows has the old v3 in-box version of Pester
Install-Module Pester, VMware.PowerCLI -Scope CurrentUser -AllowClobber -SkipPublisherCheck -Force

Get-Module Pester, VMware.VimAutomation.Core -ListAvailable

# Invoke-Pester runs all .Tests.ps1 in the order found by "Get-ChildItem -Recurse"
Invoke-Pester -OutputFormat NUnitXml -OutputFile ".\TestResults.xml"
