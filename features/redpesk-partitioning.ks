# Note that only 3 primary parts are available (the 4th is used to create the extended parts)

# Setup specific partition scheme of redpesk
part /config    --fstype ext4 --size 500     --asprimary --label=config   --fsoptions="noatime,rw"
part /recovery  --fstype ext4 --size 500     --asprimary --label=recovery --fsoptions="noatime,rw"
part /      	--fstype ext4 --size 3500                --label=rootfs   --fsoptions="noatime,rw"
part /data  	--fstype ext4 --size 2000                --label=data     --fsoptions="noatime,rw" --grow

%post --nochroot --logfile=/mnt/sysroot/tmp/post-fstab.log --erroronfail
# Delete arm offset partition then update part tables
grep "offsettodelete" /mnt/sysroot/etc/fstab
if [[ $? == 0 ]]; then
	echo "Deleting offset partition..."
	sed -i "/offsettodelete/d" /mnt/sysroot/etc/fstab
	sfdisk --delete -f /dev/mapper/Redpesk-OS 1
	sfdisk -r -f /dev/mapper/Redpesk-OS
fi

echo "Setting UUID into /etc/fstab..."
grep "^/dev.*Redpesk*" /mnt/sysroot/etc/fstab | while read part ; do
	dev=$(echo $part | cut -d' ' -f1)
	label=$(echo $part | cut -d' ' -f2)
	label="${label:1}"
	if [[ "$label" == "" ]]; then
		label="rootfs"
	elif [[ "$label" == "boot/efi" ]]; then
		label="EFI"
	fi
	UUID=$(blkid -s UUID -o value `blkid -L $label`)
	echo "dev=$dev UUID=$UUID label=$label"
	sed -i "s|${dev}|UUID=\"${UUID}\"|g" /mnt/sysroot/etc/fstab
done
%end