#!/bin/bash

# A basic script to cat the logs and generate the output

# Put the logs in one file
cat $ROOT/sample/logs/* | $ROOT/cleanup.sh > $ROOT/sample/one-week-full-logs.txt

# Create a databse

# Read the file into the database

# Generate a website with stats and graphs from the db
