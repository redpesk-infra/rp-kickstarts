%include distro/RedPesk-seanasim.ks
%include boards/renesas/h3.ks
%include features/smack.ks


# set hostname
network --hostname CES2020-h3ulcb


%post
mkdir -p /usr/local/lib/systemd/system/
cat << EOF >> /usr/local/lib/systemd/system/rp-setup.service
[Unit]
Description=Initial Setup reconfiguration mode trigger service
After=plymouth-quit-wait.service
After=afm-system-daemon.service
After=NetworkManager-wait-online.service
Wants=NetworkManager-wait-online.service
ConditionPathExists=/.unconfigured

[Service]
Type=oneshot
TimeoutSec=0
RemainAfterExit=yes
ExecStartPre=/usr/bin/wget http://kojihub01.lorient.iot/rp-setup-m3ulcb -O /usr/libexec/rp-setup
ExecStart=/usr/bin/bash -c "source /usr/libexec/rp-setup"
ExecStartPost=/usr/bin/rm -f /.unconfigured
TimeoutSec=0
RemainAfterExit=no

[Install]
WantedBy=graphical.target
WantedBy=multi-user.target
EOF

touch /.unconfigured
systemctl enable rp-setup.service
%end