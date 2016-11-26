create table "user"(
  id SERIAL primary key,
  first_name varchar,
  last_name varchar,
  email varchar,
  account varchar,
  user_type INTEGER,
  "password" varchar
);

CREATE TABLE "Order"(
    id_order SERIAL primary key,
    id_provider int,
    id_client int,
    id_product int,
    order_state int,
    order_date Date 
)
xo
INSERT INTO "Order"(id_provider,id_client,id_product,order_state,order_date) VALUES (1,2,3,0,'2016-09-02'::DATE);




insert into "user"(first_name,last_name,email,account,user_type,"password") values('javier','marin','algo@gmail.com','paracelso',2,'contraceña');
insert into "user"(first_name,last_name,email,account,user_type,"password") values('francisco','marin','algo@gmail.com','froznar',1,'contraceña');



insert into "user"(first_name,last_name,email,account,user_type,"password") values('javier','marin','algo@gmail.com','paracelso',2,'contraceña');
insert into "user"(first_name,last_name,email,account,user_type,"password") values('francisco','marin','algo@gmail.com','froznar',1,'contraceña');

insert into "user"(first_name,last_name,email,account,user_type,"password") values('Darth','Vader','darth@gmail.com','ucsp',3,'pass');
insert into "user"(first_name,last_name,email,account,user_type,"password") values('Paula','','paula@gmail.com','ucsp',3,'pass');
insert into "user"(first_name,last_name,email,account,user_type,"password") values('Vanessa','Santillana','vs@gmail.com','ucsp',4,'pasword');


create table "provider"(
  id_provider SERIAL primary key,
  name_provider varchar,
  RUC varchar,
  address varchar,
  email varchar,
  phone varchar
);

insert into "provider"(name_provider,ruc,address,email,phone) values('nacho','12345','av.ventura 1234','nash@vent.com','95736722');


create table product(
  id_product SERIAL primary key,
  name_product varchar,
  price numeric(6,2),
  stock integer,
  grupo integer,
  subgrupo integer,
  cod_item integer,
  codigo varchar

);

insert into product(name_product,price,stock,grupo,subgrupo,cod_item,codigo) values('Caja Metalica',58.90,2000,1,3,6589,'01-03-6589');

create table type_product(
       id_type_product SERIAL primary key,
       type_name varchar,
       description varchar
);

insert into type_product(type_name,description) values ('construccion','Materiales que seran usados para la construccion, por ejemplo cemento, metales y demas');
