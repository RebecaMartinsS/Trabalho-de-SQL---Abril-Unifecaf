create database db_Supermarket; #criando o db do mercadinho
use db_Supermarket;

drop database db_Supermarket; #executar essa linha caso precisar dropar/refazer algo no banco
show tables; #executar todas as tabelas já criadas

create table tbl_cliente (
id_cliente int not null primary key auto_increment,
nome_cliente varchar (100) not null,
cpf_cliente int not null
);

create table tbl_funcionario(
id_funcionario int not null primary key auto_increment,
nome_funcionario varchar (100),
cargo varchar (45)

);

create table tbl_produto(
id_produto int not null primary key auto_increment,
nome_produto varchar (150),
qtd_estoque int not null,
preco decimal (10,2)
);

create table tbl_compra(
id_compra int not null primary key auto_increment,
data date,
valor_total decimal (10,2),
forma_pagamento varchar (100),
fk_id_cliente int, -- Coluna para ligar ao cliente
fk_id_funcionario int, -- Coluna para ligar ao funcionário
    constraint fk_cliente_compra foreign key (fk_id_cliente) references tbl_cliente(id_cliente),
    constraint fk_func_compra foreign key (fk_id_funcionario) references tbl_funcionario(id_funcionario)
);

create table tbl_pedido_produto(
id int not null primary key auto_increment,
qtd_comprada int not null,
fk_id_compra int,
fk_id_produto int,
    constraint fk_compra_item foreign key (fk_id_compra) references tbl_compra(id_compra),
    constraint fk_produto_item foreign key (fk_id_produto) references tbl_produto(id_produto)
);

create table tbl_itempedido(
id_item int not null primary key auto_increment,
qtd int,
preco decimal (10,2),
subtotal_compra decimal (10,2),
fk_id_compra int,
    constraint fk_compra_itemp foreign key (fk_id_compra) references tbl_compra(id_compra)
);
show tables;
#inserindo produtos pro mercadinho
INSERT INTO tbl_produto (nome_produto, qtd_estoque, preco) values ('pão de forma', 5 , 6.99);
INSERT INTO tbl_produto (nome_produto, qtd_estoque, preco) values ('pão integral', 15 , 8.99);
INSERT INTO tbl_produto (nome_produto, qtd_estoque, preco) values ('Leite integral Parmalat', 50 , 3.99);
INSERT INTO tbl_produto (nome_produto, qtd_estoque, preco) values ('Arroz integral Camil 2kg', 45 , 12.99);
INSERT INTO tbl_produto (nome_produto, qtd_estoque, preco) values ('Batata frita congelada 1kg', 25 , 9.99);
INSERT INTO tbl_produto (nome_produto, qtd_estoque, preco) values ('Activia amora 1l', 15 , 9.99);
INSERT INTO tbl_produto (nome_produto, qtd_estoque, preco) values ('Macarrão Dona benta parafuso 500g', 35 , 4.99);
INSERT INTO tbl_produto (nome_produto, qtd_estoque, preco) values ('Massa de bolo Fleischmann Chocolate', 20 , 5.99);
INSERT INTO tbl_produto (nome_produto, qtd_estoque, preco) values ('Massa de bolo Fleischmann Cenoura', 20 , 5.99);
INSERT INTO tbl_produto (nome_produto, qtd_estoque, preco) values ('Massa de bolo Fleischmann Chocomousse', 20 , 6.99);

select nome_produto, preco from tbl_produto;
select * from tbl_produto WHERE preco >10;

INSERT INTO tbl_cliente (nome_cliente, cpf_cliente) values ('Rebeca M', 58341822851);
ALTER TABLE tbl_cliente MODIFY COLUMN cpf_cliente VARCHAR(11) NOT NULL; #alterando o tipo
# inserindo clientes
INSERT INTO tbl_cliente (nome_cliente, cpf_cliente) values ('João Silva', 58441523852);
INSERT INTO tbl_cliente (nome_cliente, cpf_cliente) values ('Marcela Alves', 58345822253);
INSERT INTO tbl_cliente (nome_cliente, cpf_cliente) values ('Marina Rodrigues', 58861832850);

select * from tbl_cliente;
#inserindo os funcionarios do mercadinho
INSERT INTO tbl_funcionario (nome_funcionario, cargo) values ('Fernando Souza', 'Operador de caixa');
INSERT INTO tbl_funcionario (nome_funcionario, cargo) values ('Juliana Marques', 'Operadora de caixa');
INSERT INTO tbl_funcionario (nome_funcionario, cargo) values ('Felipe Henrique', 'Padeiro');
INSERT INTO tbl_funcionario (nome_funcionario, cargo) values ('Vitor Silva', 'Açogueiro');
INSERT INTO tbl_funcionario (nome_funcionario, cargo) values ('Renata Morais', 'Jovem aprendiz - repositora');

select * from tbl_funcionario;
