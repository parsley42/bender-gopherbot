#!/bin/bash -e

# githubci.sh - a Bash job triggered by github commits

source $GOPHER_INSTALLDIR/lib/gopherbot_v1.sh

Say "Hey! I see there's a new commit to '$GITHUB_REPOSITORY' in the '$GITHUB_BRANCH' branch. Someday I'm going to do something about that!"