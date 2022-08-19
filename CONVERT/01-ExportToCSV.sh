#!/bin/bash

echo " | Enter the name of table to export  >"
read -p " |> " table_name
export $table_name

#cat << EOF >
#SELECT * FROM $table_name
#INTO OUTFILE '/var/lib/mysql-files/$file_name.csv'
#FIELDS TERMINATED BY ','
#ENCLOSED BY '"'
#LINES TERMINATED BY '\n';
#EOF
sleep 2
echo " | Exporting table: $table_name to csv file  >"

mysql  -u $user_db -p -e 'select * from $table_name' |
sed 's/\t/,/g' > /var/lib/mysql-files/$file_name.csv

echo " File created : /var/lib/mysql-files/$file_name.csv "
