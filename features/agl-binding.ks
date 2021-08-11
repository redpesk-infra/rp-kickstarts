%include ../packages/agl-binding.ks

%post --erroronfail --log /tmp/post-agl-binding_install.log
RPMS_DIR="/var/lib/rp-firstboot/rpms"
if [ -f /tmp/agl-binding-list ]; then
	source /tmp/agl-binding-list
	mkdir -p $RPMS_DIR
	LIST=$(rpm -qa --qf "%{NAME}\n" | grep binding | tr "\n" " ")
	[ ! -z $LIST ] && dnf reinstall -y \
		--enablerepo=redpesk-middleware* --disablerepo=*source* --disablerepo=*debug* \
		--downloadonly --downloaddir=$RPMS_DIR \
		$LIST
	[ ! -z $AGL_BINDING ] && dnf install -y \
		--enablerepo=redpesk-middleware* --disablerepo=*source* --disablerepo=*debug* \
		--downloadonly --downloaddir=$RPMS_DIR \
		$AGL_BINDING
	rm /tmp/agl-binding-list
fi

#Clean DNF Cache
dnf clean all
%end