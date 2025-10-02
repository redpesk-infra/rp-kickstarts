%include ../../arch/arm-base.ks

%post --erroronfail --log /tmp/post-AM62x.log

%end


%packages --ignoremissing --nocore --exclude-weakdeps

%end