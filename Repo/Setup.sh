#!/bin/bash


cd $1
rm -f packages-i386.db packages-amd64.db
apt-ftparchive generate -c=aptftp.conf aptgenerate.conf
apt-ftparchive release -c=aptftp.conf dists/stable > dists/stable/Release
gpg -u EB97291D68CE1289 -bao dists/stable/Release.gpg dists/stable/Release
gpg -u EB97291D68CE1289 --clear-sign --output dists/stable/InRelease dists/stable/Release
gpg --export -a EB97291D68CE1289 > dists/stable/repo-public-key.gpg
