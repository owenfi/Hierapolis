#!/bin/bash

# A simple script to read lines in the amazon s3 format and arrange them into something slightly friendlier


#Amazon S3 Basic Format
# Bucket Owner, Bucket Name, Time, Remote IP, Requester, Request Id (unique), Operation, Key, URI, HTTP Status, Error Code, Bytes Sent, Object Size, Total Time, Turnaround Time, Referrer, User-Agent, Version Id, ...?
# What this gross regex does: takes a log line as input and places the unique-request id at the front of the line
sed 's/\([a-f0-9]* podcast-store \[.*\] [0-9]*\.[0-9]*\.[0-9]*\.[0-9]* [-a-z0-9]* \)\([a-z0-9A-F]* \)/\2\1/g' |

# remove spaces from the date
sed 's/\[\(.*\) \(.*\)\]/\1\2/g' |

# remove one of the (two) copy lines in the log file (they share the same unique ID)
grep -v 'REST.COPY.OBJECT_GET'

sort
