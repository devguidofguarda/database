
-- Criação do banco de dados para o projeto Biblioteca Avaliação 2 do Curso De Administrador De Banco De Dados
CREATE DATABASE IF NOT EXISTS Biblioteca;

-- Escolher o banco de dados para uso
USE Biblioteca;

-- Criação da tabela de autores
CREATE TABLE Autor (
  idAutor INT AUTO_INCREMENT PRIMARY KEY,  -- Chave primária e incremento automático para o ID do autor
  nome VARCHAR(255) NOT NULL  -- Nome do autor com até 255 caracteres, campo obrigatório
);

-- Criação da tabela de gêneros de livros
CREATE TABLE Genero_Livro (
  idGenero_Livro INT AUTO_INCREMENT PRIMARY KEY,  -- Chave primária e incremento automático para o ID do gênero
  nome VARCHAR(255) NOT NULL  -- Nome do gênero com até 255 caracteres, campo obrigatório
);

-- Criação da tabela de anos de publicação dos livros
CREATE TABLE Ano_Publicacao_Livro (
  idAno_Publicacao_Livro INT AUTO_INCREMENT PRIMARY KEY,  -- Chave primária e incremento automático para o ID do ano de publicação
  dia_publicacao INT NOT NULL,  -- Dia de publicação, campo obrigatório
  mes_publicacao VARCHAR(15) NOT NULL,  -- Mês de publicação (nome do mês), campo obrigatório
  ano_publicacao INT NOT NULL  -- Ano de publicação, campo obrigatório
);

-- Criação da tabela de livros
CREATE TABLE Livro (
  idLivro INT AUTO_INCREMENT PRIMARY KEY,  -- Chave primária e incremento automático para o ID do livro
  isbn INT NOT NULL,  -- ISBN (identificação do livro), campo obrigatório
  titulo VARCHAR(255) NOT NULL,  -- Título do livro, campo obrigatório
  descricao TEXT NOT NULL,  -- Descrição do livro, campo obrigatório
  Autor_idAutor INT NOT NULL,  -- Referência ao ID do autor, chave estrangeira
  Genero_Livro_idGenero_Livro INT NOT NULL,  -- Referência ao ID do gênero do livro, chave estrangeira
  Ano_Publicacao_Livro_idAno_Publicacao_Livro INT NOT NULL,  -- Referência ao ID do ano de publicação, chave estrangeira
  CONSTRAINT fk_Livro_Autor FOREIGN KEY (Autor_idAutor) REFERENCES Autor(idAutor),  -- Criação da relação (chave estrangeira) com a tabela de autores
  CONSTRAINT fk_Livro_Genero_Livro FOREIGN KEY (Genero_Livro_idGenero_Livro) REFERENCES Genero_Livro(idGenero_Livro),  -- Relação com a tabela de gêneros
  CONSTRAINT fk_Livro_Ano_Publicacao_Livro FOREIGN KEY (Ano_Publicacao_Livro_idAno_Publicacao_Livro) REFERENCES Ano_Publicacao_Livro(idAno_Publicacao_Livro)  -- Relação com a tabela de anos de publicação
);

-- Criação da tabela de endereços dos membros
CREATE TABLE Endereço_Membro (
  idEndereço_Membro INT AUTO_INCREMENT PRIMARY KEY,  -- Chave primária e incremento automático para o ID do endereço
  rua VARCHAR(255) NOT NULL,  -- Nome da rua, campo obrigatório
  numero INT NOT NULL,  -- Número do endereço, campo obrigatório
  bairro VARCHAR(255) NOT NULL,  -- Bairro, campo obrigatório
  complemento VARCHAR(255),  -- Complemento (opcional)
  cep INT NOT NULL,  -- Código postal (CEP), campo obrigatório
  estado VARCHAR(50) NOT NULL,  -- Estado, campo obrigatório
  pais VARCHAR(50) NOT NULL  -- País, campo obrigatório
);

