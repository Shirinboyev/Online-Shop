create database shopping;

create type role as enum('admin','consumer','customer');
create type status as enum('in_progress','purchased');
create type category as enum('electronic','sport','clothes');

create table Users (
                       id serial primary key,
                       fullname varchar not null,
                       username varchar unique not null,
                       password varchar not null,
                       email varchar not null,
                       birthday date,
                       role role
);

create table Market (
                        id serial primary key,
                        name varchar not null,
                        owner_id integer
);

alter table Market add constraint fk_users_market foreign key (owner_id) references Users(id);

create table Basket (
                        id serial primary key,
                        order_date date not null,
                        status status not null,
                        consumer_id integer not null
);

alter table Basket add constraint fk_users_basket foreign key (consumer_id) references Users(id);

create table Orders (
                        id serial primary key,
                        count integer not null,
                        product_id integer not null,
                        basket_id integer not null
);
alter table Orders add constraint fk_product_orders foreign key (product_id) references Product(id);
alter table Orders add constraint fk_basket_orders foreign key (basket_id) references Basket(id);


create table Order_details (
                               id serial primary key,
                               price integer not null,
                               basket_id integer not null
);

alter table Order_details add constraint fk_basket_order_details foreign key (basket_id) references Basket(id);

create table Product (
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

alter table Product add constraint fk_market_product foreign key (market_id) references Market(id);

create table Verification (
                              id        serial primary key,
                              sent_code varchar not null,
                              user_id   integer not null
);

alter table Verification add constraint fk_users_verification foreign key (user_id) references Users(id);