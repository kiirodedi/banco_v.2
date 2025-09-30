-- Base do BD
DROP DATABASE IF EXISTS bancoV2;
CREATE DATABASE IF NOT EXISTS bancoV2;
USE bancoV2;
----------
-- Criação de tabelas
CREATE TABLE IF NOT EXISTS cliente(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(255),
    senha VARCHAR(8),
    telefone BIGINT,
    endereco VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS conta(
    numero INT UNSIGNED PRIMARY KEY ,
    tipo_conta varchar(50),
    saldo FLOAT,
    fk_cliente_conta INT UNSIGNED
);

CREATE TABLE IF NOT EXISTS p_juridica(
    razao_social VARCHAR(255),
    fundacao DATE,
    nome_fantasia VARCHAR(255),
    cnpj BIGINT,
    fk_cliente_pj INT UNSIGNED
);

CREATE TABLE IF NOT EXISTS p_fisica(
    cpf BIGINT,
    nome VARCHAR(255),
    sexo ENUM('Feminino', 'Masculino', 'Outro'),
    data_nasc DATE,
    fk_cliente_pf INT UNSIGNED
);

CREATE TABLE IF NOT EXISTS transacoes(
    id INT UNSIGNED PRIMARY KEY,
    tipo ENUM('Saque', 'Depósito', 'Tranferência'),
    valor FLOAT,
    data DATETIME,
    descricao VARCHAR(255),
    fk_conta_num INT UNSIGNED
);
----------

-- Adição de chaves estrangeiras
ALTER TABLE conta
    ADD CONSTRAINT fk_cliente_conta
    Foreign Key (fk_cliente_conta) REFERENCES cliente(id);

ALTER TABLE p_juridica
    ADD CONSTRAINT fk_cliente_pj
    Foreign Key (fk_cliente_pj) REFERENCES cliente(id);

ALTER TABLE p_fisica
    ADD CONSTRAINT fk_cliente_pf
    Foreign Key (fk_cliente_pf) REFERENCES cliente(id);

ALTER TABLE transacoes
    ADD CONSTRAINT fk_conta_num
    Foreign Key (fk_conta_num) REFERENCES conta(numero);