-- Criação da tabela de telefones dos membros
CREATE TABLE Telefone_Membro (
  idTelefone_Membro INT AUTO_INCREMENT PRIMARY KEY,  -- Chave primária e incremento automático para o ID do telefone
  telefone VARCHAR(20) NOT NULL,  -- Número de telefone, campo obrigatório
  tipo VARCHAR(20) NOT NULL  -- Tipo de telefone (Celular, Fixo, etc.), campo obrigatório
);

-- Criação da tabela de datas de associação dos membros
CREATE TABLE Data_Associacao_Membro (
  idData_Associacao_Membro INT AUTO_INCREMENT PRIMARY KEY,  -- Chave primária e incremento automático para o ID da data de associação
  dia_associacao INT NOT NULL,  -- Dia da associação, campo obrigatório
  mes_associacao VARCHAR(15) NOT NULL,  -- Mês da associação, campo obrigatório
  ano_associacao INT NOT NULL  -- Ano da associação, campo obrigatório
);

-- Criação da tabela de membros
CREATE TABLE Membro (
  idMembro INT AUTO_INCREMENT PRIMARY KEY,  -- Chave primária e incremento automático para o ID do membro
  nome VARCHAR(255) NOT NULL,  -- Nome do membro, campo obrigatório
  Endereço_Membro_idEndereço_Membro INT NOT NULL,  -- Referência ao ID do endereço do membro, chave estrangeira
  Telefone_Membro_idTelefone_Membro INT NOT NULL,  -- Referência ao ID do telefone do membro, chave estrangeira
  Data_Associacao_Membro_idData_Associacao_Membro INT NOT NULL,  -- Referência ao ID da data de associação, chave estrangeira
  CONSTRAINT fk_Membro_Endereço_Membro FOREIGN KEY (Endereço_Membro_idEndereço_Membro) REFERENCES Endereço_Membro(idEndereço_Membro),  -- Relação com a tabela de endereços
  CONSTRAINT fk_Membro_Telefone_Membro FOREIGN KEY (Telefone_Membro_idTelefone_Membro) REFERENCES Telefone_Membro(idTelefone_Membro),  -- Relação com a tabela de telefones
  CONSTRAINT fk_Membro_Data_Associacao_Membro FOREIGN KEY (Data_Associacao_Membro_idData_Associacao_Membro) REFERENCES Data_Associacao_Membro(idData_Associacao_Membro)  -- Relação com a tabela de datas de associação
);

-- Criação da tabela de datas de empréstimo
CREATE TABLE Data_Emprestimo (
  idData_Emprestimo INT AUTO_INCREMENT PRIMARY KEY,  -- Chave primária e incremento automático para o ID da data de empréstimo
  dia_emprestimo INT NOT NULL,  -- Dia do empréstimo, campo obrigatório
  mes_emprestimo VARCHAR(15) NOT NULL,  -- Mês do empréstimo, campo obrigatório
  ano_emprestimo INT NOT NULL  -- Ano do empréstimo, campo obrigatório
);

-- Criação da tabela de datas de devolução
CREATE TABLE Data_Devolucao (
  idData_Devolucao INT AUTO_INCREMENT PRIMARY KEY,  -- Chave primária e incremento automático para o ID da data de devolução
  dia_devolucao INT NOT NULL,  -- Dia da devolução, campo obrigatório
  mes_devolucao VARCHAR(15) NOT NULL,  -- Mês da devolução, campo obrigatório
  ano_devolucao INT NOT NULL  -- Ano da devolução, campo obrigatório
);

