#!/bin/bash
PASS="asd123"
USER="mysqld_exporter"
DB="DB7"

sudo systemctl start mysql

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE $DB;
CREATE USER '$USER'@'localhost' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $DB.* TO '$USER'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

mysql -u$USER -p$PASS -D $DB <<MYSQL_SCRIPT
CREATE TABLE IF NOT EXISTS items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product VARCHAR(255) NOT NULL,
  price VARCHAR(255) NOT NULL
);
  INSERT INTO items VALUES ('1','Tomato','5');
MYSQL_SCRIPT

echo "MySQL user created."
echo "Username:   $USER"
echo "Password:   $PASS"