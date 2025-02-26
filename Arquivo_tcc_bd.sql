-- SQL Server - Inserção dos produtos do site do TCC ( João Vitor ) - CONCLUÌDO
CREATE DATABASE sistema_tcc;
USE sistema_tcc;

-- Tabela de Produtos
CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL
);
select * from produtos;

-- Tabela de Preços dos Produtos
CREATE TABLE produto_preco (
    id_preco INT PRIMARY KEY,
    id_produto INT,
    preco DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);
select * from produto_preco;

-- Tabela dos Mercados
CREATE TABLE mercados (
	id_mercado INT PRIMARY KEY,
	nome_mercado VARCHAR(100) NOT NULL
);
select * from mercados;

-- Tabela dos Produto dos Mercados
CREATE TABLE produto_mercados (
	id_produto INT,
	id_mercado INT,
	estoque INT DEFAULT 0,
	FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
	FOREIGN KEY (id_mercado) REFERENCES Mercados(id_mercado),
	PRIMARY KEY (id_produto, id_mercado)
);
select * from produto_mercados;

-- Tabela de Avaliação
CREATE TABLE avaliacao (
	id_avaliacao INT PRIMARY KEY,
	id_produto INT,
	id_mercado INT,
	avaliacao INT CHECK (avaliacao BETWEEN 1 and 5),
	-- Avaliação de 1 a 5
	FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
	FOREIGN KEY (id_mercado) REFERENCES Mercados(id_mercado)
);
select * from avaliacao;

-- Inserindo os Produtos
INSERT INTO Produtos (id_produto, nome_produto, marca) VALUES 
(1, 'Arroz', 'Camil'),
(2, 'Arroz', 'Tio João'),
(3, 'Feijão', 'Camil'),
(4, 'Feijão', 'Kicaldo'),
(5, 'Açúcar', 'União'),
(6, 'Açúcar', 'Caravelas'),
(7, 'Sal', 'Cisne'),
(8, 'Sal', 'Lebre'),
(9, 'Café', 'Pilão'),
(10, 'Café', 'União'),
(11, 'Macarrão', 'Galo'),
(12, 'Macarrão', 'Adria'),
(13, 'Farinha de trigo', 'Dona Benta'),
(14, 'Farinha de trigo', 'Qualitá'),
(15, 'Farinha temperada', 'Yoki'),
(16, 'Farinha temperada', 'Kodilar'),
(17, 'Achocolatado em pó', 'Italac'),
(18, 'Achocolatado em pó', 'Toddy'),
(19, 'Óleo', 'Soya'),
(20, 'Óleo', 'Liza'),
(21, 'Creme de leite', 'Italac'),
(22, 'Creme de leite', 'Nestlé'),
(23, 'Molho de tomate', 'Quero'),
(24, 'Molho de tomate', 'Fugini'),
(25, 'Bolacha (Cream Cracker)', 'Adria'),
(26, 'Bolacha (Cream Cracker)', 'Bauduco'),
(27, 'Leite condensado', 'Piracanjuba'),
(28, 'Leite condensado', 'Italac'),
(29, 'Sabonete', 'Dove'),
(30, 'Sabonete', 'Lux'),
(31, 'Pasta de dente', 'Colgate'),
(32, 'Pasta de dente', 'Sorriso'),
(33, 'Papel higiênico', 'Sublime'),
(34, 'Papel higiênico', 'Personal'),
(35, 'Leite', 'Italac'),
(36, 'Leite', 'Piracanjuba'),
(37, 'Refresco em pó', 'Tang'),
(38, 'Refresco em pó', 'Mid'),
(39, 'Detergente', 'Limpol'),
(40, 'Detergente', 'Ypê'),
(41, 'Sabão em pó', 'Ypê'),
(42, 'Sabão em pó', 'Omo'),
(43, 'Esponja de aço', 'Bombril'),
(44, 'Esponja de aço', 'Assolan');

