use base_animais;
CREATE TABLE tbl_animais ( -- criando a tabela animais
  Id	INTEGER PRIMARY KEY AUTO_iNCREMENT,
  Nome	VARCHAR(50),
  Nasc	DATE,
  Peso	DECIMAL (9,2),
  Cor	VARCHAR(50),
  Id_Especie INTEGER,
  FOREIGN KEY (Id_Especie) REFERENCEs tbl_especies (Id)
);
INSERT INTO tbl_animais (Nome, Nasc, Peso, Cor, Id_Especie) VALUES -- inserindo os valores das colunas da tabela animais
('Ágata', 			'2015-04-09', 	13.9, 	'Branco',	'1'), 
('Félix', 			'2016-06-06', 	14.3, 	'Preto',	'2'), 
('Tom', 			'2013-02-08', 	11.2, 	'Azul',		'3'), 
('Garfield', 		'2015-07-06', 	17.1, 	'Laranja',	'1'),
('Frajola', 		'2013-08-01', 	13.7, 	'Preto',	'3'),
('Manda-Chuva',		'2012-02-03', 	12.3, 	'Amarelo',	'2'),
('Snowball', 		'2014-04-06', 	13.2, 	'Preto',	'1'),
('Azulão', 			'2015-08-03', 	11.9, 	'Azul',		'2'),
('Gato de Botas', 	'2012-12-10', 	11.6, 	'Amarelo',	'3'),
('Kitty', 			'2020-04-06', 	11.6, 	'Amarelo',	'3'),
('Milu', 			'2013-02-04', 	17.9, 	'Branco',	'1'),
('Pluto', 			'2012-01-03', 	12.3, 	'Amarelo',	'2'),
('Pateta', 			'2015-05-01', 	17.7, 	'Preto',	'1'),
('Snoopy', 			'2013-07-02', 	18.2, 	'Branco',	'3'),
('Rex', 			'2019-11-03', 	19.7, 	'Beje',		'2'),
('Bidu', 			'2012-09-08', 	12.4, 	'Azul',		'2'),
('Dum Dum', 		'2015-04-06', 	11.2, 	'Laranja',	'1'),
('Muttley', 		'2011-02-03', 	14.3, 	'Laranja',	'3'),
('Scooby', 			'2012-01-02', 	19.9, 	'Marrom',	'1'),
('Rufus', 			'2014-04-05', 	19.7, 	'Branco',	'2'),
('Rex', 			'2021-08-19', 	19.7, 	'Branco',	'1');

SELECT * FROM tbl_animais; -- seleciona a tabela animais
DROP TABLE tbl_animais; -- da drop ( derruba) a tabela

CREATE TABLE tbl_especies ( -- criando a tabela especies
  Id		INTEGER PRIMARY KEY AUTO_INCREMENT,
  Nome		VARCHAR(50),
  Descricao	TEXT
);
INSERT INTO tbl_especies (Nome, Descricao) VALUES -- inserondo os valores das colunas da tabela especie
("Cachorro",	"[Texto descritivo para cachorro]"),
("Gato", 		"[Texto descritivo para gato]"),
("Coelho", 		"[Texto descritivo para coelho]");

SELECT * FROM tbl_especies; -- comando para selecionar a tabela especies
DROP TABLE tbl_especies; -- comando para dar drop na tabela
SELECT * FROM tbl_animais LEFT JOIN tbl_especies on tbl_animais.Id_Especie = tbl_especie.Id; -- comando join

-- Realizando a proposta do etapa 2 do exercicio

UPDATE tbl_animais SET Nome = "Goofy" WHERE Nome = "Pateta";	-- ALTERA	O NOME DE PATETA PARA GOOFY

UPDATE tbl_animais SET Peso = 10 WHERE Nome = "Garfield";	-- ALTERA O PESO DE GARFIELD PARA 10

UPDATE tbl_animais SET Cor = "Laranja" WHERE Id_Especie = "2";	-- ALTERA A COR DE TODOS OS GATOS PARA LARANJA

ALTER TABLE tbl_animais ADD COLUMN Altura DECIMAL; -- ADICIONA UMA COLUNA CHAMADA  OBSERVAÇÃO

ALTER TABLE tbl_animais ADD COLUMN Observacao LONGTEXT; -- ADICIONA	UMA	COLUNA CHAMADA OBSERVAÇÃO

