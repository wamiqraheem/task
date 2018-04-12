#!/bin/bash
cd /home/xflow/git-task
ovs-vsctl --version;
RESULT=$?
#RESULT="$(ovs-vsctl --version)"
echo $RESULT
#check if repo is uptodate
if [ $RESULT == 127 ]; then
   cd /home/xflow
   rm -rf /home/xflow/ovs
   echo "Cloning....!!!"
   git clone https://github.com/openvswitch/ovs.git
cd ovs
#if ! [ -x "$(command -v autoreconf)" ]; then
 # echo 'Error: autoreconf is not installed.' >&2
  #sudo apt install autoconf -y
#fi
./boot.sh
./configure
make
make install

ovs-vsctl --version
RESULT=$?
if [ $RESULT == 0 ]; then
  echo OVS successfully installed...
else
  echo Installation failed...
   #done
fi
fi
