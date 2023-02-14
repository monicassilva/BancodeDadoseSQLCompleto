use projeto;

-- stored procedures 

delimiter $

create procedure nome_empresa()
begin
	
	select 'universidade dos dados' as empresa;

end
$

/* chamando uma procedure */


call nome_empresa()$

delimiter ;

call nome_empresa();

/* procedures com parametros */

select 10 + 10 as conta;

delimiter $

create procedure conta()
begin
	
	select 10 + 10 as conta;

end
$

call conta();

drop procedure conta;

delimiter $

create procedure conta(numero1 int, numero2 int)
begin
	
	select numero1 + numero2 as conta;

end
$

call conta(100,50)$
call conta(345634,4354)$
call conta(55654,56760)$
call conta(45646,6766)$


create table cursos(
	idcurso int primary key auto_increment,
	nome varchar(30) not null,
	horas int(3) not null,
	valor float(10,2) not null
);

insert into cursos values(null,'java',30,500.00);
insert into cursos values(null,'fundamentos de bancos de dados',40,700.00);

select * from cursos;

delimiter #


create procedure cad_curso(p_nome varchar(30),
						   p_horas int(30),
						   p_preco  float(10,2))
begin
	
	insert into cursos values(null,p_nome,p_horas,p_preco);

end
#

delimiter ;

call cad_curso('bi sql server',35,3000.00);
call cad_curso('power bi',20,1000.00);
call cad_curso('tableau',30,1200.00);

-- criar uma procedure para consultar cursos 

delimiter $$
create procedure consulta_curso()
begin
	select * from cursos;
end $$

delimiter ; 
call consulta_curso();

