#!/bin/bash -e

# jobs/hello.sh - the first Gopherbot scheduled job

# NOTE: this sample job uses the bot library, most jobs probably won't
source $GOPHER_INSTALLDIR/lib/gopherbot_v1.sh

PHRASE=$1

if Exclusive "world" "true"
then
    Say "Hooray! I get to run! $GOPHER_CALLER_ID"
else
    Say "Darn, I have to wait. $GOPHER_CALLER_ID"
    exit 0
fi
sleep 4

ExtendNamespace world 14

FailTask dmnotify parsley "Your trivial hello world job failed"

#set -x
# PHRASE is a paramter specified when the job is run, SECRETSAUCE comes
# from a parameter stored in the brain, and FIXEDSTRING is a configured
# parameter in conf/jobs/hello.yaml
Say "$PHRASE - also, $SECRETSAUCE: $FIXEDSTRING ($JOBPHRASE)"
Log "Info" "I said $PHRASE, and $SECRETSAUCE: $FIXEDSTRING"
ls -Fla /tmp >&2
# dmesg | head -30 # go beyond 4k
# Listing from WorkingDirectory
AddTask ssh-init
AddTask ssh parse@localhost whoami
# AddTask fail
AddTask ls -laF
# exit 1