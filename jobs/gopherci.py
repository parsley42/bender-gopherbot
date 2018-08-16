#!/usr/bin/env python

import os
import sys
sys.path.append("%s/lib" % os.getenv("GOPHER_INSTALLDIR"))
from gopherbot_v1 import Robot

bot = Robot()

from yaml import load

repository = sys.argv.pop(0)
branch = sys.argv.pop(0)

repofile = "%s/conf/repodata.yaml" % os.getenv("GOPHER_CONFIGDIR")
repodata = load(repofile)

if repository in repodata:
    repoconf = repodata[repository]
    if "type" in repoconf:
        repotype = repoconf["type"]
    else
        bot.Say("No 'type' specified for %s" % repository)
        exit()
else:
    bot.Say("Repository '%s' not found in 'repositories.yaml'" % repository)
    exit()

bot.Say("Found '%s' in 'repositories.yaml', type '%s'" % (repository, repotype))