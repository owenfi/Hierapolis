/*Here is a sql file that has some sqlite3 commands to get the csv into the db and run some basic queries */

/* Create the right sort of table */
create table smallish (ip text,time text,key text,transfer integer,size integer,id text primary key);

/* tell sqlite we're going to be importing a csv */
.separator ","

/* Import the CSV to the DB table */
 .import ../sample/chopped.csv smallish

/* Read the table info out */
PRAGMA table_info(smallish);

/* Query examples */

/* How many unique users */
select count(distinct ip) from smallish;

/* This gives the episodes, their size and the number of times they were fully downloaded */
select key,size,count(key) from smallish where (transfer == size) group by key;

/* This gives the episodes, their size and the number of times they were 90%+ downloaded */
select key,size,count(key) from smallish where (transfer >= 0.9*size) group by key;


