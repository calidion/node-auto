#!/usr/bin/bash

# or git clone git://github.com/joyent/node.git if you want to checkout a stable tag

git clone --depth 1 git://github.com/joyent/node.git 
cd node

if [ -z $1 ]; then
  echo "checking default version v0.4.12"
  git checkout v0.4.12 # optional.  Note that master is unstable.
else
  echo "checking custom version $1"
  git checkout $1 # optional.  Note that master is unstable.
fi

if [ -z $2 ]; then
  echo "using local default location"
  location=~/local/node
else
  echo "using custom location"
  if [ -d $2 ]; then
    location=$2
  else
    echo "directory not found!"
    echo "using default location instead"
    location=~/local/node
  fi
fi

./configure --prefix=$location
make -j2 # -j sets the number of jobs to run
make install
export NODE_PATH=$location:$location/lib/node_modules
export PATH=$PATH:$location/bin
# ~/.bash_profile or ~/.bashrc on some systems
echo "export NODE_PATH=$location:$location/lib/node_modules" >> ~/.profile 
echo "export PATH=$PATH:$location/bin" >> ~/.profile 

curl http://npmjs.org/install.sh | sh

