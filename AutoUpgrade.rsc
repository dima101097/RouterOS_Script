:local curentF [system routerboard get current-firmware]
:local upgradeF [system routerboard get upgrade-firmware]
delay delay-time=5s
if ($curentF != $upgradeF) do={
system routerboard upgrade
system reboot
}