#!/bin/bash

clear
ls
echo " Enter Csv date_formated file name "
read -p " |> " file_name_date
echo ""
echo " Enter Csv Original file name "
read -p " |> " file_name_ori
echo ""
echo " | Joinging file together  >"  
paste  $file_name_date $file_name_ori > finalfile_$file_name_ori

#cut -d '_' -f1  filetemp_$file_name_ori > finalfile_$file_name_ori

echo " File created : finalfile_$file_name_ori "
cat finalfile_$file_name_ori | head -5

