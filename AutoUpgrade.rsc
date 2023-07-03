:local curentF [system routerboard get current-firmware]
:local upgradeF [system routerboard get upgrade-firmware]

if ($curentF != $upgradeF) do={
system routerboard upgrade
system reboot
}