-- Criação da tabela de empréstimos
CREATE TABLE Emprestimo (
  idEmprestimo INT AUTO_INCREMENT PRIMARY KEY,  -- Chave primária e incremento automático para o ID do empréstimo
  Livro_idLivro INT NOT NULL,  -- Referência ao ID do livro, chave estrangeira
  Membro_idMembro INT NOT NULL,  -- Referência ao ID do membro, chave estrangeira
  Data_Emprestimo_idData_Emprestimo INT NOT NULL,  -- Referência ao ID da data de empréstimo, chave estrangeira
  Data_Devolucao_idData_Devolucao INT NOT NULL,  -- Referência ao ID da data de devolução, chave estrangeira
  CONSTRAINT fk_Emprestimo_Livro FOREIGN KEY (Livro_idLivro) REFERENCES Livro(idLivro),  -- Relação com a tabela de livros
  CONSTRAINT fk_Emprestimo_Membro FOREIGN KEY (Membro_idMembro) REFERENCES Membro(idMembro),  -- Relação com a tabela de membros
  CONSTRAINT fk_Emprestimo_Data_Emprestimo FOREIGN KEY (Data_Emprestimo_idData_Emprestimo) REFERENCES Data_Emprestimo(idData_Emprestimo),  -- Relação com a tabela de datas de empréstimo
  CONSTRAINT fk_Emprestimo_Data_Devolucao FOREIGN KEY (Data_Devolucao_idData_Devolucao) REFERENCES Data_Devolucao(idData_Devolucao)  -- Relação com a tabela de datas de devolução
);

-- Inserção de autores
INSERT INTO Autor (nome) VALUES ('Autor 1'), ('Autor 2');

-- Inserção de gêneros de livros
INSERT INTO Genero_Livro (nome) VALUES ('Ficção'), ('Não-ficção');

-- Inserção de anos de publicação
INSERT INTO Ano_Publicacao_Livro (dia_publicacao, mes_publicacao, ano_publicacao) VALUES (15, 'Janeiro', 2021), (22, 'Dezembro', 2020);

-- Inserção de livros
INSERT INTO Livro (isbn, titulo, descricao, Autor_idAutor, Genero_Livro_idGenero_Livro, Ano_Publicacao_Livro_idAno_Publicacao_Livro) VALUES 
(123456, 'Livro 1', 'Descrição do Livro 1', 1, 1, 1), 
(789012, 'Livro 2', 'Descrição do Livro 2', 2, 2, 2);

-- Inserção de endereços de membros
INSERT INTO Endereço_Membro (rua, numero, bairro, complemento, cep, estado, pais) VALUES 
('Rua A', 123, 'Bairro 1', 'Apto 101', 12345678, 'Estado 1', 'País 1'),
('Rua B', 456, 'Bairro 2', NULL, 87654321, 'Estado 2', 'País 2');

-- Inserção de telefones de membros
INSERT INTO Telefone_Membro (telefone, tipo) VALUES ('99999-9999', 'Celular'), ('88888-8888', 'Fixo');

-- Inserção de datas de associação de membros
INSERT INTO Data_Associacao_Membro (dia_associacao, mes_associacao, ano_associacao) VALUES (1, 'Janeiro', 2020), (5, 'Fevereiro', 2019);

-- Inserção de membros
INSERT INTO Membro (nome, Endereço_Membro_idEndereço_Membro, Telefone_Membro_idTelefone_Membro, Data_Associacao_Membro_idData_Associacao_Membro) VALUES 
('Membro 1', 1, 1, 1), 
('Membro 2', 2, 2, 2);

-- Inserção de datas de empréstimo
INSERT INTO Data_Emprestimo (dia_emprestimo, mes_emprestimo, ano_emprestimo) VALUES (15, 'Março', 2021), (10, 'Abril', 2021);

-- Inserção de datas de devolução
INSERT INTO Data_Devolucao (dia_devolucao, mes_devolucao, ano_devolucao) VALUES (30, 'Março', 2021), (25, 'Abril', 2021);

-- Inserção de empréstimos
INSERT INTO Emprestimo (Livro_idLivro, Membro_idMembro, Data_Emprestimo_idData_Emprestimo, Data_Devolucao_idData_Devolucao) VALUES 
(1, 1, 1, 1), 
(2, 2, 2, 2);

-- Consultar todos os livros e seus respectivos autores, gêneros e anos de publicação
SELECT 
  Livro.titulo AS 'Título do Livro',  -- Seleciona o título do livro
  Autor.nome AS 'Autor',  -- Seleciona o nome do autor
  Genero_Livro.nome AS 'Gênero',  -- Seleciona o nome do gênero do livro
  CONCAT(Ano_Publicacao_Livro.dia_publicacao, ' ', Ano_Publicacao_Livro.mes_publicacao, ' ', Ano_Publicacao_Livro.ano_publicacao) AS 'Data de Publicação'  -- Formata e seleciona a data completa de publicação
