# or git clone git://github.com/joyent/node.git if you want to checkout a stable tag
git clone --depth 1 git://github.com/joyent/node.git 
cd node
git checkout v0.4.11 # optional.  Note that master is unstable.
location=~/local/node
./configure --prefix=$location
make -j2 # -j sets the number of jobs to run
make install
export NODE_PATH=$location:$location/lib/node_modules
export PATH=$PATH:$location/bin
# ~/.bash_profile or ~/.bashrc on some systems
echo "export NODE_PATH=$location:$location/lib/node_modules" >> ~/.profile 
echo "export PATH=$PATH:$location/bin" >> ~/.profile 
curl http://npmjs.org/install.sh | sh

