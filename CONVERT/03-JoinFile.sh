#!/bin/bash


ls
echo " Enter Csv Original file name "
read -p " |> " file_name
echo ""
echo " | Joinging file together  >"  

paste date_formated_Virgule $file_name.csv > finalfile.csv

echo " File created : finalfile.csv "
cat finalfile.csv | head -5

