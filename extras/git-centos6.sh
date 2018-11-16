# 1. Remove current git package
yum remove git

# 2. Install a package with repository for your system:
# On CentOS, install package centos-release-scl available in CentOS repository:
yum install centos-release-scl

# On RHEL, enable RHSCL repository for you system:
yum-config-manager --enable rhel-server-rhscl-6-rpms

# 3. Install the collection:
yum install rh-git29

# 4. Start using the software collection:
scl enable rh-git29 bash
