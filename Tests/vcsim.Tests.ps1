Describe 'Connectivity' {
    It 'Sees the Docker container' {
        If ($env:Agent_OS -like '*windows*') {
            # Not pwsh v6.1
            Test-Connection localhost -Count 1 -Quiet | Should -BeTrue
        } Else {
            # Use pwsh v6.1 port parameter
            Test-Connection localhost -TCPPort 443 | Should -BeTrue
        }
    }
}

Describe 'PowerCLI' {
    Set-PowerCLIConfiguration -Scope User -InvalidCertificateAction Ignore -ParticipateInCEIP $false -Confirm:$false

    Connect-VIServer -Server localhost -Port 443 -User u -Pass p

    It 'Returns one datacenter' {
        (Get-Datacenter).Count | Should -Be 1
    }
    It 'Returns four hosts' {
        (Get-VMHost).Count | Should -Be 4
    }
    It 'Returns four VMs' {
        (Get-VM).Count | Should -Be 4
    }
}
