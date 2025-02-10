:local curentF [/system package get [find name=routeros] version]
:local upgradeF [system routerboard get upgrade-firmware]

if ($curentF != $upgradeF) do={
system routerboard upgrade
system reboot
}