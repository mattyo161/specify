#!/bin/csh -x
/usr/bin/rsync -v -rltgz --delete '/Users/matt/Documents/Personal Stuff/Projects/BBMSC/BBMSC Workspace/specify/app' 'sperling@dev.bbmsc.com:/media/railsapp/specify'
/usr/bin/rsync -v -rltgz --delete '/Users/matt/Documents/Personal Stuff/Projects/BBMSC/BBMSC Workspace/specify/lib' 'sperling@dev.bbmsc.com:/media/railsapp/specify'
/usr/bin/rsync -v -rltgz --delete '/Users/matt/Documents/Personal Stuff/Projects/BBMSC/BBMSC Workspace/specify/db/migrate' 'sperling@dev.bbmsc.com:/media/railsapp/specify/db'
# /usr/bin/rsync -v -rltgz --delete '/websites/data/printads/datafiles' 'ecnftp@secure.eagletribune.com:/websites/data/printads'
