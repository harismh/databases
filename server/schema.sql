DROP DATABASE IF EXISTS chat;
CREATE DATABASE chat;

USE chat;

/* Create other tables and define schemas for them here! */
DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) DEFAULT NULL,

  UNIQUE(`username`),
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS chatroom;
CREATE TABLE chatroom (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `roomname` VARCHAR(50) DEFAULT NULL,

  UNIQUE(`roomname`),
  PRIMARY KEY(`id`)
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  /* Describe your table here.*/
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(255) DEFAULT NULL,
  `userid` INTEGER DEFAULT NULL,
  `roomid` INTEGER DEFAULT NULL,
  `createdAt` TIMESTAMP,
  
  PRIMARY KEY(`id`),
  FOREIGN KEY(userid) REFERENCES users(`id`),
  FOREIGN KEY(roomid) REFERENCES chatroom(`id`)
);
/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

