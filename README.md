INFORMAÇÕES DO BANDO DE DADOS 
-------------------------------------------------
*NOME DO BANCO DE DADOS: sistemalogin;

*NOME DA TABELA: dadosUsuarios;

-------------------------------------------------
SCRIPT DE CRIAÇÃO
-------------------------------------------------

CREATE DATABASE SistemaLogin

USE SistemaLogin

CREATE TABLE sistemalogin.dadosUsuarios(
	id int auto_increment not null,
	nome varchar(50) not null,
	sobrenome varchar(50) not null,
	email varchar(150) not null,
	senha varchar(150) not null,
	telefone_celular varchar(150) not null,
	primary key(id)	
);
-------------------------------------------------
COM ISSO O BANCO DE DADOS VAI ESTÁ CERTINHO PARA 
RECEBER OS DADOS.
-------------------------------------------------
AGORA VAMOS NO CÓDIGO REFERENCIAR O CAMINHO(URL)
DO BANCO DE DADOS, USER E PASSWORD.

*AO ABRIR O PROJETO VAI TER UMA PASTA COM O NOME
SOURCE PACKAGES, DENTRO DELA TEM UM PACOTE COM O 
NOME CONTROLE, DENTRO DO PACOTE EXISTE UMA CLASSE
CHAMADA DE CONEXION.

*AO CLICAR NA CLASSE CONEXION, O CÓDIGO FONTE SERÁ 
ABERTO, BEM NO COMEÇO DO CÓDIGO EXISTEM TRÊS VARIAVEIS
DO TIPO STRING, CADA UMA REFERENCIANDO SUA PROPRIEDADE, 
É SÓ ALTERAR OS VALORES CORRESPONDE DO BANCO DE DADOS 
E RODAR A APLICAÇÃO!!
-------------------------------------------------
OBS: AGRADEÇO A OPORTUNIDADE, DEI MEU MÁXIMO, APRENDI
VÁRIAS COISAS COM O DESENVOLVIMENTO DESSE DESAFIO, 
ESPERO QUE GOSTEM E ATENDA AS EXPECTATIVAS KK, MESMO 
QUE EU NÃO FOR APROVADO GOSTEI DA EXPERIENCIA, MUITO 
OBRIGADO!! 