create database shopping;
create table users
(
    id       serial
        primary key,
    fullname varchar not null,
    username varchar not null
        unique,
    password varchar not null,
    email    varchar not null,
    age      integer,
    role     varchar
);

alter table users
    owner to postgres;

create table market
(
    id       serial
        primary key,
    name     varchar not null,
    owner_id integer
        constraint fk_users_market
            references users
);

alter table market
    owner to postgres;

create table basket
(
    id          serial
        primary key,
    order_date  timestamp not null,
    status      status    not null,
    consumer_id integer   not null
        constraint fk_users_basket
            references users
);

alter table basket
    owner to postgres;

create table order_details
(
    id        serial
        primary key,
    price     integer not null,
    basket_id integer not null
        constraint fk_basket_order_details
            references basket
);

alter table order_details
    owner to postgres;

create table product
(
    id          serial
        primary key,
    name        varchar   not null,
    price       integer   not null,
    description varchar   not null,
    count       integer   not null,
    category    category  not null,
    create_date timestamp not null,
    image       varchar   not null,
    market_id   integer   not null
        constraint fk_market_product
            references market
);

alter table product
    owner to postgres;

create table orders
(
    id         serial
        primary key,
    count      integer not null,
    product_id integer not null
        constraint fk_product_orders
            references product,
    basket_id  integer not null
        constraint fk_basket_orders
            references basket
);

alter table orders
    owner to postgres;

create table verification
(
    id        serial
        primary key,
    sent_code varchar not null,
    user_id   integer not null
        constraint fk_users_verification
            references users
);

alter table verification
    owner to postgres;

SELECT * FROM market