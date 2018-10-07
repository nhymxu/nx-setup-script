# https://tecadmin.net/mount-s3-bucket-centosrhel-ubuntu-using-s3fs/

# Step 1 – Remove Existing Packages
yum remove fuse fuse-s3fs sshfs

# Step 2: Install Required Packages
yum install gcc libstdc++-devel gcc-c++ curl-devel libxml2-devel openssl-devel mailcap libudev libudev-devel glib2-devel
 
# Step 3 – Download and Compile Fuse
cd /tmp
yum install fuse fuse-devel
wget https://github.com/libfuse/sshfs/releases/download/sshfs-2.10/sshfs-2.10.tar.gz
tar -xvf sshfs-2.10.tar.gz
cd sshfs-2.10
./configure 
make && make install 
