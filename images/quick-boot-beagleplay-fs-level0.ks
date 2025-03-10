%include core-beagleplay.ks
%include ../distro/redpesk-minimal.ks
%include features/smack.ks

# Called at the end
#%include ../features/factory_backup.ks

%packages
#--------------level 0
#--------------level 1
#--------------level 2
#--------------level 3
#--------------level 4
#--------------
%end

bootloader --location=none --disabled
