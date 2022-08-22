#!/bin/bash

#list= "Sun Mon Tue Wed Thu Fri Sat"
touch /var/lib/mysql-files/format1
#awk ' {print $10}  ' /var/lib/mysql-files/$file_name.csv > /var/lib/mysql-files/format1
# 	BEGIN { actions }
# 	/pattern/ { actions }
# 	/pattern/ { actions }
#            ……….
#	 END { actions }
ls
echo""
echo " | Nom du fichier à tronquer sans extension  > "
read -p " |> " file_name
echo " | Troncature du champ date puis formatage..."
cp $file_name $file_name.csv
awk 'BEGIN{FS=","} {print $15}  '  $file_name.csv   > cutFormat1
date  -f  cutFormat1 '+%Y-%m-%d %H:%M:%S'
ls
echo " | Affichage du fichier tronqué et formaté > "
cat cutFormat1 | head -10 

#for i in $list 
#do
#    sed -i 's/$i/ /g'   cutFormat1
#    sed -i 's/CEST/ /g'   cutFormat1
#done

#cat cutFormat1 | cut -d " " -f 6 > time_file
#cat cutFormat1 | cut -d " " -f 9 > date_file
#cat cutFormat1 | head -5

#paste date_file time_file > date_formated

#cat date_formated | head -5 
echo " | Ajout d'une nouvelle colonne date_formated " 
sed  's/$/,/g'   cutFormat1  > date_formated_Virgule

echo " | Affichage du fichier tronqué et formaté > "
cat date_formated_Virgule | head -10

