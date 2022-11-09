--CREATE DATABASE UNIVERSIDADE; 

--USE UNIVERSIDADE;

--TABELA DE DEPARTAMENTO
--DROP TABLE DBO.DEPARTAMENTO


CREATE TABLE DEPARTAMENTO
(
	ID INT IDENTITY(1,1) NOT NULL,  --AUTOINCREMENTO INICIANDO DE 1 E COM PASSO 1
	NOME VARCHAR (50),
	DESCRICAO VARCHAR(250),
	CURSOS_QUE_INTEGRAM VARCHAR(100) NOT NULL,
	CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY(ID)
);


--TABELA CURSO
--DROP TABLE DBO.CURSO


CREATE TABLE CURSO
(
    ID INT IDENTITY(1,1) NOT NULL, 
	NOME VARCHAR (50) NOT NULL,
	GRADE_CURRICULAR VARCHAR (250) NOT NULL,
	TIPO CHAR(1) NOT NULL,
	ID_DEPARTAMENTO INT NOT NULL,
	CONSTRAINT PK_CURSO PRIMARY KEY(ID),
	CONSTRAINT FK_CURSO_DEPARTAMENTO FOREIGN KEY(ID_DEPARTAMENTO)
	REFERENCES DBO.DEPARTAMENTO (ID)
);



--TABELA TELEFONE
--DROP TABLE DBO.TELEFONE

CREATE TABLE TELEFONE
(
	ID INT IDENTITY(1,1) NOT NULL,
	TIPO CHAR(1) NOT NULL,
	TELEFONE VARCHAR (13) NOT NULL,
	CONSTRAINT PK_TELEFONE PRIMARY KEY(ID),
);




--TABELA ENDERECO
--DROP TABLE DBO.ENDERECO

