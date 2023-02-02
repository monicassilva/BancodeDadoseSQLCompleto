create database livraria;

-- verificando os bancos 
show databases;

-- conectando a um banco 
use livraria;

create table livros(
	livro varchar(100),
	autor varchar(100),
	sexo char(1),
	paginas int(5),
	editora varchar(30),
	valor float(10,2),
	uf char(2),
	ano int(4)
);


-- inserindo dados
insert into livros values('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009);
insert into livros values('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);
insert into livros values('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);
insert into livros values('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ',2018);
insert into livros values('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ',2019);
insert into livros values('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);
insert into livros values('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);
insert into livros values('Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES',2011);
insert into livros values('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS',2018);
insert into livros values('O poder da mente','Clara Mafra','F',120,'Continental',56,'SP',2017);

-- trazer todos os dados
select * from livros;

-- trazer o nome do livro e da editora
select livro,
	   editora
from livros;
-- trazer o nome do livro e a UF de livros publicados por autores do sexo masculino
select livro,
       uf
from livros 
where sexo = 'M';
       	
-- trazer o nome do livro  e o numero de páginas dos livros publicados por autores do sexo feminino
select livro,
       paginas
from livros 
where sexo = 'F';

-- trazer os valores dos livros das editoras de SP
select valor,
	   livro 
from livros 
where uf = 'SP';

-- Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou  Rio de Janeiro
select autor,
	   sexo
from livros 
where sexo = 'M' 
and (uf = 'SP' or uf='RJ');













