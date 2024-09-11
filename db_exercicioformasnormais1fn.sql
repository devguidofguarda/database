
create database if not exists exerciciofn;
collate utf8mb4_general_ci charset utf8mb4;

use exerciciofn;

create table if not exists tb_ex1 (
	id_aluno smallint not null  auto_increment,
	nm_aluno varchar(45) not null,
    primary key (id_aluno)
    ) auto_increment = 1;

create table if not exists tb_ex1_tb2 (
	id_aluno smallint not null auto_increment,
	nm_telefone varchar(45) not null,
    primary key (id_aluno)
    ) auto_increment = 1;

create table if not exists tb_ex2 (
	id_aluno smallint not null auto_increment,
	nm_aluno varchar(45) not null,
    primary key (id_aluno)
    ) auto_increment = 1;
    
create table if not exists tb_endereco (
	id_aluno smallint not null auto_increment,
	rua varchar(45) not null,
    numero int not null,
    bairro varchar(45) not null,
    cep int not null,
	primary key (id_aluno)
    ) auto_increment = 1;

create table if not exists tb_ex3 (
	id_aluno smallint not null auto_increment,
	nm_aluno varchar(45) not null,
    primary key (id_aluno)
    ) auto_increment = 1;
    
create table if not exists tb_cursos (
	id_aluno smallint not null auto_increment,
	materia varchar(45) not null,
    primary key (id_aluno)
    ) auto_increment = 1;
    
create table if not exists tb_ex4 (
	id_aluno smallint not null auto_increment,
	nm_aluno varchar(45) not null,
    primary key (id_aluno)
    ) auto_increment = 1;
    
create table if not exists tb_email (
	id_aluno smallint not null auto_increment,
	email varchar(90) not null,
    primary key (id_aluno)
    ) auto_increment = 1;
    
create table if not exists tb_ex5 (
	id_aluno smallint not null auto_increment,
	nm_aluno varchar(45) not null,
    primary key (id_aluno)
    ) auto_increment = 1;
    
create table if not exists tb_dt_nascimento (
	id_aluno smallint not null auto_increment,
	dia_nascimento int not null,
    mes_nascimento int not null,
    ano_nascimento int not null,
    primary key (id_aluno)
    ) auto_increment = 1;
   
create table if not exists tb_ex6 (
	id_aluno smallint not null auto_increment,
	nm_aluno varchar(45) not null,
    primary key (id_aluno)
    ) auto_increment = 1;
    
create table if not exists tb_projetos (
	id_aluno smallint not null auto_increment,
	Nm_projeto varchar(45) not null,
    primary key (id_aluno)
    ) auto_increment = 1;
    
 create table if not exists tb_ex7 (
	id_aluno smallint not null auto_increment,
	nm_aluno varchar(45) not null,
    primary key (id_aluno)
    ) auto_increment = 1;   
 
 create table if not exists tb_habilidades (
	id_aluno smallint not null auto_increment,
	nm_habilidade varchar(45) not null,
    primary key (id_aluno)
    ) auto_increment = 1;
    
create table if not exists tb_ex8 (
	id_cliente smallint not null auto_increment,
	nm_cliente varchar(45) not null,
    primary key (id_cliente)
    ) auto_increment = 1;
    
create table if not exists tb_pedidos (
	id_clientes smallint not null auto_increment,
	nm_pedidos varchar(45) not null,
    primary key (id_cliente)
    ) auto_increment = 1;
    
create table if not exists tb_ex9 (
	id_fornecedor smallint not null auto_increment,
	nm_fornecedor varchar(45) not null,
    primary key (id_fornecedor)
    ) auto_increment = 1;
    
create table if not exists tb_ex9 (
	id_fornecedor smallint not null auto_increment,
	nm_produto varchar(45) not null,
    primary key (id_fornecedor)
    ) auto_increment = 1;
    
create table if not exists tb_ex10 (
	id_produtor smallint not null auto_increment,
	nm_produtor varchar(45) not null,
    primary key (id_produtor)
    ) auto_increment = 1;
    
create table if not exists tb_eventos (
	id_fornecedor smallint not null auto_increment,
	nm_evento varchar(45) not null,
    primary key (id_fornecedor)
    ) auto_increment = 1;
    
create table if not exists tb_local_evento (
	id_produtor smallint not null auto_increment,
	nm_evento varchar(45) not null,
    rua varchar(45) not null,
    numero int not null,
    primary key (id_fornecedor)
    ) auto_increment = 1;