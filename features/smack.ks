# To avoid calling bootloader command many time,
# kernel security=smack option have been move to x86-base.ks.

%packages
smack-rules
%end
