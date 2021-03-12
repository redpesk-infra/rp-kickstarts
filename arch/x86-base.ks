

# System bootloader configuration
bootloader --location=mbr --boot-drive=vda --append="security=smack console=ttyS0"

# Partitioning X86 images
zerombr
# Partition clearing information
clearpart --none --initlabel
