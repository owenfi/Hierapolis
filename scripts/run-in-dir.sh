#!/bin/sh

# A basic script to cat the logs and generate the output
echo root is $ROOT;

# Put the logs in one file
#[373][owen.Thesmo: Hierapolis]$ find ./podcast-logs/ -name "*" | wc -l
# Will need to use find and xargs to avoid terminal count problems

#cat $ROOT/sample/logs/* | $ROOT/scripts/cleanup.sh > $ROOT/sample/one-week-full-logs.txt
# Finds all the items from 2012/2013... (to avoid finding non-log files)
find . -name "*201*" | xargs cat | $ROOT/scripts/cleanup.sh > ./processed-logs.txt

cat ./processed-logs.txt | $ROOT/scripts/chop.sh  > ./processed-logs.csv
#cat ./processed-logs.txt | $ROOT/scripts/chop.sh | $ROOT/scripts/datefix.sh > ./processed-logs.csv

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
