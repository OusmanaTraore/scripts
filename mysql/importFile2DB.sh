#!/bin/bash

echo "|Give the name of the file to import to database >> "
read  -p "|file=" name_file

echo "|Give the name of the database >> "
read  -p "|database=" name_database

echo "|Give the username of the database >> "
read  -p "|username=" name_username

if [[ $name_file | grep '.gz' ]]
then
         echo "|Unzipping file $name_file >> "
         gzip -d $name_file
         name_fileUnzip=$($name_file | cut -d "\.gz" -f1 )
         echo "|Importing file $name_fileUnzip to database $name_database  >> "
         mysql -u $name_username -p $name_database < $name_fileUnzip
else
         echo "|Importing file $name_file to database $name_database  >> "
         mysql -u $name_username -p $name_database < $name_file
fi

echo "|Connect to mysql to check the importation  file $name_file to database $name_database  >> "
