-- criando o banco de dados
create database loja_jogos;
use loja_jogos;

-- criando tabela de categorias
create table categorias (
    id_categoria int primary key auto_increment,
    nome varchar(50) not null
);

-- criando tabela de plataformas
create table plataformas (
    id_plataforma int primary key auto_increment,
    nome varchar(50) not null
);

-- criando tabela de jogos
create table jogos (
    id_jogo int primary key auto_increment,
    nome varchar(100) not null,
    preco decimal(10,2) not null,
    id_categoria int,
    id_plataforma int,
    foreign key (id_categoria) references categorias(id_categoria)
    on delete cascade
    on update cascade,
    foreign key (id_plataforma) references plataformas(id_plataforma)
    on delete cascade on update cascade
);

-- criando tabela de clientes
create table clientes (
    id_cliente int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) unique
);

-- criando tabela de pedidos
create table pedidos (
    id_pedido int primary key auto_increment,
    data_pedido date,
    id_cliente int,
    foreign key (id_cliente) references clientes(id_cliente)
    on delete cascade on update cascade
);

-- criando tabela de itens do pedido
create table itens_pedido (
    id_item int primary key auto_increment,
    id_pedido int,
    id_jogo int,
    quantidade int,
    foreign key (id_pedido) references pedidos(id_pedido)
    on delete cascade
    on update cascade,
    foreign key (id_jogo) references jogos(id_jogo)
    on delete cascade on update cascade
);

-- inserindo categorias
insert into categorias (nome) values
('ação'), ('rpg'), ('esporte'), ('corrida'),
('terror'), ('aventura'), ('fps'), ('luta');

-- inserindo plataformas
insert into plataformas (nome) values
('pc'), ('ps4'), ('ps5'), ('xbox one'),
('xbox series x'), ('nintendo switch'), ('mobile'), ('steam deck');

-- inserindo jogos
insert into jogos (nome, preco, id_categoria, id_plataforma) values
('fifa 24', 299.90, 3, 3),
('call of duty', 349.90, 7, 5),
('resident evil 4', 199.90, 5, 2),
('minecraft', 249.90, 4, 5),
('terraria', 299.90, 6, 6),
('mortal kombat 11', 279.90, 8, 3),
('elden ring', 299.90, 2, 1),
('gta v', 149.90, 1, 2);

-- inserindo clientes
insert into clientes (nome, email) values
('daniel', 'daniel@gmail.com'),
('davidy', 'davidy@gmail.com'),
('willian', 'willian@gmail.com'),
('ana', 'ana@gmail.com'),
('laiane', 'laiane@gmail.com'),
('drey', 'drey@gmail.com'),
('arthur', 'arthur@gmail.com'),
('erick', 'erick@gmail.com');

-- inserindo pedidos
insert into pedidos (data_pedido, id_cliente) values
('2026-04-01', 1),
('2026-04-02', 2),
('2026-04-03', 3),
('2026-04-04', 4),
('2026-04-05', 5),
('2026-04-06', 6),
('2026-04-07', 7),
('2026-04-08', 8);

-- inserindo itens do pedido
insert into itens_pedido (id_pedido, id_jogo, quantidade) values
(1,1,1),
(2,2,2),
(3,3,1),
(4,4,1),
(5,5,2),
(6,6,1),
(7,7,1),
(8,8,3);

-- seleciona todos os jogos
select * from jogos;

-- seleciona jogos com preço maior que 200
select * from jogos where preco > 200;

-- ordena jogos por preço
select * from jogos order by preco desc;

-- junta jogos com categorias
select jogos.nome, categorias.nome as categoria
from jogos
join categorias on jogos.id_categoria = categorias.id_categoria;

-- junta pedidos com clientes
select pedidos.id_pedido, clientes.nome
from pedidos
join clientes on pedidos.id_cliente = clientes.id_cliente;

-- soma quantidade de jogos vendidos
select id_jogo, sum(quantidade) as total_vendido
from itens_pedido
group by id_jogo;

-- conta quantos clientes existem
select count(*) from clientes;

-- média de preços dos jogos
select avg(preco) from jogos;
