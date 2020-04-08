%include ulcb.ks

# Additional repositories
repo --name="h3ulcb-bsp" --baseurl="http://kojihub.lorient.iot/kojifiles/repos/H3-bsp--RedPesk-8-build/latest/aarch64/" --cost=1 --install


%post --erroronfail --log /tmp/post-board.log
# work around for poor key import UI in PackageKit
rm -f /var/lib/rpm/__db*
releasever=$(rpm -q --qf '%{version}\n' fedora-release)
basearch=aarch64

cat << EOF >> /etc/yum.repos.d/redpesk-rcar-h3ulcb.repo
[h3ulcb-bsp]
name=Redpesk h3ulcb BSP $releasever - $basearch
failovermethod=priority
#baseurl=http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/
#metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch
baseurl=http://kojihub.lorient.iot/kojifiles/repos/H3-bsp--RedPesk-8-build/latest/aarch64/
enabled=1
#metadata_expire=7d
#repo_gpgcheck=0
type=rpm
gpgcheck=0
skip_if_unavailable=False
EOF
%end


%packages
# Yocto BSP kernel
kernel-4.14.75+git0+59ccbcefae-r1+h3ulcb
kernel-modules-4.14.75+git0+59ccbcefae-r1+h3ulcb
%end
