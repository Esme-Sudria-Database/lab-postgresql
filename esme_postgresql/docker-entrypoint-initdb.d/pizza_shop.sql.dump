create table CUSTOMER (
  customer_id int primary key not null,
  name varchar(30) null
);

/* We can also have multiline
   comments with a C-like syntax */
create table PIZZA (
  pizza_id int primary key not null,
  name varchar(30) not null,
  unit_price int not null
);

/* When you use reserved word as ORDER
    you have to surround it by quote” */
create table "order" (
  order_id int not null,
  customer_id int not null,
  pizza_id int not null,
  order_date timestamp not null,
  quantity int not null,
  primary key (order_id)
);

create table PIZZA_OLD (
  pizza_id int primary key not null,
  name varchar(30) not null,
  unit_price int not null
);

create table INVOICE (
  customer_id int not null,
  order_id int not null,
  total_price int not null
);

-- Create foreign key from order's columns
-- to references (customer and pizza)
alter table "order"
  add constraint FK_ORDER_CUSTOMER
  foreign key (customer_id)
  references CUSTOMER (customer_id);

alter table "order"
  add constraint FK_ORDER_PIZZA
  foreign key (pizza_id)
  references PIZZA (pizza_id);

create view VIEW_ORDERS as
Select
   c.customer_id as customer_id,
   c.name as customer_name,
   o.order_id as order_id,
   o.order_date,
   p.name as pizza_name,
   o.quantity,
   p.unit_price,
   o.quantity * p.unit_price as total_price
from
   "order" o
   join PIZZA p on o.pizza_id = p.pizza_id
   join CUSTOMER c on o.customer_id = c.customer_id;

insert into CUSTOMER values (1, 'John Doe');
insert into CUSTOMER values (2, 'Jean d’Alembert');
insert into CUSTOMER values (3, 'Gordon Farmer');
insert into CUSTOMER values (4, 'Jared Westlake');
insert into CUSTOMER values (5, 'Jordan Peck');
insert into CUSTOMER values (6, 'Denis Warde');
insert into CUSTOMER values (7, 'Olivia Freville');
insert into CUSTOMER values (8, 'Kiara Key');

insert into PIZZA values (1, 'Margherita', 9);
insert into PIZZA values (2, 'Reine', 17);
insert into PIZZA values (3, 'Anchois', 10);
insert into PIZZA values (4, 'Napolitaine', 10);
insert into PIZZA values (5, 'Trois fromage', 13);
insert into PIZZA values (6, 'Legumina', 16);

insert into PIZZA_OLD values (1, 'Legumina', 15);
insert into PIZZA_OLD values (2, 'Merguez', 13);

insert into "order" values (1, 3, 4, '2015-11-16', 3);
insert into "order" values (2, 1, 3, '2015-10-16', 4);
insert into "order" values (3, 1, 4, '2015-11-16', 5);
insert into "order" values (4, 4, 2, '2015-11-16', 4);
insert into "order" values (5, 5, 2, '2015-11-16', 3);
insert into "order" values (6, 6, 1, '2015-11-16', 1);
insert into "order" values (7, 5, 5, '2015-11-16', 2);
