%post --erroronfail --log /tmp/post-agl-binding_install.log
if [ -f /tmp/agl-binding-list ]; then
	source /tmp/agl-binding-list
	mkdir -p /var/lib/rp-firstboot/rpms
	dnf install -y --downloadonly --downloaddir=/var/lib/rp-firstboot/rpms $AGL_BINDING
	rm /tmp/agl-binding-list
fi
%end