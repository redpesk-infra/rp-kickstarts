%include images/minimal-beagleplay.ks
%include features/smack.ks
%include features/extract_logs.ks

%packages
cage-gtk-demo
%end

# Disabling bootloader for ARM images
bootloader --location=none --disabled

%post 
systemctl set-default graphical.target
%end