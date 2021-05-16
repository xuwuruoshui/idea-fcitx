#!/bin/bash
sudo apt install ksh bison flex gperf build-essential libasound2-dev libgl1-mesa-dev \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libjpeg-dev \
    libpng-dev libx11-dev libxml2-dev libxslt1-dev libxt-dev \
    libxxf86vm-dev pkg-config x11proto-core-dev \
    x11proto-xf86vidmode-dev libavcodec-dev mercurial \
    libgtk2.0-dev libgtk-3-dev \
    libxtst-dev libudev-dev libavformat-dev ant -y

sudo apt install cmake ruby -y

sudo apt install openjdk-11-jdk -y

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export JDK_HOME=$JAVA_HOME

sudo apt install mercurial -y
hg clone http://hg.openjdk.java.net/openjfx/11-dev/rt

cd rt
chmod a+x gradlew
mkdir /usr/img
dd if=/dev/zero of=/usr/img/swap bs=1024 count=4096000
mkswap /usr/img/swap
 swapon /usr/img/swap

./gradlew -PCOMPILE_WEBKIT=true


sudo git clone https://github.com/JetBrains/JetBrainsRuntime.git


cd JetBrainsRuntime
git checkout cfc3e87f2ac27a0b8c78c729c113aa52535feff6
wget https://raw.githubusercontent.com/prehonor/myJetBrainsRuntime/master/idea.patch
git apply idea.patch


sudo apt install autoconf make build-essential libx11-dev \ 
	libxext-dev libxrender-dev libxtst-dev libxt-dev \
	libxrandr-dev libcups2-dev libfontconfig1-dev \
	libasound2-dev -y


sh ./configure --disable-warnings-as-errors  --with-import-modules=_path_to_jfx-dev_/rt/build/modular-sdk 
make images


cd path_to_JetBrainsRuntime/JetBrainsRuntime/build/linux-x86_64-normal-server-release/images
mv jdk jbr


