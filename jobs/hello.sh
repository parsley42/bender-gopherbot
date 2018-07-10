#!/bin/bash -e

# jobs/hello.sh - the first Gopherbot scheduled job

# NOTE: this sample job uses the bot library, most jobs probably won't
source $GOPHER_INSTALLDIR/lib/gopherbot_v1.sh

PHRASE=$1

# PHRASE is a paramter specified when the job is run, SECRETSAUCE comes
# from a parameter stored in the brain, and FIXEDSTRING is a configured
# parameter in conf/jobs/hello.yaml
Say "$PHRASE - also, $SECRETSAUCE: $FIXEDSTRING"
Log "Info" "I said $PHRASE, and $SECRETSAUCE: $FIXEDSTRING"
ls -Fla /tmp >&2
# Listing from WorkingDirectory
AddTask ls -Fla
# exit 1