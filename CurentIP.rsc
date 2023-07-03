global curentIP [/ip address get [/ip address find interface=ether1 ] address] 
global oldIP [file get ipAdrres.txt contents]
if ($curentIP != $oldIP ) do={
    file set ipAdrres.txt contents=$curentIP  

local dnsName [ip cloud get dns-name]
/tool fetch url="https://api.telegram.org/botXXXXXXXXXXX/sendMessage\?chat_id=XXXXXXXXX&text=New IP= $curentIP %0Aor%0A$dnsName " dst-path=Telegram.txt
} 

 
