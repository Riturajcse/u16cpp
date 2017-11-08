#!/bin/bash -e

echo "========================= Clean apt-get ========================"
apt-get clean
mv /var/lib/apt/lists/* /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update
echo "======================== Cleaned apt-get ======================"

echo "======================= Installing gcc 7.2 ======================"
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install -y \
  gcc-7=7.2.0-1ubuntu1~16.04 \
  g++-7=7.2.0-1ubuntu1~16.04
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 50 --slave /usr/bin/g++ g++ /usr/bin/g++-7
update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-7 50
gcc --version
echo "================== Successfully Installed gcc 7.2 ==============="

sudo apt-get update && apt-get install -yy \
  autoconf=2.69-9 \
  automake=1:1.15-4ubuntu1 \
  ccache=3.2.4-1 \
  graphviz=2.38.0-12ubuntu2.1 \
  kmod=22-1ubuntu5 \
  mscgen=0.20-5 \
  libcunit1-dev=2.1-3-dfsg-2 \
  libpcap-dev=1.7.4-2 \
  libssl-dev=1.0.2g-1ubuntu4.9\
  libtool=2.4.6-0.1 \
  linux-headers-`uname -r` \
  ruby-dev=1:2.3.0+1


CLANG_VERSION=5.0.0
echo "==================== Installing clang $CLANG_VERSION ==================="
wget -nv http://releases.llvm.org/"$CLANG_VERSION"/clang+llvm-"$CLANG_VERSION"-aarch64-linux-gnu.tar.xz
tar xf clang+llvm-"$CLANG_VERSION"-aarch64-linux-gnu.tar.xz
cd clang+llvm-"$CLANG_VERSION"-aarch64-linux-gnu
cp -R * /usr/local/
cd ../
clang --version
echo "=============== Successfully Installed clang $CLANG_VERSION ============"
