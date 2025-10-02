%include s32g2.ks

%post --erroronfail --log /tmp/post-s32g2.log
# Set your board specific post actions here
dd if=/usr/lib/firmware/fip.s32 of=/dev/mapper/Redpesk-OS conv=notrunc,fsync seek=512 skip=512 oflag=seek_bytes iflag=skip_bytes

%end

%packages --nocore --exclude-weakdeps
arm-trusted-firmware
pfe-firmware
uboot
%end
