
%packages
-alsa-sof-firmware
-cracklib-dicts
-langpacks-en
-mozjs78
-geolite2-country
-geolite2-city
-gawk-all-langpacks
-sssd-kcm
-sssd-common
-zram-generator-defaults
%end

%post --erroronfail --log /tmp/post-clean.log

#Delete all manuals
rm -rf /usr/share/man
rm -rf /usr/share/doc

#Clean DNF Cache
dnf clean all

#Clean journal
journalctl --rotate
journalctl --vacuum-time=1s

#Clean local according filesystem rpm request
for list in `rpm -ql filesystem | grep "/usr/share/locale/"`; do [[ $list != *"LC_MESSAGES" ]] && basename $list >> /tmp/filter ;done
for folder in `ls /usr/share/locale`; do
    if [[ -d /usr/share/locale/$folder ]]; then
        grep -q $folder /tmp/filter && echo "Keeping $folder"
        grep -q $folder /tmp/filter || (echo "Deleting $folder" && rm -rf /usr/share/locale/$folder)
    else
        echo "$folder is a file"
    fi
done

%end