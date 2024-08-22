yum install -y \
   libXpm net-tools bzip2 wget vim gcc gcc-c++ samba dos2unix glibc-devel glibc.i686 glibc-devel.i686 \
   mpfr.i686 mpfr-devel.i686 zlib.i686 rsync autogen autoconf automake libtool gettext* bison binutils \
   flex device-mapper-devel SDL libpciaccess libusb freetype freetype-devel gnu-free-* qemu-* virt-* \
   libvirt* vte* NetworkManager-bluetooth brlapi fuse-devel dejavu* gnu-efi* pesign shim \
   iscsi-initiator-utils grub2-tools zip nasm acpica-tools glibc-static zlib-static xorriso
cd /home
git clone https://github.com/ycyun/Ventoy
mv Ventoy Ventoy-master
wget https://www.fefe.de/dietlibc/dietlibc-0.34.tar.xz -O /home/Ventoy-master/DOC/dietlibc-0.34.tar.xz
wget https://musl.libc.org/releases/musl-1.2.1.tar.gz -O /home/Ventoy-master/DOC/musl-1.2.1.tar.gz
wget https://ftp.gnu.org/gnu/grub/grub-2.04.tar.xz -O /home/Ventoy-master/GRUB2/grub-2.04.tar.xz
wget https://codeload.github.com/tianocore/edk2/zip/edk2-stable201911 -O /home/Ventoy-master/EDK2/edk2-edk2-stable201911.zip
wget https://codeload.github.com/relan/exfat/zip/v1.3.0 -O /home/Ventoy-master/ExFAT/exfat-1.3.0.zip
wget https://codeload.github.com/libfuse/libfuse/zip/fuse-2.9.9 -O /home/Ventoy-master/ExFAT/libfuse-fuse-2.9.9.zip
wget https://releases.linaro.org/components/toolchain/binaries/7.4-2019.02/aarch64-linux-gnu/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu.tar.xz -O /opt/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu.tar.xz
wget https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2020.08-1.tar.bz2 -O /opt/aarch64--uclibc--stable-2020.08-1.tar.bz2
wget https://github.com/ventoy/vtoytoolchain/releases/download/1.0/mips-loongson-gcc7.3-2019.06-29-linux-gnu.tar.gz -O /opt/mips-loongson-gcc7.3-2019.06-29-linux-gnu.tar.gz
wget https://github.com/ventoy/musl-cross-make/releases/download/latest/output.tar.bz2 -O /opt/output.tar.bz2
wget http://www.tinycorelinux.net/11.x/x86_64/release/distribution_files/vmlinuz64 -O /home/Ventoy-master/LiveCD/ISO/EFI/boot/vmlinuz64
wget http://www.tinycorelinux.net/11.x/x86_64/release/distribution_files/corepure64.gz -O /home/Ventoy-master/LiveCD/ISO/EFI/boot/corepure64.gz
wget http://www.tinycorelinux.net/11.x/x86_64/release/distribution_files/modules64.gz -O /home/Ventoy-master/LiveCD/ISO/EFI/boot/modules64.gz

cd /home/Ventoy-master/DOC/
tar xf musl-1.2.1.tar.gz
cd musl-1.2.1
./configure && make install

tar xf /opt/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu.tar.xz  -C /opt
tar xf /opt/aarch64--uclibc--stable-2020.08-1.tar.bz2  -C /opt
tar xf /opt/output.tar.bz2  -C /opt
mv /opt/output /opt/mips64el-linux-musl-gcc730

echo 'export PATH=$PATH:/opt/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin:/opt/aarch64--uclibc--stable-2020.08-1/bin:/opt/mips64el-linux-musl-gcc730/bin' >> /etc/profile.d/buildpath.sh
export PATH=$PATH:/opt/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin:/opt/aarch64--uclibc--stable-2020.08-1/bin:/opt/mips64el-linux-musl-gcc730/bin