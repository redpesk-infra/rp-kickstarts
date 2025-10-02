%include arm.ks

%packages --ignoremissing --nocore --exclude-weakdeps
uboot-images-armv8
-grubby-deprecated
%end
