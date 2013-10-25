# truecrypt-builder

## Sources of downloaded files

  * http://www.truecrypt.org/downloads2
  * http://sourceforge.net/projects/wxwindows/files/2.8.12/wxWidgets-2.8.12.tar.gz/download
  * ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-11/v2-20/pkcs11.h
  * ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-11/v2-20/pkcs11f.h
  * ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-11/v2-20/pkcs11t.h

## Findings of deterministic build so far

### Linux version

Building on Ubuntu 12.04 (12.04.3) i386 and amd64.

  * the output with default parameters (with GUI) differs from build to build
  * the output **without GUI** (NOGUI=1) is the same between builds and reboots
  * the path where the build was done does not affect the output

The current build.sh script works now with these releases.

To test the build do the following:
  * download the 12.04.3 version from http://www.ubuntu.com/
  * start Ubuntu (in a virtual machine or on your PC)
  * start a terminal (click on the Dash home button (top left), type "terminal" and select the terminal)
  * run: **sudo apt-get install git**
  * run: **git clone https://github.com/gheja/truecrypt-builder**
  * run: **cd truecrypt-builder**
  * run: **./build.sh**

After the build ...

No other versions were tested yet.
