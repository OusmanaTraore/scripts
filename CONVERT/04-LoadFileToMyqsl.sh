
#!/bin/bash

cat << EOF > 
LOAD DATA INFILE '/var/lib/mysql-files/$file_name.csv'
INTO TABLE $table_name
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

EOF

