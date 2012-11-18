#!/bin/sh

# A basic script to cat the logs and generate the output
echo root is $ROOT;

# Put the logs in one file
cat $ROOT/sample/logs/* | $ROOT/scripts/cleanup.sh > $ROOT/sample/one-week-full-logs.txt

# Create a databse

#Putting these in comments since I'm running by hand as a I don't yet know how to script sqlite3 actions
#sqlite> create table s3stats0(requestid text,owner text,bucket text,time text,ip text,requesterid text,operation text,key text,uri text,httpstatus integer,error text,sentbytes integer,objectsize integer,totaltime integer, turnaroundtime integer, referrer text, useragent text, versionid text);
#sqlite> .separator(' ')
#Error: unknown command or invalid arguments:  "separator('". Enter ".help" for help
#sqlite> .separator ' '
#sqlite> .import ../
#../.git       ../db         ../docs       ../README.md  ../sample     ../scripts  
#sqlite> .import ../sample/one-week-full-logs.txt s3stats0
#sqlite> select * from s3stats0 limit 5

# Read the file into the database

# Generate a website with stats and graphs from the db
