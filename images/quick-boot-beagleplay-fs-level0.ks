%include core-beagleplay.ks
%include ../distro/redpesk-minimal.ks
%include ../features/smack.ks

# Called at the end
#%include ../features/factory_backup.ks

%include level0.ks

bootloader --location=none --disabled
