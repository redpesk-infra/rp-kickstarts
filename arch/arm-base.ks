# Additional repositories
repo --name="RedPesk" --baseurl="http://kojihub.lorient.iot/kojifiles/repos-dist/RedPesk-8--RedPesk-8-release/latest/aarch64/" --cost=1 --install
repo --name="RedPesk-Build" --baseurl="http://kojihub.lorient.iot/kojifiles/repos/RedPesk-8--RedPesk-8-build/latest/aarch64/" --cost=1 --install
#url --mirrorlist "https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-28&arch=aarch64"


%post --erroronfail --log /tmp/post-arch.log
# Because memory is scarce resource in most arm systems we are differing from the Fedora
# default of having /tmp on tmpfs.
echo "Disabling tmpfs for /tmp."
systemctl mask tmp.mount
%end


%packages
@arm-tools
extlinux-bootloader
%end