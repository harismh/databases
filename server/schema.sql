DROP DATABASE IF EXISTS chat;
CREATE DATABASE chat;

USE chat;

CREATE TABLE users (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,

  UNIQUE(`username`),
  PRIMARY KEY (`id`)
);

CREATE TABLE messages (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(255) NOT NULL,
  `userid` INTEGER NOT NULL,
  `roomname` VARCHAR(50) NOT NULL,  
  `createdAt` DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY(`id`),
  FOREIGN KEY(userid) REFERENCES users(`id`)
);

/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables. */