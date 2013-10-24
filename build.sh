#!/bin/bash

md5sum --check downloads/* md5sums.txt 2>&1 | grep -v 'no properly formatted'
sha1sum --check downloads/* sha1sums.txt 2>&1 | grep -v 'no properly formatted'
sha256sum --check downloads/* sha256sums.txt 2>&1 | grep -v 'no properly formatted'

rm -rf ./build

mkdir -m 700 build

cd build
cat "../downloads/TrueCrypt 7.1a Source.tar.gz" | gzip -d | tar -xv
cat "../downloads/wxWidgets-2.8.12.tar.gz" | gzip -d | tar -xv

mkdir pkcs-11_v2-20
cp -v ../downloads/pkcs11f.h ../downloads/pkcs11.h ../downloads/pkcs11t.h ./pkcs-11_v2-20/

sudo apt-get -q -y install nasm gcc-4.6 g++-4.6 make pkg-config libfuse-dev libgtk2.0-dev

cd truecrypt-7.1a-source

export CC=`which gcc-4.6`
export CXX=`which g++-4.6`
export PKCS11_INC=`readlink -f ../pkcs-11_v2-20`

make NOGUI=1 WX_ROOT=`readlink -f ../wxWidgets-2.8.12` wxbuild

make NOGUI=1 WXSTATIC=1
