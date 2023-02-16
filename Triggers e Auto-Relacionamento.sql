/* estrutura de uma trigger */

create trigger nome
before/after insert/delete/update on tabela
for each row (para cada linha)
begin -> inicio

		qualquer comando sql

end -> fim

create database aula40;

use aula40;

create table usuario(
	idusuario int primary key auto_increment,
	nome varchar(30),
	login varchar(30),
	senha varchar(100)
);

create table bkp_usuario(
	idbackup int primary key auto_increment,
	idusuario int,
	nome varchar(30),
	login varchar(30)
);

/* criando a trigger */

delimiter $

create trigger backup_user
before delete on usuario
for each row 
begin
		
	insert into bkp_usuario values
	(null,old.idusuario,old.nome,old.login);
end
$

insert into usuario values(null,'andrade','andrade2009','hexacampeao');

select * from usuario;

delete from usuario where idusuario = 1;

/* comunicacao entre bancos */

create database loja;

use loja;

create table produto(
	idproduto int primary key auto_increment,
	nome varchar(30),
	valor float(10,2)
);

status

create database backup;

use backup;

create table bkp_produto(
	idbkp int primary key auto_increment,
	idproduto int,
	nome varchar(30),
	valor float(10,2)
);

use loja;

status

insert into backup.bkp_produto values(null,1000,'teste',0.0);

select * from backup.bkp_produto;

delimiter $

create trigger backup_produt
before insert on produto
for each row
begin
	
	insert into backup.bkp_produto values(null,new.idproduto,
	new.nome,new.valor);

end
$

delimiter ;

insert into produto values(null,'livro modelagem',50.00);
insert into produto values(null,'livro bi',80.00);
insert into produto values(null,'livro oracle',70.00);
insert into produto values(null,'livro sql server',100.00);

select * from produto;

select * from backup.bkp_produto;

delimiter $

create trigger backup_produto_del
before delete on produto
for each row
begin
	
	insert into backup.bkp_produto values(null,old.idproduto,
	old.nome,old.valor);

end
$

delimiter ;

delete from produto where idproduto = 2;

drop trigger backup_produt;

delimiter $

create trigger backup_produto
after insert on produto
for each row
begin
	
	insert into backup.bkp_produto values(null,new.idproduto,
	new.nome,new.valor);

end
$

delimiter ;

insert into produto values(null,'livro c#',100.00);


select * from produto;
select * from backup.bkp_produto;

alter table backup.bkp_produto
add evento char(1);

drop trigger backup_produto_del;

delimiter $

create trigger backup_produto_del
before delete on produto
for each row
begin
	
	insert into backup.bkp_produto values(null,old.idproduto,
	old.nome,old.valor,'d');

end
$

delimiter ;

delete from produto where idproduto = 4;

select * from backup.bkp_produto;

/* trigger de auditoria */

delimiter ;

drop database loja;

drop database backup;

create database loja;

use loja;

create table produto(
	idproduto int primary key auto_increment,
	nome varchar(30),
	valor float(10,2)
);

insert into produto values(null,'livro modelagem',50.00);
insert into produto values(null,'livro bi',80.00);
insert into produto values(null,'livro oracle',70.00);
insert into produto values(null,'livro sql server',100.00);

/*quando*/
select now();
/*quem*/
select current_user();

create database backup;

use backup;

create table bkp_produto(
	idbackup int primary key auto_increment,
	idproduto int,
	nome varchar(30),
	valor_original float(10,2),
	valor_alterado float(10,2),
	data datetime,
	usuario varchar(30),
	evento char(1)
	
);

use loja;

select * from produto;

delimiter $

create trigger audit_prod
after update on produto
for each row
begin

	insert into backup.bkp_produto values(null,old.idproduto,old.nome,
	old.valor,new.valor,now(),current_user(),'u');
	
end
$

delimiter ;

update produto set valor = 110.00
where idproduto = 4;

select * from produto;

select * from backup.bkp_produto;

/* autorelacionamento */


create table cursos(
	idcurso int primary key auto_increment,
	nome varchar(30),
	horas int,
	valor float(10,2),
	id_prereq int
);

alter table cursos add constraint fk_prereq
foreign key(id_prereq) references cursos(idcurso);

