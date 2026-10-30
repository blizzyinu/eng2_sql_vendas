\c eng2_vendas

DROP TABLE IF EXISTS Venda;

DROP TABLE IF EXISTS Cliente;

CREATE TABLE Venda
(
    codigo int NOT NULL PRIMARY KEY,
    data_hora timestamp NOT NULL,
    valor_total numeric (9,2) NOT NULL,
    forma_pagto varchar(20) NOT NULL,
    cliente_id int NOT NULL
);

CREATE TABLE Cliente
(

    id int NOT NULL PRIMARY KEY,
    nome varchar(60) NOT NULL
    cpf varchar(14) NULL UNIQUE,
    data_nasc date,
    telefone1 varchar(12) NOT NULL,
    telefone2 VARCHAR(12) NULL

);

ALTER TABLE Venda ADD CONSTRAINT FK_Cliente_Venda
    FOREIGN KEY (cliente_id) REFERENCES Cliente(ID);