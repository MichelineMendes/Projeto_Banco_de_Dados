--USE UNIVERSIDADE;

INSERT INTO DBO.DEPARTAMENTO
VALUES ('nome', 'descricao', 'cursos que integram');

INSERT INTO DBO.CURSO
VALUES ('nome', 'GRADE CURRICULAR', 'B ou T ou P - BACHARELADO, TECNOLOGO E POS-GRADUACAO', 'id do departamento');


INSERT INTO DBO.TELEFONE
VALUES ('TIPO A ou D OU F, ALUNO,DEPARTAMENTO,FUNCIONARIO', 'NUMERO DO TELEFONE COM DDD E SEM ESPA�OS');


INSERT INTO DBO.ENDERECO
VALUES ('TIPO A ou F, ALUNO, FUNCIONARIO', 'PA�S', 'ESTADO', 'CIDADE', 'BAIRRO', 'LOGRADOURO', 'NUMERO', 'CEP COM 8 DIGITOS SEM ESPACO');


INSERT INTO DBO.ALUNO
VALUES ('NOME', 'nome social', 'CPF sem espaco ou hifem', 'tem deficiencia', 'modo de entrada: E ou V ou T - Enem, Vestibular ou TRansferencia','historico escolar', 'finacimaneto: P ou F ou U - PROPRIO, Fies OU pRO uni', id endereco, id telefone, 'sexo: M masculino, F feminino', 'data de nascimento');


INSERT INTO DBO.FUNCIONARIO
VALUES ('tipo: P professor ou O outro', 'NOME', 'nome social', 'sexo: M masculino F feminino', 'data de nascimento', 'data de contrata��o', 'email', 'CPF sem espaco ou hifem', 'salario', id endereco, id telefone);


INSERT INTO DBO.PROFESSOR
VALUES ('TITULA��O: D doutor, M mestre, E especialista, G graduado', ID FUNCIONARIO);


INSERT INTO DBO.DISCIPLINA
VALUES ('nome', ' ementa', 'carga horaria');


INSERT INTO DBO.DISCIPLINA
VALUES ('nome', ' ementa', 'carga horaria');

INSERT INTO PROFESSOR_DISCIPLINA
VALUES (ID PROFESSOR, ID DISCIPLINA);


INSERT INTO DEPARTAMENTO_FUNCIONARIO
VALUES ('DATA DA INTEGRA��O', ID DEPARTAMENTO, ID FUNCIONARIO);


INSERT INTO ALUNO_DISCIPLINA
VALUES ('SITUACAO: A parovado, R reprovado,  C cursando', ID ALUNO, ID DISCIPLINA);

INSERT INTO MATRICULA
VALUES ('DATA DA MATRICULA', ID ALUNO, ID CURSO, ID DISCIPLINA);






