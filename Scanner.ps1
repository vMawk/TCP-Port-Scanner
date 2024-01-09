Function Scan-TCPPorts {
    Write-Host
    Write-Host "=== TCP Port Scanner ===" -ForegroundColor Yellow
    Write-Host
    Write-Output "***********************************************************"
    Write-Output "***                                                     ***"
    Write-Output "***                   Created by vMawk                  ***"
    Write-Output "***               https://github.com/vmawk              ***"
    Write-Output "***                                                     ***"
    Write-Output '***********************************************************'

    $hosts = Read-Host "Enter a comma-separated list of IPs"
    $ports = Read-Host "Enter a comma-separated list of ports"
    $out_file = Read-Host "Enter the output file name (default: scanresults.csv on desktop)"

    if ([string]::IsNullOrWhiteSpace($out_file)) {
        $out_file = "$env:USERPROFILE\desktop\scanresults.html"
    }

    $hosts = $hosts -split ","
    $ports = $ports -split ","

    # If no ports are specified
    if (!$ports) {
        Write-Host "Usage  : Scan-TCPPorts" -ForegroundColor Yellow
        Write-Host "Example: Scan-TCPPorts" -ForegroundColor Green
        Write-Host
        return
    }

    Write-Host
    Write-Host "Beginning scan at $(Get-Date)" -ForegroundColor Magenta
    Write-Host

    # Creating an array to store results before exporting to CSV
    $results = @()

    foreach ($port in $ports) {
        foreach ($ip in $hosts) {
            $tcpClient = New-Object System.Net.Sockets.TcpClient
            $connection = $tcpClient.BeginConnect($ip, $port, $null, $null)

            $result = "Filtered"

            if ($connection.AsyncWaitHandle.WaitOne(100)) {
                try {
                    $tcpClient.EndConnect($connection)
                    $result = "Open"
                    Write-Host "$ip $port (Open)" -ForegroundColor Green -Separator " ==> "
                } catch {
                    $result = "Closed"
                    Write-Host "$ip $port (Closed)" -ForegroundColor Red -Separator " ==> "
                }
            } else {
                Write-Host "$ip $port (Filtered)" -ForegroundColor Yellow -Separator " ==> "
            }

            $tcpClient.Close()

            $msg = [PSCustomObject]@{
                "IP" = $ip
                "Protocol" = "TCP"
                "Port" = $port
                "Result" = $result
            }

            # Append $results array with custom object
            $results += $msg
        }
    }

    # Export the array to CSV with formatted headers
    $results | Export-Csv -Path $out_file -NoTypeInformation -Force

    Write-Host
    Write-Host "Scan finished at $(Get-Date)" -ForegroundColor Magenta
}

# Uncomment the following line if you want to run the scan when the script is loaded
# Scan-TCPPorts