CREATE TABLE ENDERECO
(
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





--TABELA ALUNO
--DROP TABLE DBO.ALUNO

CREATE TABLE ALUNO
(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR (50) NOT NULL,
	NOME_SOCIAL VARCHAR (50),  --NOME QUE GOSTA DE SER CHAMADO 
	CPF VARCHAR (11) NOT NULL,
	DEFICIENCIA VARCHAR (20),  -- DEFICIENCIA QUE ALUNO PODE APRESENTAR
	MODO_ENTRADA CHAR(1) NOT NULL, --V VESTIBULAR, E ENEM, T TRANSFERIDO, G GRADUADO
	HISTORICO_ESCOLAR VARCHAR (250) NOT NULL,
	FINANCIAMENTO CHAR (1) NOT NULL,  --- P PROPRIO,   F FIES,  P PROUNI, B BOLSISTA, V PRA-VALER
	ID_ENDERECO INT NOT NULL,
	ID_TELEFONE  INT NOT NULL,
	CONSTRAINT FK_ALUNO_ENDERECO FOREIGN KEY(ID_ENDERECO)
	REFERENCES DBO.ENDERECO(ID),
	CONSTRAINT FK_ALUNO_TELEFONE FOREIGN KEY(ID_TELEFONE)
	REFERENCES DBO.TELEFONE(ID),
	CONSTRAINT PK_ALUNO PRIMARY KEY(ID)
);


--TABELA FUNCIONARIO
--DROP TABLE DBO.FUNCIONARIO

CREATE TABLE FUNCIONARIO
(
	ID INT IDENTITY(1,1) NOT NULL, 
	TIPO CHAR(1) NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	NOME_SOCIAL VARCHAR (50),  --NOME QUE GOSTA DE SER CHAMADO 
	SEXO CHAR(1) NOT NULL, -- M MASCULINO   F FEMININO
	DATA_NASCIMENTO DATE NOT NULL,
	DATA_CONTRATACAO DATE NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	CPF VARCHAR(11) NOT NULL,
	SALARIO DECIMAL(7,2) NOT NULL,
	ID_ENDERECO INT NOT NULL,
	ID_TELEFONE INT NOT NULL,
	CONSTRAINT FK_FUNCIONARIO_ENDERECO FOREIGN KEY(ID_ENDERECO)
	REFERENCES DBO.ENDERECO(ID),
	CONSTRAINT FK_FUNCIONARIO_TELEFONE FOREIGN KEY(ID_TELEFONE)
	REFERENCES DBO.TELEFONE(ID),
	CONSTRAINT PK_FUNCIONARIO PRIMARY KEY(ID)
);



--TABELA PROFESSOR
--DROP TABLE DBO.PROFESSOR

CREATE TABLE PROFESSOR
(
	ID INT IDENTITY(1,1) NOT NULL, 
	TITULACAO VARCHAR(50) NOT NULL,
	ID_FUNCIONARIO INT NOT NULL,
	CONSTRAINT FK_PROFESSOR_FUNCIONARIO FOREIGN KEY(ID_FUNCIONARIO)
	REFERENCES DBO.FUNCIONARIO(ID),
	CONSTRAINT PK_PROFESSOR PRIMARY KEY(ID)
);



--TABELA DISCIPLINA
--DROP TABLE DBO.DISCIPLINA

CREATE TABLE DISCIPLINA
(
	ID INT IDENTITY(1,1) NOT NULL, 
	NOME VARCHAR (50) NOT NULL,
	EMENTA VARCHAR(250) NOT NULL,
	CARGA_HORARIA INT NOT NULL,
	ID_PROFESSOR INT NOT NULL,
	ID_ALUNO INT NOT NULL,
	CONSTRAINT FK_DISCIPLINA_PROFESSOR FOREIGN KEY(ID_PROFESSOR)
	REFERENCES DBO.PROFESSOR(ID),
	CONSTRAINT FK_DISCIPLINA_ALUNO FOREIGN KEY(ID_ALUNO)
	REFERENCES DBO.ALUNO(ID),
	CONSTRAINT PK_DICIPLINA PRIMARY KEY(ID)
);




--TABELA PROFESSOR_DISCIPLINA
--DROP TABLE DBO.PROFESSOR_DISCIPLINA

CREATE TABLE PROFESSOR_DISCIPLINA
(
	ID INT IDENTITY(1,1) NOT NULL, 
	ID_PROFESSOR INT NOT NULL,
	ID_DISCIPLINA INT NOT NULL,
	CONSTRAINT FK_PROFESSOR_DICIPLINA_PROFESSOR FOREIGN KEY(ID_PROFESSOR)
	REFERENCES DBO.PROFESSOR(ID),
	CONSTRAINT FK_PROFESSOR_DISCIPLINA_DISCIPLINA FOREIGN KEY(ID_DISCIPLINA)
	REFERENCES DBO.DISCIPLINA(ID),
	CONSTRAINT PK_PROFESSOR_DISCIPLINA PRIMARY KEY(ID)
);



--TABELA DEPARTAMENTO_FUNCIONARIO
--DROP TABLE DBO.DEPARTAMENTO_FUNCIONARIO

CREATE TABLE DEPARTAMENTO_FUNCIONARIO
(
	ID INT IDENTITY(1,1) NOT NULL, 
	DATA_INTEGRACAO DATE NOT NULL,
	ID_DEPARTAMENTO INT NOT NULL,
	ID_FUNCIONARIO INT NOT NULL,
	CONSTRAINT FK_DEPARTAMENTO_FUNCIONARIO_DEPARTAMENTO FOREIGN KEY(ID_DEPARTAMENTO)
	REFERENCES DBO.DEPARTAMENTO (ID),
	CONSTRAINT FK_DEPARTAMENTO_FUNCIONARIO_FUNCIONARIO FOREIGN KEY(ID_FUNCIONARIO)
	REFERENCES DBO.FUNCIONARIO(ID),
	CONSTRAINT PK_DEPARTAMENTO_FUNCIONARIO PRIMARY KEY(ID)
);



--TABELA ALUNO_DISCIPLINA
--DROP TABLE DBO.ALUNO_DISCIPLINA

CREATE TABLE ALUNO_DISCIPLINA
(
	ID INT IDENTITY(1,1) NOT NULL,
	SITUACAO CHAR (1) NOT NULL,  -- A APROVADO, R REPROVADO, N N�O CURSADA
	ID_ALUNO INT NOT NULL,
	ID_DISCIPLINA INT NOT NULL,
	CONSTRAINT FK_ALUNO_DISCIPLINA_ALUNO FOREIGN KEY(ID_ALUNO)
	REFERENCES ALUNO(ID),
	CONSTRAINT FK_ALUNO_DISCIPLINA_DISCIPLINA FOREIGN KEY(ID_DISCIPLINA)
	REFERENCES DISCIPLINA(ID),
	CONSTRAINT PK_ALUNO_DISCIPLINA PRIMARY KEY(ID)
);



--TABELA  MATRICULA
--DROP TABLE DBO. MATRICULA

CREATE TABLE MATRICULA
(
	ID INT IDENTITY(1,1) NOT NULL,
	DATA_MATRICULA DATE NOT NULL,
	ID_ALUNO INT NOT NULL,
	ID_CURSO INT NOT NULL,
	ID_DISCIPLINA INT NOT NULL,
	CONSTRAINT FK_MATRICULA_ALUNO FOREIGN KEY(ID_ALUNO)
	REFERENCES DBO.MATRICULA(ID),
	CONSTRAINT FK_MATRICULA_CURSO FOREIGN KEY(ID_CURSO)
	REFERENCES DBO.CURSO (ID),
	CONSTRAINT FK_MATRICULA_DISCIPLINA FOREIGN KEY(ID_DISCIPLINA)
	REFERENCES DBO.DISCIPLINA(ID),
	CONSTRAINT PK_MATRICULA PRIMARY KEY(ID)
);



