insert into cursos values(null,'bd relacional',20,400.00,null);
insert into cursos values(null,'business intelligence',40,800.00,1);
insert into cursos values(null,'relatorios avancados',20,600.00,2);
insert into cursos values(null,'logica program',20,400.00,null);
insert into cursos values(null,'ruby',30,500.00,4);

select * from cursos;

select nome, valor, horas, ifnull(id_prereq,"sem req") requisito
from cursos;

/* nome, valor, horas e o nome do pre requisito do curso */

select 
c.nome as curso, 
c.valor as valor, 
c.horas as carga, 
ifnull(p.nome, "---") as prereq
from cursos c left join cursos p
on p.idcurso = c.id_prereq;

/* a 45 - cursores */

create database cursores;
use cursores;

create table vendedores(
	idvendedor int primary key auto_increment,
	nome varchar(50),
	jan int,
	fev int,
	mar int
);

insert into vendedores values(null,'mafra',32432,242334,574545);
insert into vendedores values(null,'clara',65465,65443,653454);
insert into vendedores values(null,'joao',12432,65356,8756);
insert into vendedores values(null,'lilian',4567,9676,8765);
insert into vendedores values(null,'antonio',3467,68756,99765);
insert into vendedores values(null,'gloria',54786,76889,7098);

select * from vendedores;

select nome, (jan+fev+mar) as total from vendedores;
select nome, (jan+fev+mar) as total, (jan+fev+mar)/3 as media from vendedores;

create table vend_total(
	nome varchar(50),
	jan int,
	fev int,
	mar int,
	total int,
	media int
);

delimiter $

create procedure inseredados()
begin
		declare fim int default 0;
		declare var1, var2, var3, vtotal, vmedia int;
		declare vnome varchar(50);
		
		declare reg cursor for(
			select nome, jan, fev, mar from vendedores
		);
		
		declare continue handler for not found set fim = 1;
		
		open reg;
		
		repeat
		
			fetch reg into vnome, var1, var2, var3;
			if not fim then
			
				set vtotal = var1 + var2 + var3;
				set vmedia = vtotal / 3;
				
				insert into vend_total values(vnome,var1,var2,var3,vtotal,vmedia);
				
			end if;
			
		until fim end repeat;
		
		close reg;
end
$

select * from vendedores;
select * from vend_total;

delimiter ;

call inseredados();

insert into vendedores values(null,'leticia',656,3546,234545);
insert into vendedores values(null,'celia',6766,56556,65454);

select * from vendedores;
select * from vend_total;

delete from vend_total;

call inseredados();

/* a 46 triggers com variaveis */

delimiter $

create trigger cadtotal
before insert on vendedores
for each row
begin
		declare vtotal, vmedia int;
		
		set vtotal := new.jan + new.fev + new.mar;
		set vmedia := (new.jan + new.fev + new.mar)/3;
		
		insert into vend_total values(new.nome,new.jan,new.fev,new.mar,vtotal,vmedia);

end
$

delimiter ;

insert into vendedores values(null,'julio',9999,9999,9999);
						  
select * from vendedores;
select * from vend_total;

/* a47 segunda e terceiras formas normais */

/*
	 primeira fn
	 
	 atomicidade - um campo nao pode ser divisivel
	 um campo nao pode ser vetorizado
	 pk chave primaria

*/

create database consultorio;

create table paciente(
	idpaciente int primary key auto_increment,
	nome varchar(30),
	sexo char(1),
	email varchar(30),
	nascimento date
);

create table medico(
	idmedico int primary key identity,
	nome varchar(30),
	sexo cahr(1),
	especialidade varchar(30),
	funcionario enum('s','n')
);

create table hospital(
	idhospital int primary key auto_increment,
	nome varchar(30),
	bairro varchar(30),
	cidade varchar(30),
	estado char(2)
);

create table consulta(
	idconsulta int primary key auto_increment,
	id_paciente int,
	id_medico int,
	id_hospital int,
	data datetime,
	diagnostico varchar(50)
);

create table internacao(
	idinternacao int primary key auto_increment,
	entrada datetime,
	quarto int,
	saida datetime,
	observacoes varchar(50),
	id_consulta int unique	
);  





































