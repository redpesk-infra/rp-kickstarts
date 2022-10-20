%packages
sec-lsm-manager-selinux
selinux-policy
selinux-policy-minimum
-selinux-policy-targeted
%end

%post
set -x
echo "SECURITY_MODEL=\"selinux\"" >> /etc/os-release

load_policy -qi
setfiles -v /etc/selinux/minimum/contexts/files/file_contexts /

%end
