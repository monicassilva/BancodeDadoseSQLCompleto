/* order by */

create table alunos(
	numero int,
	nome varchar(30)
);

insert into alunos values(1,'joao');
insert into alunos values(1,'maria');
insert into alunos values(2,'zoe');
insert into alunos values(2,'andre');
insert into alunos values(3,'clara');
insert into alunos values(1,'clara');
insert into alunos values(4,'mafra');
insert into alunos values(5,'janaina');
insert into alunos values(1,'janaina');
insert into alunos values(3,'marcelo');
insert into alunos values(4,'giovani');
insert into alunos values(5,'antonio');
insert into alunos values(6,'ana');
insert into alunos values(6,'viviane'); 

select * from alunos
order by numero;

select * from alunos
order by 1;

select * from alunos
order by 2;

/* ordenando por mais de uma coluna */

select * from alunos
order by 1;

select * from alunos
order by numero, nome;

select * from alunos
order by 1, 2;

/* mesclando order by com projecao */

select nome from alunos
order by 1, 2;

select nome from alunos
order by numero, nome;


/* order by desc / asc */

select * from alunos
order by 1, 2;

select * from alunos
order by 1 asc;

select * from alunos
order by 1 desc;

select * from alunos
order by 1, 2 desc;

select * from alunos
order by 1 desc, 2 desc;

/* ordenando com joins */


select  c.nome, 
		c.sexo, 
		ifnull(c.email,'cliente sem email') as email,
		t.tipo, 
		t.numero, 
		e.bairro, 
		e.cidade, 
		e.estado
from cliente c 
inner join telefone t 
on c.idcliente = t.id_cliente 
inner join endereco e 
on c.idcliente = e.id_cliente
order by 1;

show tables;

select * from v_relatorio
order by 1;

