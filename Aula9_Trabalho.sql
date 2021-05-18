-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Maio-2021 às 02:50
-- Versão do servidor: 10.3.16-MariaDB
-- versão do PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aula9_trabalho`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome`) VALUES
(1, 'Material Escolar'),
(2, 'Material de escritório'),
(3, 'Livros e revistas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dpto`
--

CREATE TABLE `dpto` (
  `id_dpto` int(11) NOT NULL,
  `nome` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `dpto`
--

INSERT INTO `dpto` (`id_dpto`, `nome`) VALUES
(1, 'Departamento 01'),
(2, 'Departamento 02'),
(3, 'Departamento 03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `id_item` int(11) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `cod_analfa` varchar(15) DEFAULT NULL,
  `quantidade_estoque` int(11) DEFAULT NULL,
  `valor_unit` float DEFAULT NULL,
  `id_dpto` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`id_item`, `nome`, `cod_analfa`, `quantidade_estoque`, `valor_unit`, `id_dpto`, `id_categoria`) VALUES
(1, 'Lápis', 'A123', 10, 5, 1, 1),
(2, 'Borracha', 'B123', 10, 5, 1, 1),
(3, 'Caneta', 'C123', 10, 5, 1, 1),
(4, 'Penal', 'D123', 10, 5, 1, 1),
(5, 'Corretivo', 'E123', 10, 5, 1, 1),
(6, 'Régua', 'F123', 10, 5, 1, 1),
(7, 'Caderno', 'G123', 10, 5, 1, 1),
(8, 'Transferidor', 'H123', 10, 5, 1, 1),
(9, 'Claculadora', 'I123', 10, 5, 1, 1),
(10, 'Mochila', 'J123', 10, 5, 1, 1),
(11, 'Computador', 'A321', 10, 50, 2, 2),
(12, 'Notecooke', 'B321', 10, 50, 2, 2),
(13, 'Teclado', 'C321', 10, 50, 2, 2),
(14, 'Mouse', 'D321', 10, 50, 2, 2),
(15, 'Monitor', 'E321', 10, 50, 2, 2),
(16, 'Mouse Pad', 'F321', 10, 50, 2, 2),
(17, 'Cabo de Rede', 'G321', 10, 50, 2, 2),
(18, 'Cabo HDMI', 'H321', 10, 50, 2, 2),
(19, 'Modem', 'I321', 10, 50, 2, 2),
(20, 'Gabinete', 'J321', 10, 50, 2, 2),
(21, 'Harry Potter 1', 'A456', 10, 15, 3, 3),
(22, 'Harry Potter 2', 'B456', 10, 15, 3, 3),
(23, 'Harry Potter 3', 'C456', 10, 15, 3, 3),
(24, 'Harry Potter 4', 'D456', 10, 15, 3, 3),
(25, 'Harry Potter 5', 'E456', 10, 15, 3, 3),
(26, 'As Armas da Persuasão', 'F456', 10, 15, 3, 3),
(27, 'Pai rico Pai pobre', 'G456', 10, 15, 3, 3),
(28, 'Veja', 'H456', 10, 15, 3, 3),
(29, 'PlayBoy', 'I456', 10, 15, 3, 3),
(30, 'Brasileirinhas', 'J456', 10, 15, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_vendedor` int(11) DEFAULT NULL,
  `data_pedido` datetime DEFAULT current_timestamp(),
  `cliente` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into pedido (id_vendedor, cliente)
values ('1','Joel'),('1','Tomas'),
('2','Ivonete'),('2','Ricardo'),
('3','Jonas'),('3','Tamara'),
('4','Ademir'),('4','Gersi'),
('5','Brisa'),('5','Kaua');


-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_item`
--

CREATE TABLE `pedido_item` (
  `id_pedido_item` int(11) NOT NULL,
  `id_item` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `quantidade` varchar(45) DEFAULT NULL,
  `valor_unit` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into pedido_item (id_item, id_pedido, quantidade, valor_unit)

values ('1','1', 10, 5),
('2','2', 10, 5),
('3','3', 10, 10),
('4','4', 10, 10),
('17','5', 10, 50),
('18','6', 10, 50),
('19','7', 10, 60),
('20','8', 10, 60),
('26','9', 10, 15),
('27','10', 10, 15);
-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `id_vendedor` int(11) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `data_adm` datetime DEFAULT current_timestamp(),
  `id_dpto` int(11) DEFAULT NULL,
  `comissao` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`id_vendedor`, `nome`, `data_adm`, `id_dpto`, `comissao`) VALUES
(1, 'Jorge', '2021-05-17 22:54:05', 1, 0),
(2, 'Janaina', '2021-05-17 22:54:05', 1, 0),
(3, 'Valdis', '2021-05-17 22:54:05', 2, 0),
(4, 'Brisa', '2021-05-17 22:54:05', 2, 0),
(5, 'Camarao', '2021-05-17 22:54:05', 3, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `dpto`
--
ALTER TABLE `dpto`
  ADD PRIMARY KEY (`id_dpto`);

--
-- Índices para tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_dpto` (`id_dpto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_vendedor` (`id_vendedor`);

--
-- Índices para tabela `pedido_item`
--
ALTER TABLE `pedido_item`
  ADD PRIMARY KEY (`id_pedido_item`),
  ADD KEY `id_item` (`id_item`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Índices para tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_vendedor`),
  ADD KEY `id_dpto` (`id_dpto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `dpto`
--
ALTER TABLE `dpto`
  MODIFY `id_dpto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pedido_item`
--
ALTER TABLE `pedido_item`
  MODIFY `id_pedido_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_dpto`) REFERENCES `dpto` (`id_dpto`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id_vendedor`);

--
-- Limitadores para a tabela `pedido_item`
--
ALTER TABLE `pedido_item`
  ADD CONSTRAINT `pedido_item_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`),
  ADD CONSTRAINT `pedido_item_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Limitadores para a tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`id_dpto`) REFERENCES `dpto` (`id_dpto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
