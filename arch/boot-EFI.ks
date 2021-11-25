# Partitioning X86 images
zerombr
clearpart --all --initlabel --disklabel=gpt

part /boot/efi  --fstype FAT32 --size 500    --asprimary --label=EFI
