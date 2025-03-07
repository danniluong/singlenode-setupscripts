#!/usr/bin/env bash

echo "Creating directory /u01 and mapping /dev/sdc1"
mkdir -p  /u01
mount /dev/sdc1 /u01

echo "Creating directory structure in /u01"
mkdir -p  /u01/tic/var/lib/docker /u01/tic/var/lib/etcd /u01/tic/var/lib/icp /u01/tic/var/lib/kubelet /u01/tic/var/log/cloudsight /u01/tic/opt/ibm-cloud-private-3.2.0  /u01/tic/var/lib/etcd-wal /u01/tic/var/lib/registry /u01/tic/var/lib/icp/va /u01/tic/tmp/install

echo "Creating /var directory structure"
mkdir -p /var/lib/docker /var/lib/etcd /var/lib/icp /var/lib/kubelet /var/log/cloudsight /var/lib/etcd-wal /var/lib/registry

# Create mountpoint for cluster config
echo "Create mountpoint for cluster config"
mkdir -p /opt/ibm-cloud-private-3.2.0
chown -R icpuser:icpuser /opt/ibm-cloud-private-3.2.0

# Create mountpoint for cluster config
echo "Create mountpoint for temp install"
mkdir -p /tmp/install
chown -R icpuser:icpuser /tmp/install
chown -R icpuser:icpuser /u01/tic/tmp

# Create storage point for cluster config
echo "Create storage point for cluster config"
mkdir -p /u01/tic/ibm-cloud-private-3.2.0

# Setup mount
echo "Update fstab"
cat <<EOF >>/etc/fstab
/u01/tic/var/lib/docker /var/lib/docker  ext4 bind,nofail    0       0
/u01/tic/var/lib/etcd /var/lib/etcd  ext4 bind,nofail    0       0
/u01/tic/var/lib/icp /var/lib/icp  ext4 bind,nofail    0       0
/u01/tic/var/lib/kubelet /var/lib/kubelet  ext4 bind,nofail    0       0
/u01/tic/var/log/cloudsight /var/log/cloudsight  ext4 bind,nofail    0       0
/u01/tic/opt/ibm-cloud-private-3.2.0 /opt/ibm-cloud-private-3.2.0   ext4 bind,nofail    0       0
/u01/tic/var/lib/etcd-wal /var/lib/etcd-wal  ext4 bind,nofail    0       0
/u01/tic/var/lib/registry  /var/lib/registry ext4 bind,nofail    0       0
/u01/tic/tmp/install  /tmp/install ext4 bind,nofail    0       0
EOF

echo "Mounting..."
mount -a
