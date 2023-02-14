/* a29 funcoes de agregacao numericas */

create table vendedores(
	idvendedor int primary key auto_increment,
	nome varchar(30),
	sexo char(1),
	janeiro float(10,2),
	fevereiro float(10,2),
	marco float(10,2)
);

insert into vendedores values(null,'carlos','m',76234.78,88346.87,5756.90);
insert into vendedores values(null,'maria','f',5865.78,6768.87,4467.90);
insert into vendedores values(null,'antonio','m',78769.78,6685.87,6664.90);
insert into vendedores values(null,'clara','f',5779.78,446886.87,8965.90);
insert into vendedores values(null,'anderson','m',676545.78,77544.87,578665.90);
insert into vendedores values(null,'ivone','f',57789.78,44774.87,68665.90);
insert into vendedores values(null,'joao','m',4785.78,66478.87,6887.90);
insert into vendedores values(null,'celia','f',89667.78,57654.87,5755.90);

/* max - traz o valor maximo de uma coluna */

	select max(fevereiro) as maior_fev
	from vendedores;


/* min - traz o valor minimo de uma coluna */

select min(fevereiro) as menor_fev
from vendedores;

/* avg - traz o valor medio de uma coluna */

select avg(fevereiro) as media_fev
from vendedores;

/* varias funcoes */

select max(janeiro) as max_jan,
       min(janeiro) as min_jan,
	   avg(janeiro) as media_jan
	   from vendedores;
	 
/*truncate */
	 
select max(janeiro) as max_jan,
       min(janeiro) as min_jan,
	   truncate(avg(janeiro),2) as media_jan
	   from vendedores;
       
/* a30 - agregando com sum() */

select sum(janeiro) as total_jan
from vendedores;

select sum(janeiro) as total_jan,
	   sum(fevereiro) as total_fev,
	   sum(marco) as total_mar
from vendedores;

/* vendas por sexo */

select sexo, sum(marco) as total_marco
from vendedores
group by sexo;
