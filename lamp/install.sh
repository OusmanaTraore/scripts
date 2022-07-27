#!/bin/bash
################################# BEGINING OF APACHE INSTALLATION ################################
sudo dnf install httpd
sudo systemctl start httpd
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --list-all
sudo firewall-cmd --reload
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
curl -4 icanhazip.com
################################# ENDING OF APACHE  INSTALLATION  ###############################
################################# BEGINING OF MYSQL INSTALLATION  ###############################
sudo dnf install mariadb-server
sudo systemctl start mariadb
sudo mysql_secure_installation
sudo mysql

echo -n "
Log to mysql and tape create the database 
===== BEGINING OF CREATE DATABASE ==========
CREATE DATABASE example_database;
GRANT ALL ON example_database.* TO 'example_user'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit
===== ENDING OF CREATE DATABASE ==========
===== CONNECTING TO MYSQL ==========
mysql -u example_user -p
SHOW DATABASES;
exit
===== END ==========
"
################################# ENDING OF MYSQL  INSTALLATION   ##############################
################################# BEGINING OF PHP  INSTALLATION   ##############################
sudo dnf install php php-mysqlnd
sudo systemctl restart httpd
################################# ENDING OF PHP    INSTALLATION   ##############################

################################# TESTING  PHP  WITH APACHE   ##############################
sudo chown -R sammy.sammy /var/www/html/
sudo dnf install nano
#################################  ##############################
echo " check the php information in /var/www/html/info.php "

echo " access the server via web browser : http://server_host_or_IP/info.php"

echo " remove info file about your php server : rm /var/www/html/info.php"


################################# TESTING DATABASE CONNECTION FROM PHP ############################

echo -n "
mysql -u example_user -p
CREATE TABLE example_database.todo_list (
	item_id INT AUTO_INCREMENT,
	content VARCHAR(255),
	PRIMARY KEY(item_id)
);
INSERT INTO example_database.todo_list (content) VALUES ("My first important item");
SELECT * FROM example_database.todo_list;
exit
"

echo -n " Create a script that will connect to MariaDB and query for your content:
nano /var/www/html/todo_list.php
<?php
$user = "example_user";
$password = "password";
$database = "example_database";
$table = "todo_list";

try {
  $db = new PDO("mysql:host=localhost;dbname=$database", $user, $password);
  echo "<h2>TODO</h2><ol>";
  foreach($db->query("SELECT content FROM $table") as $row) {
    echo "<li>" . $row['content'] . "</li>";
  }
  echo "</ol>";
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
"

echo " Acces your todo lit via the browser : http://server_host_or_IP/todo_list.php"
