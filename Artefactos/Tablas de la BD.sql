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
);



CREATE TABLE OrderState(
    id_order_state int,
    descripcion TEXT 
);

INSERT INTO OrderState VALUES(0,'Enviado');
INSERT INTO OrderState VALUES(1,'Recibido');
INSERT INTO OrderState VALUES(2,'Pendiente');
INSERT INTO OrderState VALUES(3,'Recibido a tiempo');
INSERT INTO OrderState VALUES(4,'Recibido Tarde');



INSERT INTO "Order"(id_provider,id_client,id_product,order_state,order_date) VALUES (1,2,3,0,'2016-09-02'::DATE);
INSERT INTO "Order"(id_provider,id_client,id_product,order_state,order_date) VALUES (2,2,1,1,'2016-10-06'::DATE);

INSERT INTO "Order"(id_provider,id_client,id_product,order_state,order_date) VALUES (2,3,4,2,'2016-02-27'::DATE);

INSERT INTO "Order"(id_provider,id_client,id_product,order_state,order_date) VALUES (3,3,2,2,'2016-02-02'::DATE);

INSERT INTO "Order"(id_provider,id_client,id_product,order_state,order_date) VALUES (3,3,2,3,'2016-02-02'::DATE);

INSERT INTO "Order"(id_provider,id_client,id_product,order_state,order_date) VALUES (1,1,1,4,'2016-02-02'::DATE);



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

create table "warehouse" (
    id_warehouse SERIAL primary key,
    name_warehouse varchar,
    map varchar
);
insert into "warehouse"(name_warehouse,map) values('Warehouse1', 'map1.jpg');

/*Tabla Sale MOdificada*/
Create table sale(
  id_sale SERIAL primary key,
  name_buyer varchar,
  dni integer,
  ruc integer,
  address varchar,
  voucher varchar,
  price_total decimal,
  date_sale TIMESTAMP WITH TIME ZONE
);

insert into sale(name_buyer,dni,ruc,address,voucher,price_total,date_sale)
values('Maria Sanchez',72545430,1423,'Av Independencia','voucher 1',50.3,'now');
insert into sale(name_buyer,dni,ruc,address,voucher,price_total,date_sale)
values('PatoLucas',787579,1423,'Av Coritos','voucher 1',50.1,'now');

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

create table sale_product(
    id_sale_product SERIAL primary key,
    id_sale integer,
    id_product integer,
    cantidad integer,
    precio_unidad numeric (6,2),
    foreign key (id_product) references product(id_product)
        on delete no action
        on update no action,
    foreign key (id_sale) references sale(id_sale)
        on delete no action
        on update no action
);

insert into sale_product(id_sale, id_product, cantidad, precio_unidad) values (1, 1, 1, 58.90);
insert into sale_product(id_sale, id_product, cantidad, precio_unidad) values (1, 2, 1, 13.10);
/*Tabla CLiente SQL*/
Create table client(
  id SERIAL primary key,
  first_name varchar,
  last_name varchar,
  dni integer,
  ruc integer,
  client_type INTEGER
);

insert into client(first_name,last_name,dni,ruc,client_type) values('sancho','panza',729285,96687,0);
insert into client(first_name,last_name,dni,ruc,client_type) values('don','quijote',752936,11111,1);
