#!/bin/bash

echo "🔧 Patching repo files for CentOS Stream 9..."

# BaseOS
cat <<EOF | sudo tee /etc/yum.repos.d/CentOS-Stream-BaseOS.repo > /dev/null
[baseos]
name=CentOS Stream \$releasever - BaseOS
mirrorlist=https://mirrors.centos.org/metalink?repo=centos-baseos-9-stream&arch=\$basearch&protocol=https
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
sslverify=0
EOF

# AppStream
cat <<EOF | sudo tee /etc/yum.repos.d/CentOS-Stream-AppStream.repo > /dev/null
[appstream]
name=CentOS Stream \$releasever - AppStream
mirrorlist=https://mirrors.centos.org/metalink?repo=centos-appstream-9-stream&arch=\$basearch&protocol=https
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
sslverify=0
EOF

# Extras
cat <<EOF | sudo tee /etc/yum.repos.d/CentOS-Stream-Extras-common.repo > /dev/null
[extras-common]
name=CentOS Stream \$releasever - Extras packages
mirrorlist=https://mirrors.centos.org/metalink?repo=centos-extras-sig-extras-common-9-stream&arch=\$basearch&protocol=https
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
sslverify=0
EOF

# EPEL
if [ -f /etc/yum.repos.d/epel.repo ]; then
  sudo sed -i '/^\[.*\]/a sslverify=0' /etc/yum.repos.d/epel.repo
fi

# EPEL-Next
if [ -f /etc/yum.repos.d/epel-next.repo ]; then
  sudo sed -i '/^\[.*\]/a sslverify=0' /etc/yum.repos.d/epel-next.repo
fi

# Clean and refresh DNF
echo "🧹 Cleaning DNF and refreshing cache..."
sudo dnf clean all
sudo dnf makecache --refresh

echo "✅ Repo patch complete. You're ready to rock."
