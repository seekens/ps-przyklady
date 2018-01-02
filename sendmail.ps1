$key = [byte]35,31,32,46,55,11,09,08,11,34,67,99,12,16,15,50
$password = Get-Content C:\backup\Powiadomienia\notifi-it.txt | Convertto-SecureString -Key $key #przeniesc oprócz skryptu też plik z zaszyfrowanym hasłem
$login = "notifi-it"
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList $login,$password
$Sender = "notifi-it@o2.pl"
$Receipt = "pb@sacer.pl"
$Server = "poczta.o2.pl"
$Temat = $env:COMPUTERNAME+": Backup raport z dnia "+(get-date)
#$Tresc = Get-WBJob -Previous 1 | ConvertTo-Html -As List | Out-String
$Tresc = Get-WBJob -Previous 1 | Out-String
$Tresc1 = Get-WBJob -Previous 1
Send-MailMessage -To $Receipt -From $Sender -Subject $Temat -Body $Tresc -Encoding utf8 -SmtpServer $Server  -Credential $credential
$Tresc1 = Get-WBJob -Previous 1
