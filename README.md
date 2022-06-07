# Scripts
These are the scripts which are implemented for IMPD Technologies.
This Script Parses the CSV file and get it as an argument to generate related files which have intended data.
To run csvopt.sh for running just specific block please see below commands which gets secific options [-f -i -t -u] :                   
$ ./csvopt.sh -f csvfile -----> it filters number of fields and returns the rows with columns number more than 14

$ ./csvopt.sh -i csvfile ----->it filters number of fields and returns the rows with bad ip pattern

$ ./csvopt.sh -t csvfile ----->it filters number of fields and returns the rows with bad timestamp pattern

$ ./csvopt.sh -u csvfile ----->it filters number of fields and returns the unique usernames along with number of repetition
