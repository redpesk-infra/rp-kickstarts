%packages
sec-smack-rules
sec-lsm-manager-smack
-selinux-policy
-selinux-policy-targeted
%end

# SELinux configuration
selinux --disabled

%post
echo "SECURITY_MODEL=\"smack\"" >> /etc/os-release
%end