/* exercicio */

/* Considerando o que vc aprendeu sobre performance, resolva os exercicios abaixo */

use exercicio;

-- Traga os funcionarios que trabalhem no departamento de filmes OU no departamento de roupas

-- OBS: OR e a segunda condicao é opcional colocamos na primeira condicao quem tem mais chances de uma saida verdadeira, pois a segunda condicao nao será checada nesse caso.
-- 1 tras todas os funcionarios com fitro 
select * 
from funcionarios
where departamento = 'Roupas' or departamento = 'Filmes';

-- verificar qual o departamento tem a maio quantidade de registros
select count(*), departamento
from funcionarios
group by departamento;

-- traz a quantidade por departamento no filtro que tem a menor quantidade e será mais perfomatico
select count(*), departamento
from funcionarios
where departamento = 'filmes' or departamento = 'roupas'
group by departamento
order by 1;

-- O gestor de marketing pediu a lista das funcionarias (AS) = FEMININO que trabalhem no departamento 
-- de filmes ou no departamento lar. Ele necessita enviar um email para as colaboradoras
-- desses dois setores. OR +  AND 
select count(*), sexo
from funcionarios
group by sexo;

select count(*), departamento
from funcionarios
group by departamento;

select nome,
       email,
       sexo
from funcionarios
where
( departamento = 'lar' and sexo = 'feminino' )
or
( departamento = 'filmes' and sexo = 'feminino' );

-- Traga os funcionarios do sexo masculino ou os funcionarios que trabalhem no setor Jardim
-- poderiamos usar o select * from porem em bancos grandes é menos perfomátivo
select nome,
	   sexo,
       departamento
from funcionarios
where sexo = 'Masculino' or departamento = 'Jardim' 



