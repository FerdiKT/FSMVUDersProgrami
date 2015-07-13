CREATE DATABASE schedule;
grant all on schedule.* to 'admin' identified by '1234';
use schedule;

CREATE TABLE `member` (
  `userid` char(10) default NULL,
  `name` char(10) default NULL,
  `password` char(10) default NULL,
  `email` char(20) default NULL,
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
);


CREATE TABLE `scheduletable` (
  `date` date default NULL,
  `title` varchar(150) default NULL,
  `context` text,
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
);
