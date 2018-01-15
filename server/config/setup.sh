#!/bin/bash

# Prepare TFTP boot dirs
mkdir /tftpboot
cp -R /config/resources/pxelinux.cfg /tftpboot
cp -R /config/resources/syslinux /tftpboot
cp /config/resources/pxelinux.0 /tftpboot

# Install rkt - already in mounted volume to save some time
# wget https://github.com/rkt/rkt/releases/download/v1.29.0/rkt-v1.29.0.tar.gz -P /config
tar -xzf /config/rkt-v1.29.0.tar.gz -C /config
cp /config/rkt-v1.29.0/rkt /usr/bin/
mkdir -p /usr/lib/rkt/stage1-images
cp /config/rkt-v1.29.0/stage1-coreos.aci /usr/lib/rkt/stage1-images/
# sudo groupadd -g 333 rkt
# usermod -a -G rkt vagrant

# Start dnsmasq, TODO: start dnsmasq in rkt container
cp /config/resources/dnsmasq.conf /etc/dnsmasq.conf
echo | apt-get install -y dnsmasq




