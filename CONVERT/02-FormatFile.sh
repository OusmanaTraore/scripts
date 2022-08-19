#!/bin/bash

list= "Sun Mon Tue Wed Thu Fri Sat"
touch /var/lib/mysql-files/format1
#awk ' {print $10}  ' /var/lib/mysql-files/$file_name.csv > /var/lib/mysql-files/format1
# 	BEGIN { actions }
# 	/pattern/ { actions }
# 	/pattern/ { actions }
#            ……….
#	 END { actions }
awk '{BEGIN{FS=","} {print $15}  '  $file_name.csv   > cutFormat1
ls

for i in $list 
do
    sed -i 's/$i/ /g'   cutFormat1
    sed -i 's/CEST/ /g'   cutFormat1
done

cat cutFormat1 | cut -d " " -f 6 > time_file
cat cutFormat1 | cut -d " " -f 9 > date_file
cat cutFcutFormat1 | head -5

paste date_file time_file > date_formated

cat date_formated | head -5 

sed -i 's/$/,/g'   date_formated  > date_formated_Virgule

