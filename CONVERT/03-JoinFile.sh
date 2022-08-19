#!/bin/bash

echo " | Joinging file together  >"
ls  

paste date_formated_Virgule $secondfile > finalfile.csv

echo " File created : /var/lib/mysql-files/fileformated.csv "
cat finalfile.csv | head -5

