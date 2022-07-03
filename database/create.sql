CREATE TABLE FABRICA( -- OK
	ID INTEGER NOT NULL PRIMARY KEY,
	CNPJ CHAR(14) NOT NULL,
	RUA TEXT,
	NUM INTEGER,
	CIDADE TEXT,
	UF VARCHAR(2),
	CEP CHAR(8)
);

CREATE TABLE SETOR_DE_PRODUCAO( -- OK
	ID_SETOR INTEGER NOT NULL PRIMARY KEY,
	LOCALIDADE TEXT,
	RELATORIO TEXT,
	DATA_HORA TIMESTAMP,
	QTD_MAQUINAS INTEGER,
	QTD_FUNCIONARIOS INTEGER
);

CREATE TABLE FUNCIONARIO(
	ID_MAT INTEGER NOT NULL PRIMARY KEY,
	ID_SETOR INTEGER REFERENCES SETOR_DE_PRODUCAO(ID_SETOR),
	NOME TEXT,
	IDADE INTEGER,
	TREINAMENTO TEXT,
	CARGA_H INTEGER,
	CARGA_H_EXIGIDA INTEGER
);

CREATE TABLE MAQUINA(
	ID_TAG INTEGER NOT NULL PRIMARY KEY,
	ID_SETOR INTEGER REFERENCES SETOR_DE_PRODUCAO(ID_SETOR),
	NOME_MAQUINA TEXT
);

CREATE TABLE PRODUTO(
	ID_PROD INTEGER NOT NULL PRIMARY KEY,
	ID_TAG INTEGER NOT NULL REFERENCES MAQUINA(ID_TAG),
	PRECO FLOAT(2),
	COR TEXT
);

CREATE TABLE DENTRO_QUALIDADE(
	ID_PROD INTEGER NOT NULL REFERENCES PRODUTO(ID_PROD),
	PECA VARCHAR(30)
);

CREATE TABLE FORA_QUALIDADE (
	ID_PROD INTEGER REFERENCES PRODUTO(ID_PROD),
  DEFEITO VARCHAR(30),
  PECA VARCHAR(30)
);

CREATE TABLE REAJUSTE_DEFEITOS (
	ID_SETOR INTEGER NOT NULL REFERENCES SETOR_DE_PRODUCAO(ID_SETOR),
	ID_PROD INTEGER NOT NULL REFERENCES PRODUTO(ID_PROD)
);

CREATE TABLE GALPAO (
	ID_LOCAL INTEGER NOT NULL PRIMARY KEY,
	ID_PROD INTEGER NOT NULL REFERENCES PRODUTO(ID_PROD),
  NUMERO INT ,
  ENDERECO VARCHAR(30)
);

CREATE TABLE CLIENTE (
	ID_CLIENTE INTEGER NOT NULL PRIMARY KEY,
  NOME VARCHAR(30) NOT NULL,
  ENDERECO VARCHAR(30) NOT NULL,
  NOME_PROD VARCHAR(30)
);

CREATE TABLE GALP_CLIENTE (
	ID_LOCAL INTEGER NOT NULL REFERENCES GALPAO(ID_LOCAL),
	ID_CLIENTE INTEGER NOT NULL REFERENCES CLIENTE(ID_CLIENTE)
);

CREATE TABLE PESSOA_FISICA (
	ID_CLIENTE INTEGER NOT NULL REFERENCES CLIENTE(ID_CLIENTE),
  CIC VARCHAR(11) NOT NULL,
  SEXO VARCHAR(1)
);

CREATE TABLE PESSOA_JURIDICA (
	ID_CLIENTE INTEGER NOT NULL REFERENCES CLIENTE(ID_CLIENTE),
  CGC VARCHAR(14) NOT NULL
);
