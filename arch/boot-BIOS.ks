# Partitioning X86 images
zerombr

# Partition clearing information
clearpart --none --initlabel --disklabel=msdos

part /boot  --fstype ext4 --size 500    --label=boot
