USE UNIVERSIDADE


--primeiro foram criados todas as tabelas, depois serão inseridas as chaves estrangeiras

CREATE TABLE DEPARTAMENTO (
	ID INT IDENTITY(1,1) NOT NULL, 
	NOME VARCHAR (50),
	DESCRICAO VARCHAR(250),
	CURSOS_QUE_INTEGRAM VARCHAR(100) NOT NULL,
	CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY(ID),
);


CREATE TABLE CURSOS(
	ID INT IDENTITY(1,1) NOT NULL, 
	NOME VARCHAR (50) NOT NULL,
	GRADE_CURRICULAR VARCHAR (250) NOT NULL,
	TIPO CHAR(1) NOT NULL,
	CONSTRAINT PK_CURSO PRIMARY KEY(ID)
);

CREATE TABLE DISCIPLINA(
	ID INT IDENTITY(1,1) NOT NULL, 
	NOME VARCHAR (50) NOT NULL,
	EMENTA VARCHAR(250) NOT NULL,
	CARGA_HORARIA INT NOT NULL,
	CONSTRAINT PK_DICIPLINA PRIMARY KEY(ID)
	);

CREATE TABLE CURSO_DISCIPLINA(
	ID INT IDENTITY(1,1) NOT NULL, 
	CONSTRAINT PK_CURSO_DICIPLINA PRIMARY KEY(ID)
	);

CREATE TABLE PROFESSOR(
	ID INT IDENTITY(1,1) NOT NULL, 
	TITULACAO VARCHAR(50) NOT NULL,
	CONSTRAINT PK_PROFESSOR PRIMARY KEY(ID)
	);

CREATE TABLE PROFESSOR_DISCIPLINA(
	ID INT IDENTITY(1,1) NOT NULL, 
	CONSTRAINT PK_PROFESSOR_DISCIPLINA PRIMARY KEY(ID)
	);

	
CREATE TABLE DEPARTAMENTO_FUNCIONARIO(
	ID INT IDENTITY(1,1) NOT NULL, 
	DATA_INTEGRACAO DATE NOT NULL,
	CONSTRAINT PK_DEPARTAMENTO_FUNCIONARIO PRIMARY KEY(ID)
	);

CREATE TABLE FUNCIONARIOS(
	ID INT IDENTITY(1,1) NOT NULL, 
	TIPO CHAR(1) NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	DATA_NASCIMENTO DATE NOT NULL,
	DATA_CONTRATACAO DATE NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	CPF VARCHAR(11) NOT NULL,
	SALARIO DECIMAL(7,2) NOT NULL,
	CONSTRAINT PK_FUNCIONARIO PRIMARY KEY(ID)

	);

CREATE TABLE ALUNO(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR (50) NOT NULL,
	CPF VARCHAR (11) NOT NULL,
	MODO_ENTRADA CHAR(1), NOT NULL,
	HISTORICO_ESCOLAR VARCHAR (250), NOT NULL,
	CONSTRAINT PK_ALUNO PRIMARY KEY(ID)
	);

CREATE TABLE ALUNO_DISCIPLINA(
	ID INT IDENTITY(1,1) NOT NULL,
	CONSTRAINT PK_ALUNO_DISCIPLINA PRIMARY KEY(ID)
	);

CREATE TABLE MATRICULA(
	ID INT IDENTITY(1,1) NOT NULL,
	DATA_MATRICULA DATE NOT NULL,
	CONSTRAINT PK_MATRICULA PRIMARY KEY(ID)
	);

CREATE TABLE TELEFONE(
	ID INT IDENTITY(1,1) NOT NULL,
	TIPO CHAR(1) NOT NULL,
	TELEFONE VARCHAR (13) NOT NULL,
	CONSTRAINT PK_TELEFONE PRIMARY KEY(ID),
	);

CREATE TABLE ENDERECO(
	ID INT IDENTITY(1,1) NOT NULL,
	TIPO CHAR(1) NOT NULL,
	PAIS VARCHAR(10) NOT NULL,
	ESTADO VARCHAR (20) NOT NULL,
	CIDADE VARCHAR  (20) NOT NULL,
	BAIRRO VARCHAR (20) NOT NULL,
	LOGRADOURO VARCHAR (30) NOT NULL,
	NUMERO INT  NULL,
	CEP INT  NULL,
	CONSTRAINT PK_ENDERECO PRIMARY KEY(ID)
	);



