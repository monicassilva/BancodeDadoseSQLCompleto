/* para uma campanha de marketing, o setor solicitou um
relatório com o nome, email e telefone celular 
dos clientes que moram no estado do rio de janeiro 
você terá que passar a query para gerar o relatorio para
o programador */

select   c.nome, c.email, t.numero as celular /* projecao */
from cliente c /* origem */
inner join endereco e /*juncao */
on c.idcliente = e.id_cliente /*juncao condicao */
inner join telefone t /*juncao */
on c.idcliente = t.id_cliente /*juncao condicao*/
where tipo = 'cel' and estado = 'rj'; /*selecao*/


/* para uma campanha de produtos de beleza, o comercial solicitou um
relatório com o nome, email e telefone celular 
 das mulheres que moram no estado de são paulo 
você terá que passar a query para gerar o relatorio para
o programador */


select c.nome, c.email, t.numero as celular
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'f'
and estado = 'sp';

/* nome, email, numero, estado */

select c.nome, c.email, e.estado, t.numero
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente;