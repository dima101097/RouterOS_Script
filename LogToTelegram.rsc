#Telegram set
:local ChatID XXXXXXX
:local Token botXXXXXXXXXXXXXXXXXX
########################

:local Time [/system clock get time];
:local TelegramMessageText;

:global ParseLogLoginEndArrayID;

:local IDsEvents [/log find where topics~"error"];
#:local IDsEvents [/log find where topics~"critical"];
#:local IDsEvents [/log find where topics~"system"];

:local LenArrayIDs [:len $IDsEvents];
:local StartArrayID [:find $IDsEvents $ParseLogLoginEndArrayID];
:local EndArrayID ($IDsEvents -> ($LenArrayIDs-1));

:if ($EndArrayID != $ParseLogLoginEndArrayID and [:tobool $ParseLogLoginEndArrayID] ) do={
    :for KeyArray from=($StartArrayID+1) to=($LenArrayIDs-1) do={
        :local IDMessage ($IDsEvents ->$KeyArray );
        :set TelegramMessageText "$TelegramMessageText %0D%0A  $[/log get number=$IDMessage time] - $[/log get number=$IDMessage message];";
        }
    :set ParseLogLoginEndArrayID $EndArrayID;
   [ /tool fetch url="https://api.telegram.org/$Token/sendMessage\?chat_id=$ChatID&text=$TelegramMessageText" output=user];
} else={
#No new messages
};
:set ParseLogLoginEndArrayID $EndArrayID;