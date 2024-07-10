create database shopping;

create type role as enum('admin','consumer','customer');
create type status as enum('in_progress','purchased');
create type category as enum('electronic','sport','clothes');

create table users (
                       id serial primary key,
                       fullname varchar not null,
                       username varchar unique not null,
                       password varchar not null,
                       pre_password varchar not null ,
                       email varchar not null,
                       age int,
                       role role default 'USER'
);



create table market (
                        id serial primary key,
                        name varchar not null,
                        owner_id integer
);

alter table market add constraint fk_users_market foreign key (owner_id) references users(id);

create table basket (
                        id serial primary key,
                        order_date date not null,
                        status status not null,
                        consumer_id integer not null
);

alter table basket add constraint fk_users_basket foreign key (consumer_id) references users(id);

create table orders (
                        id serial primary key,
                        count integer not null,
                        product_id integer not null,
                        basket_id integer not null
);
alter table orders add constraint fk_product_orders foreign key (product_id) references product(id);
alter table orders add constraint fk_basket_orders foreign key (basket_id) references basket(id);


create table order_details (
                               id serial primary key,
                               price integer not null,
                               basket_id integer not null
);

alter table order_details add constraint fk_basket_order_details foreign key (basket_id) references basket(id);

create table product (
                         id serial primary key,
                         name varchar not null,
                         price integer not null,
                         description varchar not null,
                         count integer not null,
                         category category not null,
                         create_date date not null,
                         image varchar not null,
                         market_id integer not null
);

alter table product add constraint fk_market_product foreign key (market_id) references market(id);

create table verification (
                              id        serial primary key,
                              sent_code varchar not null,
                              user_id   integer not null
);

alter table verification add constraint fk_users_verification foreign key (user_id) references users(id);


select * from market