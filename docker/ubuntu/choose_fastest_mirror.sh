asdf#!/bin/bash -x

# Backup the original sources.list
cp /etc/apt/sources.list /etc/apt/sources.list.backup

# Replace the current mirror with the fastest mirror
# sed -i "s|http://[^ ]\+|mirror://mirrors.ubuntu.com/mirrors.txt|g" /etc/apt/sources.list
sed -i -E "s/http:\/\/(archive|security)[^ ]+/mirror:\/\/mirrors.ubuntu.com\/mirrors.txt/g" /etc/apt/sources.list
cat /etc/apt/sources.list

# Update the package list
apt-get update