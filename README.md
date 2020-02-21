# asterisk_suse.sh
This shell script takes care of starting and stopping the Asterisk PBX on a SuSE Linux system

## a word of warning
Please note: I posted this script back in 2004 and haven’t used Asterisk PBX on openSUSE much since then so I trust it will still work on your system with no or minor modifications.<p>

### How to install:
Although I assume you already know how to install such an script on your system, I got some emails from people without much experience with Linux, so I hope they’ll find this info of some use… :-) <p>

Proceed as follows: <p>

Become root: <p>

$ su -l <p>

Password: [your-root-passwd-here] <p>

Save the script as /etc/init.d/asterisk <p>

Make a symbolic link from /etc/init.d/rc3.d to it for Asterisk to start on system boot <p>

cd /etc/init.d/rc3.d <p>

ln -s ../asterisk S90asterisk <p>

Make a symbolic link from /etc/init.d/rc0.d to it for Asterisk to stop on system shutdown <p>

cd /etc/init.d/rc0.d <p>

ln -s ../asterisk K10asterisk <p>

### How to use:
Once installed, if you wish to start/stop Asterisk manually, become root and type: <p>

/etc/init.d/asterisk  [your-option] <p>

where ‘your-option’ can be one of the following: <p>

start: To start the Asterisk PBX <p>

stop: To stop the Asterisk PBX <p>

status: To check the status of the Asterisk PBX <p>

restart: To restart the Asterisk PBX <p>

# disclaimer
This script is provided to the Asterisk PBX Community on an “AS IS” basis. The author is not to be held responsible for any damages it might cause due to its use.

Please contact me if you feel this script needs updating.