FROM Livro
JOIN Autor ON Livro.Autor_idAutor = Autor.idAutor  -- Relaciona a tabela de livros com a tabela de autores
JOIN Genero_Livro ON Livro.Genero_Livro_idGenero_Livro = Genero_Livro.idGenero_Livro  -- Relaciona a tabela de livros com a tabela de gêneros
JOIN Ano_Publicacao_Livro ON Livro.Ano_Publicacao_Livro_idAno_Publicacao_Livro = Ano_Publicacao_Livro.idAno_Publicacao_Livro;  -- Relaciona a tabela de livros com a tabela de anos de publicação

-- Consultar todos os membros e seus respectivos endereços, telefones e datas de associação
SELECT 
  Membro.nome AS 'Nome do Membro',  -- Seleciona o nome do membro
  CONCAT(Endereço_Membro.rua, ', ', Endereço_Membro.numero, ' - ', Endereço_Membro.bairro, ', ', Endereço_Membro.estado, ', ', Endereço_Membro.pais) AS 'Endereço Completo',  -- Formata e seleciona o endereço completo do membro
  Telefone_Membro.telefone AS 'Telefone',  -- Seleciona o número de telefone do membro
  CONCAT(Data_Associacao_Membro.dia_associacao, ' ', Data_Associacao_Membro.mes_associacao, ' ', Data_Associacao_Membro.ano_associacao) AS 'Data de Associação'  -- Formata e seleciona a data completa de associação
FROM Membro
JOIN Endereço_Membro ON Membro.Endereço_Membro_idEndereço_Membro = Endereço_Membro.idEndereço_Membro  -- Relaciona a tabela de membros com a tabela de endereços
JOIN Telefone_Membro ON Membro.Telefone_Membro_idTelefone_Membro = Telefone_Membro.idTelefone_Membro  -- Relaciona a tabela de membros com a tabela de telefones
JOIN Data_Associacao_Membro ON Membro.Data_Associacao_Membro_idData_Associacao_Membro = Data_Associacao_Membro.idData_Associacao_Membro;  -- Relaciona a tabela de membros com a tabela de datas de associação

-- Consultar todos os empréstimos e seus respectivos livros, membros, datas de empréstimo e datas de devolução
SELECT 
  Emprestimo.idEmprestimo AS 'ID do Empréstimo',  -- Seleciona o ID do empréstimo
  Livro.titulo AS 'Título do Livro',  -- Seleciona o título do livro
  Membro.nome AS 'Nome do Membro',  -- Seleciona o nome do membro que fez o empréstimo
  CONCAT(Data_Emprestimo.dia_emprestimo, ' ', Data_Emprestimo.mes_emprestimo, ' ', Data_Emprestimo.ano_emprestimo) AS 'Data de Empréstimo',  -- Formata e seleciona a data completa do empréstimo
  CONCAT(Data_Devolucao.dia_devolucao, ' ', Data_Devolucao.mes_devolucao, ' ', Data_Devolucao.ano_devolucao) AS 'Data de Devolução'  -- Formata e seleciona a data completa da devolução
FROM Emprestimo
JOIN Livro ON Emprestimo.Livro_idLivro = Livro.idLivro  -- Relaciona a tabela de empréstimos com a tabela de livros
JOIN Membro ON Emprestimo.Membro_idMembro = Membro.idMembro  -- Relaciona a tabela de empréstimos com a tabela de membros
JOIN Data_Emprestimo ON Emprestimo.Data_Emprestimo_idData_Emprestimo = Data_Emprestimo.idData_Emprestimo  -- Relaciona a tabela de empréstimos com a tabela de datas de empréstimo
JOIN Data_Devolucao ON Emprestimo.Data_Devolucao_idData_Devolucao = Data_Devolucao.idData_Devolucao;  -- Relaciona a tabela de empréstimos com a tabela de datas de devolução
