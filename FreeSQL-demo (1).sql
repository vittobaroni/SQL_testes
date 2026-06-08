--Anotações Segundo Slide

-- CRIACAO DAS TABELAS

CREATE TABLE Peca (
PeNro CHAR(4),
PeNome VARCHAR(30) NOT NULL,
PePreco INTEGER NOT NULL,
PeCor VARCHAR(20) NOT NULL,
PRIMARY KEY(PeNro));

CREATE TABLE Fornecedor (
FNro CHAR(4),
FNome VARCHAR(30) NOT NULL,
FCidade VARCHAR(30) NOT NULL,
FCategoria CHAR(1) NOT NULL,
PRIMARY KEY(FNro));

CREATE TABLE Projeto (
PNro CHAR(4),
PNome VARCHAR(30) NOT NULL,
PDuracao INTEGER NOT NULL,
PCusto INTEGER NOT NULL,
PRIMARY KEY(PNro));

CREATE TABLE Fornece_para (
PeNro CHAR(4),
FNro CHAR(4),
PNro CHAR(4),
Quant INTEGER,
PRIMARY KEY(PeNro,FNro,PNro),
FOREIGN KEY(PeNro) REFERENCES Peca(PeNro),
FOREIGN KEY(FNro) REFERENCES Fornecedor(FNro),
FOREIGN KEY(PNro) REFERENCES Projeto(PNro));

-- INSERCAO DOS DADOS

INSERT INTO Peca VALUES ('PE1', 'Cinto', 22, 'Azul');
INSERT INTO Peca VALUES ('PE2', 'Volante', 18, 'Vermelho');
INSERT INTO Peca VALUES ('PE3', 'Lanterna', 14, 'Preto');
INSERT INTO Peca VALUES ('PE4', 'Limpador', 9, 'Amarelo');
INSERT INTO Peca VALUES ('PE5', 'Painel', 43, 'Vermelho');

INSERT INTO Fornecedor VALUES ('F1', 'Plastec', 'Campinas', 'B');
INSERT INTO Fornecedor VALUES ('F2', 'CM', 'Sao Paulo', 'D');
INSERT INTO Fornecedor VALUES ('F3', 'Kirurgic', 'Campinas', 'A');
INSERT INTO Fornecedor VALUES ('F4', 'Piloto', 'Piracicaba', 'A');
INSERT INTO Fornecedor VALUES ('F5', 'Equipament', 'Sao Carlos', 'C');

INSERT INTO Projeto VALUES ('P1', 'Detroit', 5, 43000);
INSERT INTO Projeto VALUES ('P2', 'Pegasus', 3, 37000);
INSERT INTO Projeto VALUES ('P3', 'Alfa', 2, 26700);
INSERT INTO Projeto VALUES ('P4', 'Sea', 3, 21200);
INSERT INTO Projeto VALUES ('P5', 'Paraiso', 1, 17000);

INSERT INTO Fornece_para VALUES ('PE1', 'F5', 'P4', 5);
INSERT INTO Fornece_para VALUES ('PE2', 'F2', 'P2', 1);
INSERT INTO Fornece_para VALUES ('PE3', 'F3', 'P4', 2);
INSERT INTO Fornece_para VALUES ('PE4', 'F4', 'P5', 3);
INSERT INTO Fornece_para VALUES ('PE5', 'F1', 'P1', 1);
INSERT INTO Fornece_para VALUES ('PE2', 'F2', 'P3', 1);
INSERT INTO Fornece_para VALUES ('PE4', 'F3', 'P5', 2);

-- SELECT DISTINCT PeNro FROM Fornece_para ORDER BY PeNro ASC;
--DISTINCT retorna o resultado da consulta sem linhas duplicadas

/*SELECT Pnome, (PDuracao * 30) AS Dias FROM Projeto;
Pduracao * 30 é pros dias e AS é usado pra criar uma mascara
só no resultado da consulta, mudando o nome do atributo resultante */

--SELECT PeNome FROM Peca WHERE (PeCor = 'Vermelho') AND (PePreco > 15)
--ORDER BY PePreco DESC;


/* SELECT PeNome FROM Peca WHERE ((PeCor ='Vermelho') OR (PeCor ='Amarelo'))
AND PePreco IN (09,18,22,40,90)
ORDER BY PePreco ASC; */

--SELECT PeNome FROM Peca WHERE (PePreco NOT IN(9,14,60)) ORDER BY PePreco DESC;

-- SELECT Fnome FROM Fornecedor WHERE ( FCidade LIKE 'S%');

-- SELECT PeNome FROM Peca WHERE (PeNome LIKE '___t%');

-- SELECT PNome FROM Projeto WHERE (Pcusto BETWEEN 20000 AND 30000);

--SELECT PNome FROM Projeto WHERE (PDuracao IS NULL);

-- SELECT AVG(Pcusto) from Projeto WHERE (Pduracao >= 3);

-- SELECT SUM(Quant) FROM Fornece_para WHERE (PNro = 'P4');

-- SELECT COUNT (FNro) AS total FROM Fornecedor WHERE (FCidade LIKE 'S%');

-- SELECT COUNT (DISTINCT FCidade) FROM Fornecedor ;

-- SELECT MIN(PCusto), MAX(Pcusto) FROM Projeto ;

-- SELECT PeNro, SUM(Quant)AS Soma FROM Fornece_para GROUP BY PeNro ORDER BY PeNro ASC;

SELECT PeNro, SUM(Quant) AS Soma FROM Fornece_para GROUP BY PeNro HAVING SUM(Quant) < 3 ORDER BY SUM(Quant) DESC, PeNro ASC;