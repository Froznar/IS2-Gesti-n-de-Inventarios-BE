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

INSERT INTO "Order"(id_provider,id_client,id_product,order_state,order_date) VALUES (1,2,3,0,'2016-09-02'::DATE);




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


Create table sale(
  id_sale SERIAL primary key,
  nameBuyer varchar,
  DNI integer,
  RUC integer,
  address varchar,
  voucher varchar,
  priceTotal integer,
  dateSale TIMESTAMP WITH TIME ZONE
);

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

--insert into product(nameProduct,price,stack,productType) values('Caja Metalica',58,2000,'Producto A');
--insert into product(nameProduct,price,stack,productType) values('Pegamento',6,80,'Producto B');
--insert into product(nameProduct,price,stack,productType) values('Fierro de Acero',250,4200,'Producto A');
--insert into product(nameProduct,price,stack,productType) values('Tubos',120,1002,'Producto C');

insert into product(name_product,price,stock,grupo,subgrupo,cod_item,codigo) values('Caja Metalica',58.90,2000,1,3,6589,'01-03-6589');
insert into product(name_product,price,stock,grupo,subgrupo,cod_item,codigo) values('Pegamento',13.10,2000,2,3,7899,'02-03-7899');
insert into product(name_product,price,stock,grupo,subgrupo,cod_item,codigo) values('Tubos de Acero',119,2000,1,3,4565,'01-03-4565');
insert into product(name_product,price,stock,grupo,subgrupo,cod_item,codigo) values('Fierros Cobre',256.78,2000,3,3,1111,'03-03-1111');

--select * from product

insert into sale(nameBuyer,DNI,RUC,address,voucher,priceTotal,dateSale)
values('Maria Sanchez',72545430,1423,'Av Independencia','voucher 1',150,'now');

insert into sale_product(id_sale, id_product, cantidad, precio_unidad) values (1, 1, 1, 58.90);
insert into sale_product(id_sale, id_product, cantidad, precio_unidad) values (1, 2, 1, 13.10);
