/*Consultas Join*/

/* 1. Utilizando a base de dados filmes_db, queremos saber, por um lado, os títulos e nomes dos gêneros de todas as séries registradas.*/
SELECT series.titulo AS Titulo, generos.nome
FROM series
INNER JOIN generos ON series.genero_id = generos.id;

/*Segunda forma de resolver o mesmo problema:*/
SELECT  a.titulo AS Série, b.nome AS Gênero
FROM series  a 
INNER JOIN generos b
ON a.genero_id = b.id; 

/* 2. Por outro lado, precisamos listar os títulos dos episódios juntamente com os nomes e sobrenomes dos atores que atuam em cada um deles.*/

SELECT a.titulo, c.nome, c.sobrenome
FROM episodios a
INNER JOIN ator_episodio b
ON a.id = b.episodio_id
INNER JOIN atores c
ON b.ator_id = c.id
ORDER BY a.titulo;


/* 3. Para o nosso próximo desafio, precisamos obter todos os atores ou atrizes (nome e sobrenome) que trabalharam em qualquer filme de Harry Potter.*/

SELECT a.nome, a.sobrenome, C.TITULO
FROM atores a
INNER JOIN ator_filme b ON a.id = b.ator_id
INNER JOIN filmes c ON c.id = b.movie_id
WHERE c.titulo LIKE '%HARRY POTTER%';

/* 4. Faça uma consulta  que mostre a quantidade  de filmes por gênero.*/

SELECT COUNT(a.genero_id) AS QtdFilmes, b.nome AS Genero
FROM filmes a
INNER JOIN generos b
ON a.genero_id = b.id
GROUP BY b.nome;
