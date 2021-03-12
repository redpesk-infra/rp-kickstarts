#NOTE: This feature needs a specific recovery partition mounted into /recovery
%include initramfs.ks

%packages
uboot-tools
%end

%post --erroronfail --log /tmp/post-recovery.log
if [[ `rpm -E %{_arch}` == "aarch64" ]]; then
	cp /boot/kernel.img /recovery/recovery.img
elif [[ `rpm -E %{_arch}` == "x86_64" ]]; then
	cp /boot/vmlinuz*x86_64 /recovery/recovery.img
else
	echo "WARN: recovery not supported for this arch."
fi
sed -i '/recovery/d' /etc/fstab
%end
