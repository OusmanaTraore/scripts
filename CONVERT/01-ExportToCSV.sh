 #!/bin/bash

user_db="root"
db_name="mysql"
file_name="test2"


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

mysql  -u $user_db -p $db_name -e 'select * from' $table_name |
sed 's/\t/,/g' > $file_name.csv

cat $file_name.csv | head -10
#echo " File created : /var/lib/mysql-files/$file_name.csv "
#sudo cp $file_name.csv /var/lib/mysql-files/

