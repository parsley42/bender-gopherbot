#!/bin/bash -e

# code.sh - 'vanity' plugin to launch a Cloud9 developer workstation spot instance

source $GOPHER_INSTALLDIR/lib/gopherbot_v1.sh

COMMAND=$1
shift

configure(){
  cat <<"EOF"
Users: [ 'parsley' ]
AllowDirect: true
Help:
- Keywords: [ "code", "program" ]
  Helptext: [ "(bot), start coding - launch a Cloud9 developer spot instance" ]
- Keywords: [ "spawn" ]
  Helptext: [ "(bot), spawn update - spawn the updatecfg job as a parallel task" ]
CommandMatchers:
- Command: "code"
  Regex: '(?i:start coding)'
- Command: "spawn"
  Regex: '(?i:spawn update)'
EOF
}

case "$COMMAND" in
	"configure")
		configure
		;;
  "code")
    Say "Ok, I'll start the 'cloud9wks' job and let you know when your workstation is ready..."
    AddTask cloud9wks
    AddTask notify $GOPHER_USER "Happy coding!"
    FailTask notify $GOPHER_USER "Build failed, check history for the 'cloud9wks' job"
    ;;
  "spawn")
    Say "Ok, I'll fire off a separate thread for updating my config"
    SpawnTask updatecfg
    sleep 3s
    Say "... and I'm still running - did anything happen?"
esac
