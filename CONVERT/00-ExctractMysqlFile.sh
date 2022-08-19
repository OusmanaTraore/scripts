#!/bin/bash
#######################################   VARIABLES ###################################################
IFS=":"

###################################### BEGIN APT INSTALLATION ##########################################
 echo " | Enter the database name > "
 read -p db_name
 echo " | Enter the name of file > "
 read -p file_name
 echo " | Extracting database to  $file_name.sql > "
 sleep 2
 mysqldump $db_name > $file_name.sql
 echo " file created: $file_name.sql"
 echo "| go to next step > "
