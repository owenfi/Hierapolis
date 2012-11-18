#!/bin/sh

# A basic script to cat the logs and generate the output
echo root is $ROOT;

# Put the logs in one file
cat $ROOT/sample/logs/* | $ROOT/scripts/cleanup.sh > $ROOT/sample/one-week-full-logs.txt

# Create a databse

# Read the file into the database

# Generate a website with stats and graphs from the db
