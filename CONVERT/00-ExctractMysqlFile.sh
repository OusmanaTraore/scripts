#!/bin/bash
#######################################   VARIABLES ###################################################
IFS=":"

###################################### BEGIN APT INSTALLATION ##########################################
 echo " | Enter the database name > "
 read -p " |>  " db_name
 echo " | Enter the name of file > "
 read -p " |>  " file_name
 echo " | Enter the name of db user > "
 read -p " |>  " user_db
 echo " | Extracting database to  $file_name.sql > "
 sleep 2
 mysqldump -u $user_db -p  $db_name > $file_name.sql
 echo " file created: $file_name.sql"
export $db_name
export $file_name
export $user_db

sleep 2
 echo "| go to next step > "

