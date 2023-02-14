/* alterando tabelas - dicionario de dados */

create table tabela(
	coluna1 varchar(30),
	coluna2 varchar(30),
	coluna3 varchar(30)
);

create table tabela(
	coluna1 int primary key auto_increment
);

--adicionando uma pk
alter table tabela 
add primary key (coluna1);

--adicionando coluna sem posicao. ultima posicao
alter table tabela 
add coluna varchar(30);

alter table tabela 
add coluna100 int;

--adicionando uma coluna com posicao
alter table tabela 
add column coluna4 varchar(30) not null unique
after coluna3;

--modificando o tipo de um campo
alter table tabela
 modify coluna2 date not null;

--renomeando o nome da tabela
alter table tabela 
rename pessoa;

create table time(
	idtime int primary key auto_increment,
	time varchar(30),
	id_pessoa varchar(30)
);

--foreign key
alter table time 
add foreign key(id_pessoa)
references pessoa(coluna1);

/* verificar as chaves */
show create table time;

/*organizacao de chaves - constraint (regra) */

create table jogador(
	idjogador int primary key auto_increment,
	nome varchar(30)
);

create table times(
	idtime int primary key auto_increment,
	nometime varchar(30),
	id_jogador int,
	foreign key(id_jogador)
	references jogador(idjogador)
);

insert into jogador values(null,'guerrero');
insert into times values(null,'flamengo',1);

show create table jogador;
show create table times;

/*organizando chaves */

show tables;

drop table endereco;
drop table telefone;
drop table cliente;

create table cliente(
	idcliente int,
	nome varchar(30) not null
);

create table telefone(
	idtelefone int,
	tipo char(3) not null,
	numero varchar(10) not null,
	id_cliente int
);

alter table cliente add constraint pk_cliente
primary key(idcliente);

alter table telefone add constraint fk_cliente_telefone
foreign key(id_cliente) references cliente(idcliente);

show create table telefone;

/* dicionario de dados */

show databases;

use information_schema;

status

show tables;

desc table_constraints;

select constraint_schema as "banco",
	   table_name as "tabela",
	   constraint_name as "nome regra",
	   constraint_type as "tipo"
	   from table_constraints
	   where constraint_schema = 'comercio';

/* apagando constraints */

use comercio;

alter table telefone
drop foreign key fk_cliente_telefone;

alter table telefone add constraint fk_cliente_telefone
foreign key(id_cliente) references cliente(idcliente);

/*acoes de constraints */

show tables;

insert into cliente values(1,'ricardo');
insert into cliente values(2,'clara');
insert into cliente values(3,'julio');
insert into cliente values(4,'ana');

insert into telefone values(10,'cel','37834334',2);
insert into telefone values(20,'res','67465656',2);
insert into telefone values(30,'cel','88665645',1);
insert into telefone values(40,'res','77543546',3);
insert into telefone values(50,'com','75454675',1);
insert into telefone values(60,'cel','76765455',4);

select nome, tipo, numero
from cliente
inner join telefone
on idcliente = id_cliente;

/*erro de referencia */
delete from cliente where idcliente = 1;

/*corrigir erro*/
delete from telefone
where id_cliente = 1;
delete from cliente where idcliente = 1;

/* apagando a foreign key */

alter table telefone drop foreign key fk_cliente_telefone;

/*recriando a fk */

alter table telefone add constraint fk_cliente_telefone
foreign key(id_cliente) references cliente(idcliente)
on delete cascade;

select nome, tipo, numero
from cliente
inner join telefone
on idcliente = id_cliente;

delete from cliente where idcliente = 2;

alter table telefone drop foreign key fk_cliente_telefone;

alter table telefone add constraint fk_cliente_telefone
foreign key(id_cliente) references cliente(idcliente)
on delete set null;

select nome, tipo, numero
from cliente
inner join telefone
on idcliente = id_cliente;

select * from cliente;

delete from cliente where idcliente = 3;

select * from telefone;

/* set null - delete cascade */

/* ex oficina do seu zé */

create database projeto;

use projeto;

/* modelo fisico */

create database oficina;

use oficina;

create table cliente(
	idcliente int primary key auto_increment,
	nome varchar(30) not null,
	sexo enum('m','f') not null,
	id_carro int unique
);

create table telefone(
	idtelefone int primary key auto_increment,
	tipo enum('cel','res','com') not null,
	numero varchar(30) not null,
	id_cliente int 
);

create table marca(
	idmarca int primary key auto_increment,
	marca varchar(30) unique
);

create table carro(
	idcarro int primary key auto_increment,
	modelo varchar(30) not null,
	placa varchar(30) not null unique,
	id_marca int
);

create table cor(
	idcor int primary key auto_increment,
	cor varchar(30) unique
);

create table carro_cor(
	id_carro int,
	id_cor int,
	primary key(id_carro,id_cor)
);

/* constraints */

alter table telefone 
add constraint fk_telefone_cliente
foreign key(id_cliente)
references cliente(idcliente);


alter table cliente
add constraint fk_cliente_carro
foreign key(id_carro)
references carro(idcarro);


alter table carro
add constraint fk_carro_marca
foreign key(id_marca)
references marca(idmarca);


alter table carro_cor
add constraint fk_cor
foreign key(id_cor)
references cor(idcor);


alter table carro_cor
add constraint fk_carro
foreign key(id_carro)
references carro(idcarro);


