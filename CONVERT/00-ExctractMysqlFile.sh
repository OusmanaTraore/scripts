#!/bin/bash
#######################################   VARIABLES ###################################################

###################################### BEGIN APT INSTALLATION ##########################################
 echo " | Enter the database name > "
 read -p " |>  " db_name
 echo " | Enter the name of file > "
 read -p " |>  " file_name
 echo " | Enter the name of db user > "
 read -p " |>  " user_db
 echo " | Extracting database to  $file_name.sql > "
 sleep 2
sudo  mysqldump -u $user_db -p  $db_name > $file_name.sql
 echo " file created: $file_name.sql"

#list="$db_name $file_name $user_db"
# for i in $list
# do
#        export $i
#        cat $i
# done

#declare -A list
#list=([db_name]="$db_name":[file_name]=$file_name:[user_db]=$user_db")
#tableau="db_name=:file_name=
#count=2
#for i in $list
#do
#  if [[ ! grep -Fxq "$list" 01-ExportToCSV.sh ]]
#  then
#  echo "$list not found .."
#  echo "|> "
#  sleep 2
#  echo "Sending variables ..."
#  sed -i "$counta $list[i]=\"$i\""  01-ExportToCSV.sh
#  ((count++))
#  else 
#        echo "$list found ...OK"
#  fi
#done
sleep 2
 echo "| go to next step > "

