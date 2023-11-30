/* Criando banco de dados*/
CREATE DATABASE ControleEstoqueLojaDeRoupa;
USE ControleEstoqueLojaDeRoupa;

/* Criando usuário global */
CREATE USER 'admin'@'localhost' IDENTIFIED BY '84318857';
GRANT ALL PRIVILEGES ON ControleEstoqueLojaDeRoupa.* TO 'admin'@'localhost';

/* Criando usuário setor de compras */
CREATE USER 'comprador'@'localhost' IDENTIFIED BY '84318857comprador';
GRANT ALL PRIVILEGES ON ControleEstoqueLojaDeRoupa.* TO 'comprador'@'localhost';

/* criando usuário setor de vendas  */
CREATE USER 'vendedor'@'localhost' IDENTIFIED BY '84318857vendedor';
GRANT ALL PRIVILEGES ON ControleEstoqueLojaDeRoupa.* TO 'vendedor'@'localhost';

/* Criando tabela produtos */
CREATE TABLE PRODUTOS (
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255),
    descricao TEXT,
    preco_unitario DECIMAL(10,2)
);

/* Criando tabela entrada de estoque */
CREATE TABLE ENTRADAS_ESTOQUE (
	id_entrada INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    data_entrada DATE,
    FOREIGN KEY (id_produto) REFERENCES PRODUTOS(id_produto)
);

/* Criando tabela saída de estoque */
CREATE TABLE SAIDAS_ESTOQUE (
	id_saidas INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    data_saida DATE,
    FOREIGN KEY (id_produto) REFERENCES PRODUTOS(id_produto)
);

/* Entradas de produtos */
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Camiseta Branca', 'Camiseta branca de algodão, tamanho M', 25.00);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Calça Jeans', 'Calça jeans azul, tamanho 40', 75.00);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Tênis Esportivo', 'Tênis esportivo para corrida, tamanho 42', 150.00);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Relógio de Pulso', 'Relógio de pulso digital com alarme', 200.00);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Mochila', 'Mochila resistente para notebook', 120.00);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Fone de Ouvido', 'Fone de ouvido com cancelamento de ruído', 300.00);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Livro "O Pequeno Príncipe"', 'Livro "O Pequeno Príncipe" - edição de luxo', 45.00);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Garrafa Térmica', 'Garrafa térmica de 1L com tampa rosqueável', 35.00);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Cadeira de Escritório', 'Cadeira de escritório com encosto ajustável', 350.00);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Mouse sem Fio', 'Mouse sem fio com sensor óptico', 80.00);

/* Entradas de produtos no estoque, 21/11/2023 */
INSERT INTO ENTRADAS_ESTOQUE (id_produto, quantidade, data_entrada) VALUES ('1', 100, '2023-11-21');
INSERT INTO ENTRADAS_ESTOQUE (id_produto, quantidade, data_entrada) VALUES ('2', 200, '2023-11-21');
INSERT INTO ENTRADAS_ESTOQUE (id_produto, quantidade, data_entrada) VALUES ('3', 150, '2023-11-21');
INSERT INTO ENTRADAS_ESTOQUE (id_produto, quantidade, data_entrada) VALUES ('4', 80, '2023-11-21');
INSERT INTO ENTRADAS_ESTOQUE (id_produto, quantidade, data_entrada) VALUES ('5', 120, '2023-11-21');
INSERT INTO ENTRADAS_ESTOQUE (id_produto, quantidade, data_entrada) VALUES ('6', 300, '2023-11-21');
INSERT INTO ENTRADAS_ESTOQUE (id_produto, quantidade, data_entrada) VALUES ('7', 50, '2023-11-21');
INSERT INTO ENTRADAS_ESTOQUE (id_produto, quantidade, data_entrada) VALUES ('8', 100, '2023-11-21');
INSERT INTO ENTRADAS_ESTOQUE (id_produto, quantidade, data_entrada) VALUES ('9', 75, '2023-11-21');
INSERT INTO ENTRADAS_ESTOQUE (id_produto, quantidade, data_entrada) VALUES ('10', 90, '2023-11-21');

