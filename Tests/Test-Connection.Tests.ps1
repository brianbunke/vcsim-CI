Describe 'Connectivity' {
    It 'Sees the Docker container' {
        Test-Connection localhost -TCPPort 443 | Should -BeTrue
    }
}
