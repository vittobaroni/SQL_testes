CREATE TABLE Departamento
(Cod_Depto INTEGER NOT NULL,
Nome_Depto VARCHAR(20) NOT NULL,
PRIMARY KEY(Cod_Depto));

CREATE TABLE Funcionario
(Cod_Func INTEGER NOT NULL,
Nome_Func VARCHAR(20) NOT NULL, Salario INTEGER NOT NULL, Cod_Depto INTEGER NOT NULL, PRIMARY KEY(Cod_Func),
FOREIGN KEY (Cod_Depto) REFERENCES Departamento (Cod_Depto));

CREATE TABLE Projeto (Cod_Proj INTEGER NOT NULL, Nome_Proj VARCHAR(20) NOT NULL, Duracao INTEGER NOT NULL, PRIMARY KEY(Cod_Proj));

CREATE TABLE Func_Proj (Cod_Func INTEGER NOT NULL, Cod_Proj INTEGER, Horas_Trab INTEGER,
PRIMARY KEY(Cod_Func, Cod_Proj),
FOREIGN KEY (Cod_Func) REFERENCES Funcionario(Cod_Func), FOREIGN KEY (Cod_Proj) REFERENCES Projeto(Cod_Proj));

--------------------------------------------------------


INSERT INTO Departamento (Cod_Depto, Nome_Depto) VALUES (1, 'Marketing'); INSERT INTO Departamento (Cod_Depto, Nome_Depto) VALUES (2, 'Vendas'); 
INSERT INTO Departamento (Cod_Depto, Nome_Depto) VALUES (3, 'Dados'); INSERT INTO Departamento (Cod_Depto, Nome_Depto) VALUES (4, 'Pesquisa');

INSERT INTO Funcionario (Cod_Func, Nome_Func, Salario, Cod_Depto) VALUES (101, 'Joao da Silva Santos', 2000, 2); 
INSERT INTO Funcionario (Cod_Func, Nome_Func, Salario, Cod_Depto) VALUES (102, 'Mario Souza', 1500, 1);  INSERT INTO Funcionario (Cod_Func, Nome_Func, Salario, Cod_Depto) VALUES (103, 'Sergio Silva Santos', 2400, 2); 
INSERT INTO Funcionario (Cod_Func, Nome_Func, Salario, Cod_Depto) VALUES (104, 'Maria Castro', 1200, 1);
INSERT INTO Funcionario (Cod_Func, Nome_Func, Salario, Cod_Depto) VALUES (105, 'Marcio Silva Santana', 1400, 4);

INSERT INTO Projeto (Cod_Proj, Nome_Proj, Duracao) VALUES (1001, 'SistemaA', 2); INSERT INTO Projeto (Cod_Proj, Nome_Proj, Duracao) VALUES (1002, 'SistemaB', 6); INSERT INTO Projeto (Cod_Proj, Nome_Proj, Duracao) VALUES (1003, 'SistemaX', 4);

INSERT INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) VALUES (101, 1001, 24); 
INSERT INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) VALUES (101, 1002, 160); 
INSERT INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) VALUES (102, 1001, 56); 
INSERT INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) VALUES (102, 1003, 45); 
INSERT INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) VALUES (103, 1001, 86); 
INSERT INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) VALUES (103, 1003, 64); 
INSERT INTO Func_Proj (Cod_Func, Cod_Proj, Horas_Trab) VALUES (104, 1001, 46); 


/*SELECT * -- serve para juntar tudo da tabela funcionario para departamento
FROM Funcionario F INNER JOIN Departamento D
ON (F.Cod_depto = D.Cod_depto);*/

--Testando a mesma função com inner join

/*SELECT F.Nome_Func,D.Nome_Depto
FROM Funcionario F INNER JOIN Departamento D
ON(F.Cod_depto = D.Cod_depto)
ORDER BY D.Nome_Depto ASC;*/

/*SELECT D.Nome_Depto, COUNT(F.Cod_Depto) AS Total
FROM Departamento D INNER JOIN Funcionario F
ON(D.Cod_depto = F.Cod_depto) 
GROUP BY D.Nome_Depto
ORDER BY D.Nome_Depto ASC;*/

/*SELECT F.Nome_Func, P.Nome_Proj
FROM Funcionario F INNER JOIN Func_Proj S
ON (F.Cod_Func = S.Cod_Func)
INNER JOIN Projeto P
ON (S.Cod_Proj = P.Cod_Proj);*/

SELECT*
FROM DEPARTAMENTO D LEFT JOIN FUNCIONARIO F
ON(D.COD_DEPTO = F.COD_DEPTO)
ORDER BY D.NOME_DEPTO ASC;

/*SELECT D.Nome_Depto, F.Nome_func
FROM Departamento D LEFT JOIN Funcionario F
ON(D.Cod_depto=F.Cod_depto) 
ORDER BY D.Nome_Depto; */

/*SELECT N.Nome_Depto, COUNT(F.Cod_Func) AS Total
FROM Departamento N LEFT JOIN Funcionario F
ON(N.Cod_Depto = F.Cod_Depto)
GROUP BY N.Nome_Depto
ORDER BY N.Nome_Depto ASC;*/

/*SELECT F.Nome_Func, P.Nome_Proj
FROM Funcionario F LEFT JOIN Func_Proj S
ON(F.Cod_Func = S.Cod_Func)
LEFT JOIN Projeto P
ON(S.Cod_Proj = P.Cod_Proj)
ORDER BY P.Nome_Proj DESC */

INSERT
INTO Funcionario(Cod_Func,Nome_Func,Salario)
VALUES(106, 'Antonio Silva', 2800);