/* Saidas de produtos no estoque, 22/11/2023 */
INSERT INTO SAIDAS_ESTOQUE (id_produto, quantidade, data_saida) VALUES ('1', 10, '2023-11-22');
INSERT INTO SAIDAS_ESTOQUE (id_produto, quantidade, data_saida) VALUES ('2', 20, '2023-11-22');
INSERT INTO SAIDAS_ESTOQUE (id_produto, quantidade, data_saida) VALUES ('3', 15, '2023-11-22');
INSERT INTO SAIDAS_ESTOQUE (id_produto, quantidade, data_saida) VALUES ('4', 8, '2023-11-22');
INSERT INTO SAIDAS_ESTOQUE (id_produto, quantidade, data_saida) VALUES ('5', 12, '2023-11-22');
INSERT INTO SAIDAS_ESTOQUE (id_produto, quantidade, data_saida) VALUES ('6', 30, '2023-11-22');
INSERT INTO SAIDAS_ESTOQUE (id_produto, quantidade, data_saida) VALUES ('7', 5, '2023-11-22');
INSERT INTO SAIDAS_ESTOQUE (id_produto, quantidade, data_saida) VALUES ('8', 10, '2023-11-22');
INSERT INTO SAIDAS_ESTOQUE (id_produto, quantidade, data_saida) VALUES ('9', 7, '2023-11-22');
INSERT INTO SAIDAS_ESTOQUE (id_produto, quantidade, data_saida) VALUES ('10', 9, '2023-11-22');

/* Quantidade de produtos que entraram no estoque */
SELECT id_produto, SUM(quantidade) as total_entradas
FROM ControleEstoqueLojaDeRoupa.entradas_estoque
GROUP BY id_entrada; 

/* Quantidade de produtos que saíram do estoque */
SELECT id_produto, SUM(quantidade) as total_saidas
FROM ControleEstoqueLojaDeRoupa.saidas_estoque
GROUP BY id_saidas; 

/* Quantidade de produtos que entraram no estoque identificados pelo nome*/
SELECT P.id_produto, P.nome_produto, SUM(E.quantidade) as total_entradas
FROM ControleEstoqueLojaDeRoupa.Produtos P
JOIN ControleEstoqueLojaDeRoupa.Entradas_estoque E ON 
P.id_produto = E.id_produto
GROUP BY P.id_produto, P.nome_produto;

/* Quantidade de produtos que saíram do estoque identificados pelo nome*/
SELECT P.id_produto, P.nome_produto, SUM(S.quantidade) as total_saidas
FROM ControleEstoqueLojaDeRoupa.Produtos P
JOIN ControleEstoqueLojaDeRoupa.Saidas_estoque S ON 
P.id_produto = S.id_produto
GROUP BY P.id_produto, P.nome_produto;

/* Relatório do estoque, 21/11/2023 */
SELECT
	tbproduto.id_produto,
    tbproduto.nome_produto,
    tbentradas.total_entradas,
    tbsaidas.total_saidas,
    (tbentradas.total_entradas) - (tbsaidas.total_saidas) as saldo_atual
    
    /* Informações da tabela da esquerda */
    FROM ControleEstoqueLojaDeRoupa.produtos tbproduto
    INNER JOIN (SELECT id_produto, SUM(quantidade) as total_entradas
		FROM ControleEstoqueLojaDeRoupa.entradas_estoque
		GROUP BY id_produto) tbentradas
        ON tbproduto.id_produto = tbentradas.id_produto
	
    INNER JOIN (SELECT id_produto, SUM(quantidade) as total_saidas
		FROM ControleEstoqueLojaDeRoupa.saidas_estoque
		GROUP BY id_produto) tbsaidas
        ON tbproduto.id_produto = tbsaidas.id_produto; 

/* Entradas de mais produtos no estoques */      
UPDATE ControleEstoqueLojaDeRoupa.entradas_estoque
    SET quantidade = 75
    WHERE id_entrada IN (2, 3, 4, 6, 7, 9);
    
/* Atualização dos estoques após entrada de produtos */      
SELECT
	tbproduto.id_produto,
    tbproduto.nome_produto,
    tbentradas.total_entradas,
    tbsaidas.total_saidas,
    (tbentradas.total_entradas) - (tbsaidas.total_saidas) as saldo_atual
    
    /* Informações da tabela da esquerda */
    FROM ControleEstoqueLojaDeRoupa.produtos tbproduto
    INNER JOIN (SELECT id_produto, SUM(quantidade) as total_entradas
		FROM ControleEstoqueLojaDeRoupa.entradas_estoque
		GROUP BY id_produto) tbentradas
        ON tbproduto.id_produto = tbentradas.id_produto
        
	INNER JOIN (SELECT id_produto, SUM(quantidade) as total_saidas
		FROM ControleEstoqueLojaDeRoupa.saidas_estoque
		GROUP BY id_produto) tbsaidas
        ON tbproduto.id_produto = tbsaidas.id_produto;
