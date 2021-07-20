%post --erroronfail --log /tmp/post-readonly.log
# Setup fstab to mount file systems in ro mode
sed -i '/\/ /s/noatime /noatime,ro /g' /etc/fstab

# Create statetab.d folder to declare rw folder
mkdir -p /etc/statetab.d

echo "dirs /var" > /etc/statetab.d/var
echo "dirs /etc/ssh" > /etc/statetab.d/ssh-config

echo "files /etc/machine-id" >> /etc/statetab.d/others
echo "files /etc/localtime" >> /etc/statetab.d/others
echo "files /etc/hostname" >> /etc/statetab.d/others

# Enable support of READONLY rootfs into configfile
sed -i 's/READONLY=no/READONLY=yes/g' /etc/sysconfig/readonly-root
# Use config partition for stateless partition
sed -i 's/STATE_LABEL=stateless-state/STATE_LABEL=config/g' /etc/sysconfig/readonly-root

# Fix NetworkManager DNS resolving
rm -f /etc/resolv.conf
ln -sf /run/NetworkManager/resolv.conf /etc/resolv.conf

# Fix auditd log folder
mkdir -p /var/log/audit

# Enable fedora service for readonly rootfs by default
systemctl enable readonly-root
systemctl enable systemd-firstboot
%end

%packages
readonly-root
%end
