#Telegram set
:local ChatID XXXXXXXXX
:local Token botXXXXXXXX
:local TelegramMessageText "A new version of ROS has been found.%0A"
########################

/system package update check-for-updates 

:local latestF [/system package update get latest-version ] 
:local curentF [/system package get [find name=routeros] version]
/put "Curent: $curentF "
/put "New: $latestF "
if ($curentF != $latestF) do={

/tool fetch url="https://api.telegram.org/$Token/sendMessage\?chat_id=$ChatID&text= $TelegramMessageText  Curent:  $curentF %0A  New:       $latestF " output=user
}
