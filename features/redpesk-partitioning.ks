# Note that only 3 primary parts are available (the 4th is used to create the extended parts)

# Setup specific partition scheme of redpesk
part /config    --fstype ext4 --size 512     --asprimary --label=config   --fsoptions="noatime,rw"
part /recovery  --fstype ext4 --size 512     --asprimary --label=recovery --fsoptions="noatime,rw"
part /      	--fstype ext4 --size 3456                --label=rootfs   --fsoptions="noatime,rw"
part /data  	--fstype ext4 --size 2048                --label=data     --fsoptions="noatime,rw" --grow
