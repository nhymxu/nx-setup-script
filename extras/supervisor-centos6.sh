yum install -y https://centos6.iuscommunity.org/ius-release.rpm
yum update

yum install -y python27 python27-libs python27-devel python27-pip

pip2.7 install supervisor

mkdir -p /var/run/supervisor
mkdir -p /etc/supervisor
mkdir -p /etc/supervisor/conf.d 
echo_supervisord_conf > /etc/supervisor/supervisord.conf

cat >> /etc/rc.d/init.d/supervisord <<EOF
#!/bin/sh
#
# /etc/rc.d/init.d/supervisord
#
# Supervisor is a client/server system that
# allows its users to monitor and control a
# number of processes on UNIX-like operating
# systems.
#
# chkconfig: - 64 36
# description: Supervisor Server
# processname: supervisord

# Source init functions
. /etc/rc.d/init.d/functions

prog="supervisord"

prefix="/usr/"
exec_prefix="${prefix}"
prog_bin="${exec_prefix}/bin/supervisord"
PIDFILE="/var/run/$prog.pid"
config_file="/etc/supervisor/supervisord.conf"

start()
{
        echo -n $"Starting $prog: "
        daemon $prog_bin --pidfile $PIDFILE -c $config_file
        [ -f $PIDFILE ] && success $"$prog startup" || failure $"$prog startup"
        echo
}

stop()
{
        echo -n $"Shutting down $prog: "
        [ -f $PIDFILE ] && killproc $prog || success $"$prog shutdown"
        echo
}

case "$1" in
  start)
    start
  ;;
  stop)
    stop
  ;;
  status)
        status $prog
  ;;
  restart)
    stop
    start
  ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}"
  ;;
esac
EOF

sudo chmod +x /etc/rc.d/init.d/supervisord
sudo chkconfig --add supervisord
sudo chkconfig supervisord on
sudo service supervisord start
