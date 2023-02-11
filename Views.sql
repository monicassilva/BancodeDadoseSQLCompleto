-- campos nulos - tratamento

select  c.nome, 
		ifnull(c.email,'nao tem email'), as "email"
		e.estado, 
		t.numero
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente;

/* view */

select  c.nome, 
		c.sexo, 
		c.email, 
		t.tipo, 
		t.numero, 
		e.bairro, 
		e.cidade, 
		e.estado
from cliente c 
inner join telefone t 
on c.idcliente = t.id_cliente 
inner join endereco e 
on c.idcliente = e.id_cliente;

create view relatorio as
select  c.nome, 
		c.sexo, 
		c.email, 
		t.tipo, 
		t.numero, 
		e.bairro, 
		e.cidade, 
		e.estado
from cliente c 
inner join telefone t 
on c.idcliente = t.id_cliente 
inner join endereco e 
on c.idcliente = e.id_cliente;

select * from relatorio;

show tables;
show databases;
show view; -- nao existe

/* apagando uma view */

drop view relatorio;

/* inserindo um prefixo */

create view v_relatorio as
select  c.nome, 
		c.sexo, 
		ifnull(c.email,'cliente sem email') as "e-mail", 
		t.tipo, 
		t.numero, 
		e.bairro, 
		e.cidade, 
		e.estado
from cliente c 
inner join telefone t 
on c.idcliente = t.id_cliente 
inner join endereco e 
on c.idcliente = e.id_cliente;

select nome, numero, estado
from v_relatorio;

/* update, insert e delete - dml */

insert into v_relatorio values(
'andreia','f','andreia@uol.com.br','cel','873547864','centro','vitoria','es'
);

error 1394 (hy000): can not insert into join view 'comercio.v_relatorio' without fields list
error 1395 (hy000): can not delete from join view 'comercio.v_relatorio'

delete from v_relatorio where nome = 'jorge';

/* é permitido fazer updates em views com join */

update v_relatorio set nome = 'jose' where nome = 'jorge';

create table jogadores(
	idjogador int,
	nome varchar(30),
	estado char(2)
);

insert into jogadores values(1,'guerrero','rs');
insert into jogadores values(2,'gabigol','rj');
insert into jogadores values(3,'ganso','rj');
insert into jogadores values(4,'nenê', 'rj');
insert into jogadores values(5,'love','sp');

create view v_jogadores as
select nome, estado
from jogadores;

select * from v_jogadores;

delete from v_jogadores
where nome = 'guerrero';

insert into v_jogadores values('guerrero','rs');

select * from jogadores;

select * from v_relatorio
where sexo = 'f';
