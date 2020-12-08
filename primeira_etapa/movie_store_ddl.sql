CREATE DATABASE video_store;
USE video_store;

CREATE TABLE customer (
  id         varchar(11) PRIMARY KEY,
  name       varchar(50) NOT NULL,
  address_id varchar(255),
  telephone  varchar(14) NOT NULL,
  gender     varchar(1),
  birth_date decimal(10, 2)
);

CREATE TABLE movie (
  id       varchar(32)  PRIMARY KEY,
  title    varchar(100) NOT NULL,
  synopsis varchar(250) NOT NULL,
  gender   varchar(50)  NOT NULL
);

CREATE TABLE rent (
  id          varchar(32)   PRIMARY KEY,
  customer_id varchar(255),
  movie_id    varchar(255),
  rented      date          DEFAULT (now()),
  returned    date,
  value       decimal(10,2) NOT NULL
);

CREATE TABLE address (
  id           varchar(32)  PRIMARY KEY,
  address      varchar(250) NOT NULL,
  zipcode      varchar(8)   NOT NULL,
  city         varchar(50)  DEFAULT "Uberlândia",
  neighborhood varchar(50)  NOT NULL,
  state        varchar(50)  DEFAULT "Minas Gerais"
);

ALTER TABLE customer ADD FOREIGN KEY (address_id) REFERENCES address (id);

ALTER TABLE rent ADD FOREIGN KEY (customer_id) REFERENCES customer (id);

ALTER TABLE rent ADD FOREIGN KEY (movie_id) REFERENCES movie (id);
