{
/tool fetch url="https://wtfismyip.com/text" mode=https dst-path=ip.txt
local ip [file get ip.txt contents ]
put $ip
}