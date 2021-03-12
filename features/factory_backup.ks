# NOTE: this features should be called at the end of your kickstart

%packages

%end


%post --nochroot --erroronfail --log /tmp/post-factory_backup.log
dir=$(mktemp -d)
cd /mnt/sysimage/
tar -cvpzf $dir/backup.tar.gz \
	--exclude=boot/firmware/* \
	--exclude=boot/efi/* \
	--exclude=recovery/* \
	--exclude=data/* \
	--exclude=config/* \
	--exclude=dev/* \
	--exclude=proc/* \
	--exclude=run/* \
	--exclude=sys/* \
	.
cd -
mv $dir/backup.tar.gz /mnt/sysimage/recovery/
rmdir $dir
%end