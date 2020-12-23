drop database video_store;
create database video_store;
use video_store;

create table customer (
  cpf        varchar(11) primary key,
  name       varchar(50) not null,
  address_id varchar(36),
  telephone  varchar(14) not null,
  gender     enum('f', 'm'),
  birth_date date
);

create table movie (
  id                varchar(36)    primary key,
  title             varchar(100)   not null,
  synopsis          varchar(250)   not null,
  suggested_value   decimal(10, 2) not null,
  gender            varchar(50)    not null
);

create table rent (
  id                int          auto_increment primary key,
  customer_id       varchar(36),
  movie_id          varchar(36),
  rented            date          default (now()),
  returned          date,
  value             decimal(10,2)
);

create table address (
  id           varchar(36)  primary key,
  address      varchar(250) not null,
  zipcode      varchar(10)  not null,
  city         varchar(50)  default "Uberlândia",
  neighborhood varchar(50)  not null,
  state        varchar(50)  default "Minas gerais"
);

alter table customer add foreign key (address_id) references address (id);

alter table rent add foreign key (customer_id) references customer (cpf);

alter table rent add foreign key (movie_id) references movie (id);
