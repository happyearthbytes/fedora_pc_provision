#!/usr/bin/env bash

echo "================================================================================"
dmesg -l err
echo "----------------------------------------"
echo "# > dmesg"
echo "================================================================================"
sudo cat -n /var/log/boot.log 2>&1 |egrep "FAILED|----" -A2 -B3
echo "----------------------------------------"
echo "# > cat -n /var/log/boot.log"
echo "================================================================================"
systemd-analyze blame | head -n 5
echo "----------------------------------------"
echo "# > systemd-analyze blame"
echo "================================================================================"
sudo systemctl --failed
echo "----------------------------------------"
qecho "# > systemctl --failed"
echo "================================================================================"
systemd-analyze critical-chain
echo "----------------------------------------"
echo "# > systemd-analyze critical-chain --fuzz=0.1"
echo "# > sudo systemd-analyze plot > ~/bootplot.svg; xdg-open ~/bootplot.svg"
echo "# > systemctl --reverse list-dependencies network-online.target"
echo "# > systemctl list-dependencies network-online.target"
echo "================================================================================"

cat << EOF
sudo inxi -Fxxxrz
sudo cat -n /var/log/boot.log 2>&1 | sed -e 's/\r/\n#/g' | sed '/^#$/ d' | egrep "^#|----" -A2 -B5
sudo systemctl cat systemd-networkd-wait-online.service
systemctl show -p WantedBy network-online.target
systemd-analyze critical-chain network-online.target
systemctl reset-failed
networkctl list
nmcli device status
networkctl status --full --all --stats
# sudo ls -l /etc/netconfig /etc/NetworkManager /etc/networks
EOF

echo "================================================================================"

