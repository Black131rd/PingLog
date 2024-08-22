$ipAddress = "8.8.8.8"
$outputFile = [System.IO.Path]::Combine([Environment]::GetFolderPath("Desktop"), "ping_results.txt")

function Ping-IpAddress {
    while ($true) {
        $pingResult = Test-Connection -ComputerName $ipAddress -Count 1 -ErrorAction SilentlyContinue
        if ($pingResult) {
            $status = "Reply from $($pingResult.Address): time=$($pingResult.ResponseTime)ms"
        } else {
            $status = "Request timed out"
        }
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $output = "$($timestamp): $($status);"
        Add-Content -Path $outputFile -Value $output
        Write-Output $output
        Start-Sleep -Seconds 1
    }
}

Ping-IpAddress
