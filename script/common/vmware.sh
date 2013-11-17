#!/bin/sh

# Mount setup file
mkdir -p /mnt/vmware
mount -o loop /home/vagrant/linux.iso /mnt/vmware

# Extract setup setup
cd /tmp
tar xzf /mnt/vmware/VMwareTools-*.tar.gz

# Unmount setup file
umount /mnt/vmware
rm -f /home/vagrant/linux.iso

# Apply patch
cd /tmp/vmware-tools-distrib/
wget --no-check-certificate https://raw.github.com/ebdevrepo/bin/master/vmware9.compat_mm.patch
wget --no-check-certificate https://raw.github.com/ebdevrepo/bin/master/vmware_hgfs_fix.sh
chmod +x vmware_hgfs_fix.sh
./vmware_hgfs_fix.sh

# Execute setup
/tmp/vmware-tools-distrib/vmware-install.pl --default

# Clean
rm -fr /tmp/vmware-tools-distrib
