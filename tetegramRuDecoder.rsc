# Function Converter of Russian characters for sending in Telegram
# by Sertik 09/09/2020
# usage [$FuncStrToTele "Строка String .,!+"]

:global FuncStrToTele do={
:local string; :set $string $1;

#  table of the codes of Russian letters UTF8
:local rsimv [:toarray {"А"="D090"; "Б"="D091"; "В"="D092"; "Г"="D093"; "Д"="D094"; "Е"="D095"; "Ж"="D096"; "З"="D097"; "И"="D098"; "Й"="D099"; "К"="D09A"; "Л"="D09B"; "М"="D09C"; "Н"="D09D"; "О"="D09E"; "П"="D09F"; "Р"="D0A0"; "С"="D0A1"; "Т"="D0A2"; "У"="D0A3"; "Ф"="D0A4"; "Х"="D0A5"; "Ц"="D0A6"; "Ч"="D0A7"; "Ш"="D0A8"; "Щ"="D0A9"; "Ъ"="D0AA"; "Ы"="D0AB"; "Ь"="D0AC"; "Э"="D0AD"; "Ю"="D0AE"; "Я"="D0AF"; "а"="D0B0"; "б"="D0B1"; "в"="D0B2"; "г"="D0B3"; "д"="D0B4"; "е"="D0B5"; "ж"="D0B6"; "з"="D0B7"; "и"="D0B8"; "й"="D0B9"; "к"="D0BA"; "л"="D0BB"; "м"="D0BC"; "н"="D0BD"; "о"="D0BE"; "п"="D0BF"; "р"="D180"; "с"="D181"; "т"="D182"; "у"="D183"; "ф"="D184"; "х"="D185"; "ц"="D186"; "ч"="D187"; "ш"="D188"; "щ"="D189"; "ъ"="D18A"; "ы"="D18B"; "ь"="D18C"; "э"="D18D"; "ю"="D18E"; "я"="D18F"; "Ё"="D001"; "ё"="D191"; "№"="0023"}]

# encoding of the symbols and аssembly line
:local StrTele ""; :local code "";
:for i from=0 to=([:len $string]-1) do={:local keys [:pick $string $i (1+$i)]; :local key ($rsimv->$keys); if ([:len $key]!=0) do={:set $code ("%"."$[:pick ($rsimv->$keys) 0 2]"."%"."$[:pick ($rsimv->$keys) 2 4]");} else={:set $code $keys}; :set $StrTele ("$StrTele"."$code")}

:return $StrTele;
}