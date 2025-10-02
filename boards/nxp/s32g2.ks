%include ../../arch/arm-base.ks

# S32G2 SOC seems to only read MBR disk type
zerombr
clearpart --all --disklabel=msdos

# Add an offset on the first part (/boot) to let some space for firmware
part /boot --fstype vfat --size 200 --asprimary --label=boot --start=10 --mkfsoptions="-F 32"

%post --erroronfail --log /tmp/post-s32g2.log
# Set your board specific post actions here
%end

%packages --nocore --exclude-weakdeps

%end
