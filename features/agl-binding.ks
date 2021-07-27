%include ../packages/agl-binding.ks

%post --erroronfail --log /tmp/post-agl-binding_install.log
if [ -f /tmp/agl-binding-list ]; then
	source /tmp/agl-binding-list
	mkdir -p /var/lib/rp-firstboot/rpms
	LIST=$(rpm -qa --qf "%{NAME}\n" | grep binding | tr "\n" " ")
	dnf reinstall -y --enablerepo=redpesk-middleware* --disablerepo=*source* --disablerepo=*debug* --downloadonly --downloaddir=/var/lib/rp-firstboot/rpms $LIST
	dnf install -y --enablerepo=redpesk-middleware* --disablerepo=*source* --disablerepo=*debug* --downloadonly --downloaddir=/var/lib/rp-firstboot/rpms $AGL_BINDING
	rm /tmp/agl-binding-list
fi

#Clean DNF Cache
dnf clean all
%end