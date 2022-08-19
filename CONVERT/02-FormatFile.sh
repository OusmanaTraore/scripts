#!/bin/bash

list= "Sun Mon Tue Wed Thu Fri Sat"
touch /var/lib/mysql-files/format1
awk ' {print $10}  ' /var/lib/mysql-files/$file_name.csv > /var/lib/mysql-files/format1
# 	BEGIN { actions }
# 	/pattern/ { actions }
# 	/pattern/ { actions }
#            ……….
#	 END { actions }

ls 
for i in $list 
do
    sed 's/$i/ /g'   /var/lib/mysql-files/format1
    sed 's/CEST/ /g'   /var/lib/mysql-files/format1
done
