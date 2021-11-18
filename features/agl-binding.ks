%include ../packages/agl-binding.ks

%post --erroronfail --log /tmp/post-agl-binding_install.log
source /etc/os-release
if [[ $VERSION_ID == "33" ]]; then
	REPO="redpesk-agl-build"
else
	REPO="redpesk-*"
fi
RPMS_DIR="/var/lib/rp-firstboot/rpms"
if [ -f /tmp/agl-binding-list ]; then
	source /tmp/agl-binding-list
	mkdir -p $RPMS_DIR
	LIST=$(rpm -qa --qf "%{NAME}\n" | grep binding | tr "\n" " ")
	[ -n "${LIST}" ] && dnf reinstall -y \
		--enablerepo="$REPO" --disablerepo=*source* --disablerepo=*debug* --disablerepo=*candidate* \
		--downloadonly --downloaddir=$RPMS_DIR \
		${LIST}
	[ -n "${AGL_BINDING}" ] && dnf install -y \
		--enablerepo="$REPO" --disablerepo=*source* --disablerepo=*debug* --disablerepo=*candidate \
		--downloadonly --downloaddir=$RPMS_DIR \
		${AGL_BINDING}
	rm /tmp/agl-binding-list
fi

#Clean DNF Cache
dnf clean all
%end