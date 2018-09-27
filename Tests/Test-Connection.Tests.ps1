Describe 'Connectivity' {
    It 'Sees the Docker container' {
        Test-Connection 192.168.0.1 -TCPPort 443 | Should -BeTrue
    }
}
