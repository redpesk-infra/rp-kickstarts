%include RedPesk-minimal.ks

# Firewall configuration
firewall --disable

# System bootloader configuration
bootloader --location=mbr --boot-drive=vda --append=" security=none"


%packages
tar

# specific for seanasim
# agl bidning installed via script in kojihub01
#agl-service-signal-composer
#murmur
#agl-service-can-low-level-ces2020
#agl-service-modbus
#autopilot-binding
%end
