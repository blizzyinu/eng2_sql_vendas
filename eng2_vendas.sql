\c eng2_vendas

DROP TABLE IF EXISTS Venda;

DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente
(

    id int NOT NULL PRIMARY KEY,
    nome varchar(60) NOT NULL
    cpf varchar(14) NULL UNIQUE,
    data_nasc date,
    telefone1 varchar(16) NOT NULL,
    telefone2 VARCHAR(16) NULL

);

CREATE TABLE endereço_entrega
(
    id int NOT NULL PRIMARY KEY,

)

CREATE TABLE Venda
(
    codigo int NOT NULL PRIMARY KEY,
    data_hora timestamp NOT NULL,
    valor_total numeric (9,2) NOT NULL,
    forma_pagto varchar(20) NOT NULL,
    cliente_id int NOT NULL
        REFERENCES Cliente(id)
);

INSERT INTO Cliente (id, nome, telefone1, cpf)
    VALUES (10, 'Pedro Henrique', '67 99988-0000', '000.000.000');

INSERT INTO Cliente (id, nome, telefone1, cpf)
    VALUES (15, 'Pedro Henrique', '18 9988-0000', NULL);

INSERT INTO Cliente (id, nome, telefone1, cpf)
    VALUES (1, 'André SIlva', '81 9988-0000', NULL);

INSERT INTO Cliente (id, data_nasc, nome, telefone1)
    VALUES (420, '1967/10/12', 'André Silva', '81 9988-0000');

SELECT *
FROM Cliente;

SELECT NOME, CPF from CLIENTE;

SELECT CPF, NOME FROM CLIENTE;

SELECT * FROM CLIENTE ORDER BY ID;
SELECT * FROM CLIENTE ORDER BY nome;
SELECT * FROM CLIENTE ORDER BY data_nasc ASC;

SELECT id, data_nasc, nome;
FROM Cliente
WHERE id > 10
ORDER BY nome DESC;

SELECT *
FROM Cliente
WHERE id < 10
ORDER BY nome DESC;

SELECT *
FROM Cliente
WHERE id = 10
ORDER BY nome DESC;

SELECT ID, data_nasc, nome
FROM Cliente
WHERE nome = 'André Silva'
ORDER BY nome DESC;

SELECT *
FROM Cliente
ORDER BY nome, id DESC;

SELECT nome
FROM Cliente
ORDER BY ID;

SELECT id, data_nasc,
-- NOW(),
    AGE(data_nasc),
    AGE('2020/10/1', data_nasc),
    nome
FROM Cliente
ORDER BY ID;

INSERT INTO Venda (codigo, data_hora, valor_total, forma_pagto, cliente_id)
    VALUES (1, '2020/10/15', 1000, 'PIX', 7);

INSERT INTO Venda (codigo, data_hora, valor_total, forma_pagto, cliente_id)
    VALUES (1, '2026/1/20', 350, 'pix', 10);

INSERT INTO VEnda (codigo, data_hora, valor_total, forma_pagto, cliente_id)
    VALUES (1, '2026/1/20', 350, 'pix', 10);

    SELECT Venda.data_hora, Cliente.nome, Venda.forma_pagto, Venda.valor_total
    FROM Venda JOIN Cliente
        ON (Venda.Cliente_ID = Cliente.ID)

CREATE TABLE Produto
(
    ID int NOT NULL PRIMARY KEY,
    NOme varchar(50) NOT NULL,
    preco Numeric(9,2) NOT NULL,
    estoque int NOT NULL -- Quantidade
);

CREATE TABLE Produto_Venda
(
    ID
    produto_ID int NOT NULL REFERENCES Produto (ID),
    venda_ID int NOT NULL REFERENCES Venda(Codigo),
    quantidade int NOT NULL,
    
)