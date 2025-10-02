%include arm.ks

%packages --nocore --exclude-weakdeps
uboot-images-armv8
-grubby-deprecated
%end
