%include ../../arch/x86-base.ks


%post --erroronfail --log /tmp/post-board.log
# Install is made using nomodeset flag but we don't need it to use the system.
# It works alright. Only needed for RedPesk 8
sed -i -r 's: ?nomodeset ?::' /etc/default/grub
dracut --force --regenerate-all
%end