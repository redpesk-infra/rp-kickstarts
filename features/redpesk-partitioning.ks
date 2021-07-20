# Note that only 3 primary parts are available (the 4th is used to create the extended parts)

# Setup specific partition scheme for mbbox
part /config    --fstype ext4 --size 512     --asprimary --label=config   --fsoptions="noatime"
part /recovery  --fstype ext4 --size 512     --asprimary --label=recovery --fsoptions="noatime"
part /      	--fstype ext4 --size 3456                --label=rootfs   --fsoptions="noatime"
part /data  	--fstype ext4 --size 2048                --label=data     --fsoptions="noatime" --grow
