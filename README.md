Hierapolis is a log file analyzer for Amazon S3.

It is written specifically to make the logs from our podcast network (www.verbmill.net) easier to read but may work in more general cases (or be able to be generalized eventually).

The goal is to parse the logs into some sort of database and spit out a website that shows the important information.

To run:

    Set your home directory:
    ROOT=`pwd`
    export ROOT
    Run the main script:
    scripts/run.sh


Some sites that provide useful notes (for a beginner like me)
sqlite
http://zetcode.com/databases/sqlitetutorial/
http://www.w3schools.com/sql/sql_func_count.asp
http://souptonuts.sourceforge.net/readme_sqlite_tutorial.html
http://www.sqlite.org/datatype3.html

http://docs.amazonwebservices.com/AmazonS3/latest/dev/LogFormat.html

