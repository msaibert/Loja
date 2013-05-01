create domain description as varchar(60);
create domain currency as numeric(15,2);
create domain percent as numeric(15,4);

drop table if exists produtos, operacoes;

create table produtos (
id serial primary key,
descricao description,
preco currency
);

create table operacoes (
id serial primary key,
descricao description 
);

