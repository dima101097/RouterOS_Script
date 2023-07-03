:local fileExists [/file find name="cAP_Version.txt"]
:local localFilePath "/pub/"
:if ($fileExists != "") do={
    :local curentF [system routerboard get current-firmware]
    :local cAPv [file/get cAP_Version.txt contents ]
    if ($cAPv != $curentF) do={
        :local updateFile "routeros-$curentF-arm.npk" 
        if ( updateFile != "") do={
        log/warning  message="Dowload START"
        /tool fetch url="https://download.mikrotik.com/routeros/$curentF/routeros-$curentF-arm.npk" mode=http dst-path=$localFilePath
        log/warning  message="Dowload OK"
        file/set cAP_Version.txt contents=[/system/routerboard get current-firmware ]
        }
    }
} else={
   file/add name=cAP_Version.txt
   file/set cAP_Version.txt contents=[/system/routerboard get current-firmware ]
}