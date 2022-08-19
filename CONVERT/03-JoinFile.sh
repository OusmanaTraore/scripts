#!/bin/bash

echo " | Joinging file together  >"
cat /var/lib/mysql-files/format1 | head -5 

paste /var/lib/mysql-files/format1 /var/lib/mysql-files/$file_name.csv > /var/lib/mysql-files/fileformated.csv


echo " File created : /var/lib/mysql-files/fileformated.csv "
cat /var/lib/mysql-files/fileformated.csv | head -10

