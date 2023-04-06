#!/bin/bash -x

# Install netselect if not installed
if ! command -v netselect &> /dev/null; then
  wget http://ftp.us.debian.org/debian/pool/main/n/netselect/netselect_0.3.ds1-29_amd64.deb
  dpkg -i netselect_0.3.ds1-29_amd64.deb
fi

# Get the list of mirrors
mirror_list_url="http://mirrors.ubuntu.com/mirrors.txt"
mirrors=$(wget -qO- "${mirror_list_url}")

# Find the fastest mirror using netselect
fastest_mirror=$(netselect -v -s 1 -t 20 ${mirrors} | grep -o -P "(f|ht)tp://[^\"]*")
echo "${fastest_mirror}"

# Backup the original sources.list
cp /etc/apt/sources.list /etc/apt/sources.list.backup

# Replace the current mirror with the fastest mirror
sed -i "s|http://[^ ]\+|${fastest_mirror}|g" /etc/apt/sources.list

# Update the package list
apt-get update