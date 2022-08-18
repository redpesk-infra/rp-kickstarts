%packages
sec-lsm-manager-selinux
selinux-policy
selinux-policy-minimum
-selinux-policy-targeted
%end

%post
echo "SECURITY_MODEL=\"selinux\"" >> /etc/os-release

setfiles -v /etc/selinux/minimum/contexts/files/file_contexts /

%end