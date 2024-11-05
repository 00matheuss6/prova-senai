CREATE DATABASE PROVA  -- CRIAÇÃO DO BANCO DE DADOS

CREATE TABLE Clientes(                          ---CRIAÇÃO DA TABELA CLIENTE    
	ID_cliente INT PRIMARY KEY NOT NULL,
	Nome_cliente VARCHAR(100) NOT NULL,
	Data_nascimento DATE NOT NULL,
	Telefone INT,
	Sexo VARCHAR (50)
)

CREATE TABLE Produtos(                         ---CRIAÇÃO DA TABELA PRODUTOS
	ID_produto INT PRIMARY KEY NOT NULL,
	Nome_produto VARCHAR (100) NOT NULL,
	Preço_produto FLOAT NOT NULL,
	Tamanhos VARCHAR (100) NOT NULL
)
CREATE TABLE Vendas(                           ---CRIAÇÃO DA TABELA VENDAS
	ID_venda INT PRIMARY KEY NOT NULL,
	Modelo VARCHAR(100) NOT NULL,
	Data_da_venda DATE NOT NULL,
	Quantidade_vendida_infantil INT NOT NULL,
	Quantidade_vendida_adulto INT NOT NULL
)

---------INSERINDO VALORES NA TABELA
--------TABELA CLIENTE
INSERT INTO Clientes (ID_cliente, Nome_cliente, Data_nascimento, Telefone, Sexo)
VALUES 
	(1,'Julia Pazeto','2000-02-22',4002-8922,'feminino'),
	(2,'Matheus Leite','2000-04-06',3596-1553,'masculino'),
	(3,'Vitoria Serafim','2000-04-10',1865-4562,'feminino'),
	(4,'Vinicius Leite','2014-03-22',6985-1698,'masculino'),
	(5,'Caio Leite','2002-03-31',8656-1957,'masculino');

-------TABELA PRODUTOS
INSERT INTO Produtos (ID_produto, Nome_produto, Preço_produto, Tamanhos)
VALUES
	(1,'Camisa Flamengo',100,'Adulto'),
	(2,'Camisa Flamengo',50,'Infantil'),
	(3,'Camisa Corinthians',100,'Adulto'),
	(4,'Camisa Corinthians',50,'Infantil'),
	(5,'Camisa Palmeiras',100,'Adulto'),
	(6,'Camisa Palmeiras',50,'Infantil');

----TABELA VENDAS
INSERT INTO Vendas (ID_venda, Modelo, Data_da_venda, Quantidade_vendida_infantil, Quantidade_vendida_adulto)
VALUES
	(1, 'Camisa Flamengo', '2024-11-05', 4, 10),
	(2, 'Camisa Corinthians', '2024-11-05', 2, 5),
	(3, 'Camisa Palmeiras', '2024-11-04', 3, 7),
	(4, 'Camisa Flamengo', '2024-11-04', 4, 1),
	(5, 'Camisa Palmeiras', '2024-11-03', 2, 1);


---------------------FUNÇÕES VIEWS--------------
CREATE VIEW Clientes_mulheres AS     ---CRIAÇÃO DA VIEW
SELECT ID_cliente, Nome_cliente
FROM Clientes
WHERE Sexo = 'feminino'

SELECT*                      ----VISUALIZAÇÃO DA VIEW
FROM Clientes_mulheres

-----------------FUNÇÕES FUNCTIONS
CREATE FUNCTION Calcular_idade (@idade DATE)       -----CRIAÇÃO DA FUNCTION
RETURNS INT
AS
BEGIN
	RETURN DATEDIFF(YEAR,@idade,GETDATE());
END;

SELECT Nome_cliente, dbo.calcular_idade(Data_nascimento) AS iDADE  ---VISUALIZAÇÃO DA FUNCTION
FROM Clientes

-----------------FUNÇÕES TRIGGERS
CREATE TRIGGER Deletar_valor
ON Clientes
INSTEAD OF DELETE
AS
BEGIN
IF EXISTS (SELECT 1 FROM Cliente WHERE ID_cliente in (1,2,3,4,5,6))
BEGIN
PRINT 'VOCÊ NÃO PODE EXCLUIR ISSO!'
RETURN
END
END;


