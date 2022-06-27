-- 1. consulta que lista o nome, 
-- email e telefone de todos os usuarios
select nome, email, telefone from usuarios;

-- 2. consulta que liste o nome de todas as 
-- sessões cadastradas
select nome from sessoes;

-- 3. consulta que liste o titulo, autor e
-- data de publicacao de todos os livros
-- DESAFIO: exibir a data no formato DD/MM/YYYY
-- Pesquisar sobre o uso da funcao to_char()
select 
    titulo, 
    nome_autor, 
    TO_CHAR(publicacao, 'DD/MM/YYYY') as publicacao 
    from livros;

-- 4. consulta que lista todos os emprestimos
-- filtrando por apenas um usuario
-- utilizar WHERE
select * from emprestimos where id_usuario = 7;

-- 5. consulta que liste todos os emprestimo_livros
-- filtrando por apenas um emprestimo
-- utilizar WHERE
select * from emprestimo_livros where id_emprestimo = 2;

-- # Listar o nome, email e telefone do usuarios que pegaram emprestado algum livro do setor id 2 (caso não tenha setor id 2 no banco de dados de vocês, substituir por um id existente);
select 
    u.nome,
    u.email,
    u.telefone
from emprestimos as e
inner join emprestimo_livros as el on (e.id = el.id_emprestimo)
inner join livros as l on (el.id_livro = l.id)
inner join usuarios as u on (e.id_usuario = u.id)
where id_sessao = 2

-- # Listar título, nome da sessão e nome do autor dos livros que o usuário id 5 pegou emprestado (mesma lógica da anterior, caso não tenha usuario com id 5, substituir por um id de usuario existente)
select 
    l.titulo,
    s.nome as nome_sessao,
    l.nome_autor
from emprestimos as e
inner join emprestimo_livros as el on (e.id = el.id_emprestimo)
inner join livros as l on (el.id_livro = l.id)
inner join sessoes as s on (l.id_sessao = s.id)
where id_usuario = 3

-- # Listar o título e data de publicação dos livros emprestados para usuarios com DDD (55)

select
    l.titulo,
    l.publicacao
from emprestimos as e
inner join emprestimo_livros as el on (e.id = el.id_emprestimo)
inner join livros as l on (el.id_livro = l.id)
inner join usuarios as u on (e.id_usuario = u.id)
where u.telefone like '(61)%'

