Describe 'Connectivity' {
    If ($PSVersionTable.PSVersion.Major -ge 6) {
        It 'Sees the Docker container' {
            Test-Connection localhost -TCPPort 443 | Should -BeTrue
        }
    } Else {
        It 'Sees the Docker container' -Skip
    }
}

Describe 'PowerCLI' {
    Connect-VIServer -Server localhost -Port 443 -User u -Pass p -Force

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
