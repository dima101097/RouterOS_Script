:local BridgeName bridge_local;   ## Name bridge
:local WANPort ether1;        ## WAN interface name 
:local DownloadLimit 70M;      ## Maximum download speed in megabits 
:local UploadLimit 70M;        ## Maximum upload speed in megabits

/ip firewall mangle
add action=mark-packet chain=forward comment=UploadToEther in-interface=$BridgeName new-packet-mark="client_upload" out-interface=$WANPort passthrough=yes
add action=mark-packet chain=prerouting comment=DownloadToEther in-interface=$WANPort new-packet-mark="client_download" passthrough=yes

/queue type
add kind=pcq name="PCQ_download" pcq-classifier="dst-address" pcq-total-limit=6400KiB
add kind=pcq name="PCQ_upload" pcq-classifier="src-address" pcq-total-limit=6400KiB

/queue tree
add name=Dowload parent=global queue=default
add name=Upload parent=global queue=default

add max-limit=$DownloadLimit name="WAN_Dowload" packet-mark="client_download" parent=Dowload queue="PCQ_download"
add max-limit=$UploadLimit name="WAN_Upload" packet-mark="client_upload" parent=Upload queue="PCQ_upload"
