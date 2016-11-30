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


