CREATE USER vitek@'%' IDENTIFIED BY 'Password1';

CREATE DATABASE movie_app;

GRANT ALL PRIVILEGES on movie_app.* to vitek@'%';
FLUSH PRIVILEGES;

CREATE TABLE movie_app.dvd (

  title VARCHAR(255) NOT NULL,
  studio VARCHAR(255) NULL,
  released VARCHAR(255) NULL,
  status VARCHAR(255) NULL,
  sound VARCHAR(255) NULL,
  versions VARCHAR(255) NULL,
  price DOUBLE(10,2) NULL,
  rating VARCHAR(255) NULL,
  year VARCHAR(255) NULL,
  genre VARCHAR(255) NULL,
  aspect VARCHAR(255) NULL,
  upc VARCHAR(255) NULL,
  released_date VARCHAR(255) NULL,
  id INT NOT NULL,
  timestamp DATE NOT NULL,

  PRIMARY KEY (id)
);

LOAD DATA LOCAL INFILE "/home/db/dvd.csv" INTO TABLE movie_app.dvd FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY """" LINES TERMINATED BY "\r\n";
