### Migrating Explorer.exe NTLM hash leaks

Your IP + NTLM hashes could be exposed with a trick that is still been used by malware developers. This trick leaks data whenever you display a folder that contains a manipulated `desktop.ini`.


### Firewall blocking 

Here are basically the commands which you can create with the Windows own firewall. Windows Defender (Security Center) usually does not detect it because there are other outgoing connections (legitimate ones) bundled with Explorer.exe.


Restricting the connections, by only allow connections to the local subnet and only if the network is trusted.

```bash
netsh advfirewall firewall add rule name="Explorer (Local Subnet)" description="Local Subnet" group="Explorer hardening" dir=out action=allow profile=Private,Domain remoteip=localsubnet program="%SystemRoot%\explorer.exe"
```

#### Or as an alternative via PowerShell
```ps
New-NetFirewallRule -DisplayName 'Explorer (Local Subnet)' -Name 'Explorer (Local Subnet)' -Description 'Local Subnet' -Direction Outbound -Action Allow -Group 'Explorer hardening' profile=Private,Domain -RemoteAddress localsubnet Program "$([Environment]::GetFolderPath('Windows'))\explorer.exe"
```

#### Managing the network rules 

```bash
netsh advfirewall firewall set rule group="Explorer hardening" new enable=no
```

