#!/bin/bash

### DHCPD configuration
#apt-get update
#apt-get install -y isc-dhcp-server
#cp /config/ressources/dhcpd.conf /etc/dhcp/dhcpd.conf
#cp /config/ressources/isc-dhcp-server /etc/default/isc-dhcp-server
#echo "local7.* -/var/log/dhcp.log" >> /etc/rsyslog.conf
#systemctl restart rsyslog
#systemctl restart isc-dhcp-server

### TFTPD configuration
#apt-get install -y tftpd-hpa
#cp /config/ressources/tftpd-hpa /etc/default/tftpd-hpa
mkdir /tftpboot
cp -R /config/ressources/pxelinux.cfg /tftpboot
cp -R /config/ressources/syslinux /tftpboot
cp /config/ressources/pxelinux.0 /tftpboot
#systemctl restart tftpd-hpa

### PXE configuration
#apt-get install -y pxelinux # Figure it out

# Install rkt - already in mounted volume to save some time
# wget https://github.com/rkt/rkt/releases/download/v1.29.0/rkt-v1.29.0.tar.gz -P /config
tar -xzf /config/rkt-v1.29.0.tar.gz -C /config
cp /config/rkt-v1.29.0/rkt /usr/bin/
mkdir -p /usr/lib/rkt/stage1-images
cp /config/rkt-v1.29.0/stage1-coreos.aci /usr/lib/rkt/stage1-images/

# Start dnsmasq, TODO: start dnsmasq in rkt container

cp /config/dnsmasq.conf /etc/dnsmasq.conf
echo | apt-get install -y dnsmasq


# cp /config/bootstrap/dnsmasq.service /etc/systemd/system/

# sudo groupadd -g 333 rkt
# usermod -a -G rkt vagrant





