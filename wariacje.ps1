$serverIps = @(gwmi Win32_NetworkAdapterConfiguration    | Where { $_.IPAddress }   | Select -Expand IPAddress  | Where { $_ -like '*.*.*.*' }  | Sort)


$name = @()
$name += 'Dupa1'

$n = 'code'
$n | Get-Member -MemberType Methods


Get-Service -Name ssh-agent
Get-CimInstance Win32_Service -filter *ssh*
$sshpath = @()
$sshpath += (Get-CimInstance Win32_Service | Where-Object {$_.Name -like 'ssh*'}).PathName | Split-Path -Parent
[int]$num = 0
