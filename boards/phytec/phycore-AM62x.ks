%include AM62x.ks
%include phytec_partitioning_msdos.ks

%post --erroronfail --log /tmp/post-phycore-AM62x.log

%end

%packages --ignoremissing --nocore --exclude-weakdeps
uboot
kernel-modules-extra
kernel-modules
phytec-wireless-firmware
%end