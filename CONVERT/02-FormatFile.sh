#!/bin/bash
clear
#awk ' {print $10}  ' /var/lib/mysql-files/$file_name.csv > /var/lib/mysql-files/format1
# 	BEGIN { actions }
# 	/pattern/ { actions }
# 	/pattern/ { actions }
#            ……….
#	 END { actions }
ls
echo""
echo " | Nom du fichier à tronquer  > "
read -p " |> " file_name_in
echo""
echo " | Nom du fichier de sortie  > "
read -p " |> " file_name_out

echo " | Troncature du champ date puis formatage..."
cp $file_name_in $file_name_out
awk 'BEGIN{FS=","} {print $15}  '  $file_name_out   > cutFormat_01
date -f cutFormat_01 '+%Y-%m-%d %H:%M:%S' > cutFormat_02
ls
echo " | Affichage du fichier tronqué (cutFormat_02) > "
cat cutFormat_02 | head -10 

echo " | Ajout d'une nouvelle colonne date_formated " 
sed  's/$/,/g'   cutFormat_02  > date_formated_Virgule_$file_name_in
sleep 2 
echo " | Affichage du fichier tronqué et formaté (date_formated_Virgule_$file_name_in) > "
cat date_formated_Virgule_$file_name_in | head -10

