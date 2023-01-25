%include ../packages/agl-binding.ks

%post --nochroot --erroronfail --log /mnt/sysroot/tmp/post-agl-binding_install.log
# Exit script on first error as this step is mandatory for package installation
set -e

# Use mock dnf config file to be able to access repository
CONFIG_FILE="/etc/dnf/dnf.conf"
CHROOT_DIR="/mnt/sysimage"
RPMS_DIR=${CHROOT_DIR}"/var/lib/rp-firstboot/rpms"

alias dnf_ks='dnf -c ${CONFIG_FILE} --installroot=${CHROOT_DIR}'
# For debug purpose
dnf_ks repolist -v

if [ -f ${CHROOT_DIR}/tmp/agl-binding-list ]; then
	source ${CHROOT_DIR}/tmp/agl-binding-list
	mkdir -p ${RPMS_DIR}
	LIST=$(rpm --root=${CHROOT_DIR} -qa --qf "%{NAME}\n" | grep binding | tr "\n" " ")
	[ -n "${LIST}" ] && dnf_ks reinstall -y \
		--downloadonly --downloaddir=${RPMS_DIR} \
		${LIST}
	[ -n "${AGL_BINDING}" ] && dnf_ks install -y \
		--downloadonly --downloaddir=${RPMS_DIR} \
		${AGL_BINDING}
	rm ${CHROOT_DIR}/tmp/agl-binding-list
fi

#Clean DNF Cache
dnf_ks clean all
%end