DELETE FROM tbl_animais WHERE Peso > 200;-- REMOVE TODOS OS ANIMAIS COM PESO ACIMA DE 200

DELETE FROM tbl_animais WHERE Nome LIKE 'C%'; -- REMOVE	TODOS OS ANIMAIS CUJO A INICIAL COMECE COM C

ALTER TABLE tbl_animais DROP COLUMN Cor; --  REMOVE A COLUNA COR

ALTER TABLE tbl_animais MODIFY Nome VARCHAR(80); -- ALTERA A QUANTIDADE MAXIMA DE CARACTERES DO NOME PARA 80

DELETE FROM tbl_animais WHERE Id_Especie = "2" OR Id_Especie = "1"; -- REMOVE TODOS OS GATOS E CACHORROS

DROP TABLE tbl_especies; -- REMOVE A TABELA ESPÉCIES

 -- ABAIXO ESTÁ  O SCRIPT SQL REALIZADO NA ETAPA ANTERIOR A ESSA
 
SELECT * FROM tbl_animais; 

SELECT * FROM tbl_animais WHERE Peso < 13.1;

SELECT * FROM tbl_animais WHERE Nasc BETWEEN '2015-02-00' AND '2015-12-31';

SELECT * FROM tbl_animais WHERE Cor = 'Branco' AND Peso < 15.0;

SELECT Nome, Cor, Peso FROM tbl_animais WHERE Nome LIKE 'B%';

SELECT Nome, Cor, Peso FROM tbl_animais WHERE Cor IN ('Vermelho', 'Amarelo', 'Marrom', 'Laranja');

SELECT Nome, Cor, Nasc, Peso FROM tbl_animais ORDER BY Nasc;

SELECT * FROM tbl_animais WHERE Nome LIKE 'C%' AND not Cor = 'Branco';

SELECT * FROM tbl_animais WHERE Nome LIKE '%ba%';

SELECT * FROM tbl_animais WHERE Peso BETWEEN 13 AND 15;

SELECT * FROM tbl_animais WHERE Peso <= 30 AND Cor in ('Amarelo', 'Roxo') AND Nasc > '2012-00-00';

SELECT * FROM tbl_animais WHERE 
CAST(MONTH(Nasc) AS unsigned)= 12	and	cast(month(nasc)as	unsigned)>= 22	or
CAST(MONTH(Nasc) AS unsigned)= 1	and	cast(month(nasc)as	unsigned)<=19;

SELECT * FROM tbl_animais WHERE Nome LIKE '% %';

/* ENUNCIADO DA ETAPA 1 DO EXERCICIO
- Selecione todos os animais
- Selecione todos os animais que pesam menos que 13.1
- Selecione todos nasceram entre fevereiro e dezembro de 2015
- Selecione todos os animais brancos que pesam menos que 15.0
- Selecione nome, cor e peso de todos cujo nome comece com ’B’
- Selecione nome, cor e peso de todos com cor vermelha, amarela, marrom e laranja
- Selecione nome, cor, data de nascimento e peso de todos ordenados pelos mais jovens
- Selecione todos os animais cujo nome comece com 'C' e não sejam brancos
- Selecione todos os animais cujo nome contenha 'ba'
- Selecione todos os animais com peso entre 13.0 à 15.0
- Selecione todos os animais que o peso não seja maior que 30, com cor amarelo ou roxo e nascidos depois de 2012
- (Desafio) Selecione todos os capricornianos
- (Desafio) Selecione todos os animais com nome formado por mais de uma palavra.
*/

/* ENUNCIADO DA ETAPA 2 DO EXERCICIO
- Altere o nome do Pateta para Goofy;
- Altere o peso do Garfield para 10 quilogramas;
- Altere a cor de todos os gatos para laranja;
- Crie um campo altura para os animais;
- Crie um campo observação para os animais;
- Remova todos os animais que pesam mais que 200 quilogramas.
- Remova todos os animais que o nome inicie com a letra ‘C’.
- Remova o campo cor dos animais;
- Aumente o tamanho do campo nome dos animais para 80 caracteres;
- Remova todos os gatos e cachorros.
- Remova o campo data de nascimento dos animais.
- Remova todos os animais.
- Remova a tabela especies.
*/