-- Inserindo Preços Genéricos para os Produtos
INSERT INTO produto_preco (id_preco, id_produto, preco) VALUES
(1, 1, 20.50),  -- Arroz Camil
(2, 2, 21.00),  -- Arroz Tio João
(3, 3, 7.90),   -- Feijão Camil
(4, 4, 6.80),   -- Feijão Kicaldo
(5, 5, 3.50),   -- Açúcar União
(6, 6, 3.20),   -- Açúcar Caravelas
(7, 7, 1.50),   -- Sal Cisne
(8, 8, 1.40),   -- Sal Lebre
(9, 9, 12.00),  -- Café Pilão
(10, 10, 10.90), -- Café União
(11, 11, 4.80), -- Macarrão Galo
(12, 12, 4.60), -- Macarrão Adria
(13, 13, 2.90), -- Farinha de trigo Dona Benta
(14, 14, 3.10), -- Farinha de trigo Qualitá
(15, 15, 3.50), -- Farinha temperada Yoki
(16, 16, 3.40), -- Farinha temperada Kodilar
(17, 17, 5.90), -- Achocolatado Italac
(18, 18, 6.20), -- Achocolatado Toddy
(19, 19, 8.90), -- Óleo Soya
(20, 20, 9.10), -- Óleo Liza
(21, 21, 4.50), -- Creme de leite Italac
(22, 22, 4.80), -- Creme de leite Nestlé
(23, 23, 2.80), -- Molho de tomate Quero
(24, 24, 2.70), -- Molho de tomate Fugini
(25, 25, 3.90), -- Bolacha Adria
(26, 26, 4.10), -- Bolacha Bauduco
(27, 27, 6.20), -- Leite condensado Piracanjuba
(28, 28, 6.00), -- Leite condensado Italac
(29, 29, 2.50), -- Sabonete Dove
(30, 30, 2.40), -- Sabonete Lux
(31, 31, 3.90), -- Pasta de dente Colgate
(32, 32, 3.70), -- Pasta de dente Sorriso
(33, 33, 10.50), -- Papel higiênico Sublime
(34, 34, 10.80), -- Papel higiênico Personal
(35, 35, 4.50), -- Leite Italac
(36, 36, 4.60), -- Leite Piracanjuba
(37, 37, 1.20), -- Refresco em pó Tang
(38, 38, 1.10), -- Refresco em pó Mid
(39, 39, 2.50), -- Detergente Limpol
(40, 40, 2.30), -- Detergente Ypê
(41, 41, 8.90), -- Sabão em pó Ypê
(42, 42, 9.50), -- Sabão em pó Omo
(43, 43, 3.00), -- Esponja de aço Bombril
(44, 44, 2.90); -- Esponja de aço Assolan

--Inserindo Mercados
INSERT INTO Mercados (id_mercado, nome_mercado) VALUES
(1, 'Mercado Noemia'),
(2, 'Mercado Tietê'),
(3, 'Mercado Economix'),
(4, 'Mercado Atacadinho');

-- Associando Produtos a Todos os Mercados
INSERT INTO produto_mercados (id_produto, id_mercado, estoque) 
SELECT id_produto, id_mercado, FLOOR(RAND() * 100) + 1  -- Estoque aleatório de 1 a 100
FROM Produtos, Mercados;

-- Inserindo Avaliações (genéricas)
INSERT INTO avaliacao(id_avaliacao, id_produto, id_mercado, avaliacao) VALUES
(1, 1, 1, 5), (2, 2, 1, 4), (3, 3, 2, 5), (4, 4, 3, 3), (5, 5, 4, 4),
(6, 6, 1, 5), (7, 7, 2, 4), (8, 8, 3, 3), (9, 9, 4, 5), (10, 10, 1, 4),
(11, 11, 2, 5), (12, 12, 3, 4), (13, 13, 4, 3), (14, 14, 1, 4), (15, 15, 2, 5);

-- ccomando para a consulta das avaliações
SELECT avaliacao.id_avaliacao, Produtos.nome_produto, Mercados.nome_mercado, avaliacao.avaliacao
FROM avaliacao
JOIN Produtos ON avaliacao.id_produto = Produtos.id_produto
JOIN Mercados ON avaliacao.id_mercado = Mercados.id_mercado;


-- continuar depois de acessar o site do tcc 