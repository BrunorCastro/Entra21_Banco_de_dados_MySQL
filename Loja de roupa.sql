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
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Camiseta Preta', 'Camiseta preta básica, algodão, tamanho M', 29.99);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Calça Social', 'Calça social preta, tecido leve, tamanho 38', 59.99);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Sapato Social', 'Sapato social de couro, preto, tamanho 42', 129.99);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Blusa de Moletom', 'Blusa de moletom com capuz, cor cinza, tamanho L', 49.99);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Vestido Floral', 'Vestido floral de verão, tecido leve, tamanho P', 79.99);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Óculos de Sol', 'Óculos de sol modernos, armação preta', 89.99);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Bolsa de Couro', 'Bolsa de couro marrom, design elegante', 99.99);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Jaqueta Jeans', 'Jaqueta jeans clássica, lavagem azul, tamanho M', 69.99);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Sapato Casual', 'Sapato casual de camurça, cor marrom, tamanho 40', 79.99);
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Saia Midi', 'Saia midi estampada, tecido fluido, tamanho M', 39.99);

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

/* Consultas para calcular entradas e saídas*/
SELECT id_produto, SUM(quantidade) AS total_entradas
FROM ControleEstoqueLojaDeRoupa.entradas_estoque
GROUP BY id_produto;

SELECT id_produto, SUM(quantidade) AS total_saidas
FROM ControleEstoqueLojaDeRoupa.saidas_estoque
GROUP BY id_produto;

/*Relatório do estoque*/
SELECT P.id_produto, P.nome_produto, E.total_entradas, S.total_saidas,
    (E.total_entradas - S.total_saidas) AS saldo_atual
FROM ControleEstoqueLojaDeRoupa.PRODUTOS P
LEFT JOIN (
    SELECT id_produto, SUM(quantidade) AS total_entradas
    FROM ENTRADAS_ESTOQUE
    GROUP BY id_produto) E 
    ON P.id_produto = E.id_produto
LEFT JOIN (
    SELECT id_produto, SUM(quantidade) AS total_saidas
    FROM SAIDAS_ESTOQUE
    GROUP BY id_produto) S 
    ON P.id_produto = S.id_produto;

/* Atualização de entradas no estoque*/
/* Update */
UPDATE ENTRADAS_ESTOQUE
SET quantidade = 75
WHERE id_entrada IN (2, 3, 4, 6, 7, 9);

/*Insert*/
INSERT INTO PRODUTOS (nome_produto, descricao, preco_unitario) VALUES ('Suéter de Tricô', 'Suéter de tricô quente, cor cinza, tamanho G', 79.99);

/* Delete */
DELETE FROM PRODUTOS WHERE id_produto = 11 ;

/* Operações de entrada */
SELECT * FROM ENTRADAS_ESTOQUE WHERE data_entrada BETWEEN '2023-11-21' AND '2023-11-22';

/*Consulta após a atualização*/
SELECT P.id_produto, P.nome_produto, E.total_entradas, S.total_saidas, 
(E.total_entradas - S.total_saidas) AS saldo_atual
FROM ControleEstoqueLojaDeRoupa.PRODUTOS P
LEFT JOIN (
    SELECT id_produto, SUM(quantidade) AS total_entradas
    FROM ENTRADAS_ESTOQUE
    GROUP BY id_produto) E 
    ON P.id_produto = E.id_produto

LEFT JOIN (
    SELECT id_produto, SUM(quantidade) AS total_saidas
    FROM SAIDAS_ESTOQUE
    GROUP BY id_produto) S 
    ON P.id_produto = S.id_produto;
    

	INNER JOIN (SELECT id_produto, SUM(quantidade) as total_saidas
		FROM ControleEstoqueLojaDeRoupa.saidas_estoque
		GROUP BY id_produto) tbsaidas
        ON tbproduto.id_produto = tbsaidas.id_produto;
