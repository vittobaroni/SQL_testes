--Anotações primeiro Slide 

CREATE TABLE Aluno
(Matricula INTEGER CHECK(Matricula >= 1),
Nome_aluno VARCHAR(50) NOT NULL,
PRIMARY KEY (Matricula)
);

CREATE TABLE Disciplina
(Cod_disc INTEGER CHECK(Cod_disc >= 1),
Nome_disc VARCHAR(25) NOT NULL UNIQUE,
PRIMARY KEY (Cod_disc)
);

CREATE TABLE Aluno_Disciplina
(Matricula INTEGER,
Cod_disc INTEGER,
Nota INTEGER CHECK(Nota BETWEEN 0 AND 10),
PRIMARY KEY (Matricula, Cod_disc),
FOREIGN KEY (Matricula) REFERENCES Aluno(Matricula),
FOREIGN KEY (Cod_disc) REFERENCES Disciplina(Cod_disc)
);


DROP TABLE Aluno_Disciplina -- apaga COMPLETAMENTE uma tabela do banco, portanto CUIDADO AO MEXER !

/* Adicionando tres alunos na tabela Aluno */

INSERT INTO Aluno VALUES (1,'jpbaronic');
INSERT INTO Aluno VALUES (2,'Onico');
INSERT INTO Aluno VALUES (3,'cacarpenter');

/* Adicionando duas disciplinas nessa merda */

INSERT INTO Disciplina (Cod_disc, Nome_disc)
VALUES (100, 'Banco de Dados I');

INSERT INTO Disciplina (Cod_disc, Nome_disc)
VALUES (101, 'Banco de Dados II');

/* adicionando a tabela alunos na disciplina: Só é possível
adicionar se o mesmo elemento tiver na tabela alunos e o mesmo na disciplina
e identificamos se existe o elemento pela PK de cada tabela */

INSERT INTO Aluno_Disciplina (Matricula, Cod_disc, Nota)
VALUES (1, 100, 9);

INSERT INTO Aluno_Disciplina (Matricula, Cod_disc, Nota)
VALUES (1, 101, 8);

/* UPDATE --> Atualização de valores dentro de uma tabela */

UPDATE Aluno_Disciplina
SET Nota =  Nota + 1
WHERE (Nota >= 7 ) AND (Nota <= 9 );

UPDATE Disciplina 
SET Nome_disc = 'topicos em banco'
WHERE (Nome_disc = 'Projeto de Banco de Dados');


/* DELETE --> Remover dados de uma tabela */

DELETE 
FROM Aluno_Disciplina
WHERE (Cod_Disc = 101);


-- Se nção colocar nenhuma condição, a tabela inteira vai po caralho
/* aparentemente, usar o TRUNCATE FROM para apagar todos os dados de uma 
tabela é muito mais eficiente */