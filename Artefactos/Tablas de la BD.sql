﻿create table "user"(
  id SERIAL primary key,
  first_name varchar,
  last_name varchar,
  email varchar,
  account varchar,
  user_type INTEGER,
  "password" varchar
);


insert into "user"(first_name,last_name,email,account,user_type,"password") values('javier','marin','algo@gmail.com','paracelso',2,'contraceña');
insert into "user"(first_name,last_name,email,account,user_type,"password") values('francisco','marin','algo@gmail.com','froznar',1,'contraceña');



insert into "user"(first_name,last_name,email,account,user_type,"password") values('javier','marin','algo@gmail.com','paracelso',2,'contraceña');
insert into "user"(first_name,last_name,email,account,user_type,"password") values('francisco','marin','algo@gmail.com','froznar',1,'contraceña');

insert into "user"(first_name,last_name,email,account,user_type,"password") values('Darth','Vader','darth@gmail.com','ucsp',3,'pass');
insert into "user"(first_name,last_name,email,account,user_type,"password") values('Paula','','paula@gmail.com','ucsp',3,'pass');
insert into "user"(first_name,last_name,email,account,user_type,"password") values('Vanessa','Santillana','vs@gmail.com','ucsp',4,'pasword');


create table "proveedor"(
  id_proveedor SERIAL primary key,
  name_proveedor varchar
);

create table "almacen" (
    id_almacen SERIAL primary key,
    name_almacen varchar,
    map varchar,
);

create table "producto"(
    id_producto SERIAL primary key,
    name_producto varchar,
    codigo integer,
    costo_unitario integer,
    grupo varchar,
    subgrupo varchar,
    tiempo_demora_entrega integer,
    ubicacion_en_almacen varchar,
    id_almacen integer,
    FOREIGN KEY (id_almacen) REFERENCES "almacen"(id_almacen)
);

insert into "proveedor"(name_proveedor) values('juan');

