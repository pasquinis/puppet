mysql -u root
CREATE DATABASE wordpress;
CREATE USER wordpressuser@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost;
FLUSH PRIVILEGES;
exit
