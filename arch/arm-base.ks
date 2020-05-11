# Additional repositories

%post --erroronfail --log /tmp/post-arch.log
# Because memory is scarce resource in most arm systems we are differing from the Fedora
# default of having /tmp on tmpfs.
echo "Disabling tmpfs for /tmp."
systemctl mask tmp.mount
%end


%packages
@arm-tools
-extlinux-bootloader
%end