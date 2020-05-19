

# System bootloader configuration
bootloader --location=mbr --boot-drive=vda

# Partitioning X86 images
autopart --nolvm
zerombr
# Partition clearing information
clearpart --none --initlabel