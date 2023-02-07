use comercio;


/* exercicios dml */
insert into cliente values(null,'flavio','m','flavio@ig.com','4657765');
insert into cliente values(null,'andre','m','andre@globo.com','7687567');
insert into cliente values(null,'giovana','f',null,'0876655');
insert into cliente values(null,'karla','m','karla@gmail.com','545676778');
insert into cliente values(null,'daniele','m','daniele@gmail.com','43536789');
insert into cliente values(null,'lorena','m',null,'774557887');
insert into cliente values(null,'eduardo','m',null,'54376457');
insert into cliente values(null,'antonio','f','antonio@ig.com','12436767');
insert into cliente values(null,'antonio','m','antonio@uol.com','3423565');
insert into cliente values(null,'elaine','m','elaine@globo.com','32567763');
insert into cliente values(null,'carmem','m','carmem@ig.com','787832213');
insert into cliente values(null,'adriana','f','adriana@gmail.com','88556942');
insert into cliente values(null,'joice','f','joice@gmail.com','55412256');

/* cadastre um endereco para cada cliente */

insert into endereco values(null,'rua guedes','cascadura','b. horizonte','mg',9);
insert into endereco values(null,'rua maia lacerda','estacio','rio de janeiro','rj',10);
insert into endereco values(null,'rua viscondessa','centro','rio de janeiro','rj',11);
insert into endereco values(null,'rua nelson mandela','copacabana','rio de janeiro','rj',12);
insert into endereco values(null,'rua araujo lima','centro','vitoria','es',13);
insert into endereco values(null,'rua castro alves','leblon','rio de janeiro','rj',14);
insert into endereco values(null,'av capitao antunes','centro','curitiba','pr',15);
insert into endereco values(null,'av carlos barroso','jardins','sao paulo','sp',16);
insert into endereco values(null,'alameda sampaio','bom retiro','curitiba','pr',17);
insert into endereco values(null,'rua da lapa','lapa','sao paulo','sp',18);
insert into endereco values(null,'rua geronimo','centro','rio de janeiro','rj',19);
insert into endereco values(null,'rua gomes freire','centro','rio de janeiro','rj',8);

/* cadastre telefones para os clientes */


insert into telefone values(null,'res','68976565',9);
insert into telefone values(null,'cel','99656675',9);
insert into telefone values(null,'cel','33567765',11);
insert into telefone values(null,'cel','88668786',11);
insert into telefone values(null,'com','55689654',11);
insert into telefone values(null,'com','88687979',12);
insert into telefone values(null,'com','88965676',13);
insert into telefone values(null,'cel','89966809',15);
insert into telefone values(null,'com','88679978',16);
insert into telefone values(null,'cel','99655768',17);
insert into telefone values(null,'res','89955665',18);
insert into telefone values(null,'res','77455786',19);
insert into telefone values(null,'res','89766554',19);


/* relatorio geral de todos os clientes */

/* relatorio geral de todos os clientes (telefone e endereco) */

desc cliente;
desc endereco;
desc telefone;

select c.idcliente, c.nome, c.sexo, c.email, c.cpf, 
	   e.rua, e.bairro, e.cidade, e.estado, 
	   t.tipo, t.numero
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente;


/* relatorio de homens */

select c.idcliente, c.nome, c.sexo, c.email, c.cpf, 
	   e.rua, e.bairro, e.cidade, e.estado, 
	   t.tipo, t.numero
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'm';

/* 12 13 18 19  */

select * from cliente
where idcliente = 12
or idcliente = 13
or idcliente = 18
or idcliente = 19;

select * from cliente
where idcliente in (12,13,18,19);

update cliente set sexo = 'f'
where idcliente in (12,13,18,19);

/* relatorio de mulheres */

select c.idcliente, c.nome, c.sexo, c.email, c.cpf, 
	   e.rua, e.bairro, e.cidade, e.estado, 
	   t.tipo, t.numero
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'f';

update cliente set sexo = 'm'
where idcliente = 16;

/* quantidade de homens e mulheres */

select count(*) as quantidade, sexo
from cliente
group by sexo;

/* ids e email das mulheres que morem no centro do rio de janeiro e 
nao tenham celular */

select c.idcliente, c.email, c.nome, c.sexo
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente;

select c.idcliente, c.email, c.nome, c.sexo
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'f';

select c.idcliente, c.email, c.nome, c.sexo
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'f'
and bairro = 'centro' and cidade = 'rio de janeiro';

select c.idcliente, c.email, c.nome, c.sexo, t.tipo, e.bairro, e.cidade
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'f'
and bairro = 'centro' and cidade = 'rio de janeiro';

select c.idcliente, c.email, c.nome, c.sexo, t.tipo, e.bairro, e.cidade
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'f'
and bairro = 'centro' and cidade = 'rio de janeiro'
and tipo = 'res' or tipo = 'com';

select c.idcliente, c.email, c.nome, c.sexo, t.tipo, e.bairro, e.cidade
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'f'
and bairro = 'centro' and cidade = 'rio de janeiro'
and (tipo = 'res' or tipo = 'com');


