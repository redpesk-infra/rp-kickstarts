%include ulcb.ks

%post --erroronfail --log /tmp/post-board.log
%end


%packages
# Yocto BSP kernel
kernel-4.14.75+git0+59ccbcefae-r1+m3ulcb
kernel-modules-4.14.75+git0+59ccbcefae-r1+m3ulcb
%end
