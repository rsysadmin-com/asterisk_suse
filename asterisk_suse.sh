#!/bin/sh
#
# asterisk       This shell script takes care of starting and stopping Asterisk.
#
# 08.Sept.2004 - Modified to be used on a SuSE Linux system by Martin Mielke.
#                Please, send your comments/flames/salary increases/geek t-shirts, etc
#		     to <martin at mielke dot com> :-)
#
#
# Source function library.
# Shell functions sourced from /etc/rc.status:
#      rc_check         check and set local and overall rc status
#      rc_status        check and set local and overall rc status
#      rc_status -v     ditto but be verbose in local rc status
#      rc_status -v -r  ditto and clear the local rc status
#      rc_failed        set local and overall rc status to failed
#      rc_failed <num>  set local and overall rc status to <num><num>
#      rc_reset         clear local rc status (overall remains)
#      rc_exit          exit appropriate to overall rc status
. /etc/rc.status

ASTERISK_BIN=/usr/sbin/asterisk
ASTERISK_LOCK=/var/lock/subsys/asterisk
ASTERISK_PID=/var/run/asterisk.pid
ASTERISK_OPTS="-nqg"	# -n: Disable console colorization
			# -q: Quiet mode (supress output)
			# -g: Dump core in case of a crash


[ -f $ASTERISK_BIN ] || exit 0

RETVAL=0

# See how we were called.
case "$1" in
  start)
        # Start daemons.
        echo -n "Starting Asterisk PBX: "
        startproc $ASTERISK_BIN $ASTERISK_OPTS
	  RETVAL=$?           
        [ $RETVAL -eq 0 ] && touch $ASTERISK_LOCK
	  rc_status -v 
        ;;
  stop)
        # Stop daemons.
        echo -n "Shutting down Asterisk PBX: "
        killproc asterisk
	  RETVAL=$?
        rc_status -v        
        [ $RETVAL -eq 0 ] && rm -f $ASTERISK_LOCK
        ;;
  status)
        echo -n "Checking for service Asterisk PBX: "
        /sbin/checkproc -p $ASTERISK_PID $ASTERISK_BIN
        rc_status -v
        ;;
  restart|reload)
        $0 stop
        $0 start
        RETVAL=$?
	rc_status -v
        ;;
  *)
        echo "Usage: asterisk {start|stop|restart|reload|status}"
        exit 1
esac

exit $RETVAL


