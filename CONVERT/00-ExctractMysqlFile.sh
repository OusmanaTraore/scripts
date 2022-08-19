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
 mysqldump -u $user_db -p  $db_name > /var/lib/mysql-files/$file_name.sql
 echo " file created: $file_name.sql"
  sed -i "2a $db_name"  01-ExportToCSV.sh 
  sed -i "4a $file_name"  01-ExportToCSV.sh 
  sed -i  "5a $user_db"  01-ExportToCSV.sh 
sleep 2
 echo "| go to next step > "

