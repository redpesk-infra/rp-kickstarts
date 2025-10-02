%include ../../arch/arm-base.ks
# %include ../../arch/arm-boot-msdos-vfat.ks

%post --erroronfail --log /tmp/post-AM62x.log

%end


%packages --ignoremissing --nocore --exclude-weakdeps

%end