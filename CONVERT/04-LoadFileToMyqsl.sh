
#!/bin/bash

cat << EOF > 
LOAD DATA INFILE '/var/lib/mysql-files/$file_name.csv'
INTO TABLE $table_name
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

EOF

set -x
user_db="root"
db_name="nagiosdb"
var_virgule='',''
var_quote="\""
var_tab="\\n"

echo " | Enter the name of table to export  >"
read -p " |> " table_name
export $table_name

echo " | Enter the name of file to load to database  >"
read -p " |> " file_name
path_to_file="/var/lib/mysql-files/$file_name"

sleep 2
echo " | Loading file: $path_to_file to database $db_name  >"

mysql  -u $user_db -p $db_name -e 'LOAD DATA INFILE' $path_to_file \
'INTO TABLE' $table_name \
'FIELDS TERMINATED BY' $var_virgule \
'ENCLOSED BY' $var_quote \
'LINES TERMINATED BY' $var_tab \
'IGNORE 1 ROWS;'

echo " | Test loading file: $file_name > "
#sleep 2
#mysql  -u $user_db -p $db_name -e 'select * from ' $table_name 'limit 10 ;'

