%post --nochroot
# Save pre and post action logs for extraction into koji
cp /mnt/sysroot/tmp/pre-*.log /chroot_tmpdir/lmc-logs
cp /mnt/sysroot/tmp/post-*.log /chroot_tmpdir/lmc-logs
%end