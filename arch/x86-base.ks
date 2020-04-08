# Additional repositories
repo --name="RedPesk" --baseurl="http://kojihub.lorient.iot/kojifiles/repos-dist/RedPesk-8--RedPesk-8-release/latest/x86_64/" --cost=1 --install
repo --name="RedPesk-Build" --baseurl="http://kojihub.lorient.iot/kojifiles/repos/RedPesk-8--RedPesk-8-build/latest/x86_64/" --cost=1 --install
#url --mirrorlist "https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-28&arch=x86_64"

# System bootloader configuration
bootloader --location=mbr --boot-drive=vda