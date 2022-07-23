if ((Get-WinSystemLocale)[0].Name -eq "fr-FR")   
  { 
  netsh wlan show profiles | Select-String "\:(.+)$" | %{$SSID=$_.Matches.Groups[1].Value.Trim(); $_}  |  %{(netsh wlan show profile name=$SSID key=clear)}  | Select-String "Contenu de la clé\W+\:(.+)$"  | %{$cle=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ SSID=$SSID;CLE=$cle }} | Format-Table -AutoSize
  }
 else 
  netsh wlan show profiles | Select-String "\:(.+)$" | %{$SSID=$_.Matches.Groups[1].Value.Trim(); $_}  |  %{(netsh wlan show profile name=$SSID key=clear)}  | Select-String "Key Content\W+\:(.+)$"  | %{$cle=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ SSID=$SSID;CLE=$cle }} | Format-Table -AutoSize
