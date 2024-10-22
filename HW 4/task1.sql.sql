DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet (
  petname VARCHAR(20) NOT NULL,
  owner VARCHAR(45),
  species VARCHAR(45),
  gender ENUM('M', 'F') NULL,
  birth DATE,
  death DATE,
  PRIMARY KEY (petname)
);

CREATE TABLE petEvent (
  eventID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  petname VARCHAR(20),
  eventdate DATE,
  eventtype VARCHAR(45),
  remark VARCHAR(255),
  FOREIGN KEY (petname) REFERENCES petPet (petname)
);