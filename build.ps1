# Mac/Linux boxes don't come with Pester
# Windows has the old v3 in-box version of Pester
# I can't figure out how to silence this step in the Azure DevOps logs
Install-Module Pester, VMware.PowerCLI -Scope CurrentUser -AllowClobber -SkipPublisherCheck -Force

Get-Module Pester, VMware.VimAutomation.Core -ListAvailable | Select-Object Version, Name | Format-Table -Autosize

# Invoke-Pester runs all .Tests.ps1 in the order found by "Get-ChildItem -Recurse"
$TestResults = Invoke-Pester -OutputFormat NUnitXml -OutputFile ".\TestResults.xml" -PassThru

# Fail the build if any tests failed
If ($TestResults.FailedCount -ne 0) {
    Write-Error "Failed '$($TestResults.FailedCount)' tests, build failed"
}
