create table "user"(
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

insert into "proveedor"(name_proveedor) values('juan');

/*Tabla Sale MOdificada*/
Create table sale(
  id_sale SERIAL primary key,
  name_buyer varchar,
  dni integer,
  ruc integer,
  address varchar,
  voucher varchar,
  price_total integer,
  date_sale TIMESTAMP WITH TIME ZONE
);

insert into sale(name_buyer,dni,ruc,address,voucher,price_total,date_sale)
values('Maria Sanchez',72545430,1423,'Av Independencia','voucher 1',50,'now');
insert into sale(name_buyer,dni,ruc,address,voucher,price_total,date_sale)
values('PatoLucas',787579,1423,'Av Coritos','voucher 1',50,'now');
select * from sale

/*Clase Producto Oficial*/
Create table product(
  id_product SERIAL primary key,
  name_product varchar,
  price numeric(6,2),
  stock integer,
  grupo integer,
  subgrupo integer,
  cod_item integer,
  codigo varchar

);
insert into product(name_product,price,stock,grupo,subgrupo,cod_item,codigo) values('CajaMetalica',58.90,2000,1,3,6589,'01-03-6589');
insert into product(name_product,price,stock,grupo,subgrupo,cod_item,codigo) values('Pegamento',13.10,2000,2,3,7899,'02-03-7899');
insert into product(name_product,price,stock,grupo,subgrupo,cod_item,codigo) values('Tubos',119,2000,1,3,4565,'01-03-4565');
insert into product(name_product,price,stock,grupo,subgrupo,cod_item,codigo) values('Fierros',256.78,2000,3,3,1111,'03-03-1111');

