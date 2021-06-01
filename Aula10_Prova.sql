-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Jun-2021 às 02:28
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
-- Banco de dados: `aula10_prova`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `automovel`
--

CREATE TABLE `automovel` (
  `id` int(11) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `cor` varchar(45) DEFAULT NULL,
  `id_tipo_veiculo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `automovel`
--

INSERT INTO `automovel` (`id`, `marca`, `modelo`, `ano`, `cor`, `id_tipo_veiculo`) VALUES
(1, 'Mercedes Benz', 'A0001', 2021, 'Preto', 1),
(2, 'Chevrollete', 'A0002', 2021, 'Preto', 2),
(3, 'Volkwagen', 'A0003', 2021, 'Preto', 3),
(4, 'Bugati', 'A0004', 2021, 'Preto', 4),
(5, 'BMW', 'A0005', 2021, 'Preto', 1),
(6, 'Tesla', 'A0006', 2021, 'Preto', 2),
(7, 'Volvo ', 'A0007', 2021, 'Preto', 3),
(8, 'Renault', 'A0008', 2021, 'Preto', 4),
(9, 'Ford', 'A0009', 2021, 'Preto', 1),
(10, 'Ferrari', 'A0010', 2021, 'Preto', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id`, `nome`, `id_estado`) VALUES
(1, 'Blumenau', 1),
(2, 'Florianopolis', 1),
(3, 'Curitiba', 2),
(4, 'Uião da Vitória', 2),
(5, 'Jorgina', 3),
(6, 'Capotaria', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `id_endereco` int(11) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `cpf` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `celular`, `id_endereco`, `sexo`, `cpf`) VALUES
(1, 'Jorge', '(11) 1 1111-1111', 1, 'M', 11111111111),
(2, 'Joana', '(22) 2 2222-2222', 2, 'F', 22222222222),
(3, 'Ana', '(33) 3 3333-3333', 3, 'F', 33333333333),
(4, 'Joaquim', '(44) 4 4444-4444', 4, 'M', 44444444444),
(5, 'Roberto', '(55) 5 5555-5555', 5, 'M', 55555555555),
(6, 'Sergio', '(66) 6 6666-6666', 6, 'M', 66666666666),
(7, 'Luana', '(77) 7 7777-7777', 7, 'F', 77777777777),
(8, 'Maria', '(88) 8 8888-8888', 8, 'F', 88888888888),
(9, 'Rebeca', '(99) 9 9999-9999', 9, 'F', 99999999999),
(10, 'João', '(00) 0 0000-0000', 10, 'M', 10000110101);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id` int(11) NOT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `id_cidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id`, `rua`, `numero`, `complemento`, `bairro`, `id_cidade`) VALUES
(1, 'Rua Teresopolis', 100, 'casa', 'Itoupava Seca', 1),
(2, 'Rua Nagara', 101, 'casa', 'Flores', 2),
(3, 'Rua Curitibanos', 102, 'casa', 'Curita', 3),
(4, 'Rua Dom Pedro', 103, 'casa', 'Vitoria', 4),
(5, 'Rua Rebeldia', 104, 'casa', 'Rendondo', 5),
(6, 'Rua Capote', 105, 'casa', 'Caruari', 6),
(7, 'Rua São Paulo', 106, 'casa', 'Centro', 1),
(8, 'Rua Foncesa', 107, 'casa', 'Centro', 2),
(9, 'Rua Anapolis', 108, 'casa', 'Centro', 3),
(10, 'Rua Alves', 109, 'casa', 'Centro', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`id`, `nome`) VALUES
(1, 'SC'),
(2, 'PR'),
(3, 'RS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `locacao`
--

CREATE TABLE `locacao` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `data` datetime DEFAULT current_timestamp(),
  `quilometro_atual` float DEFAULT NULL,
  `quilometro_final` float DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `id_automovel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `locacao`
--

INSERT INTO `locacao` (`id`, `id_cliente`, `data`, `quilometro_atual`, `quilometro_final`, `descricao`, `id_automovel`) VALUES
(1, 1, '2021-05-31 20:21:40', 1, 11, 'Limpo', 1),
(2, 2, '2021-05-31 20:21:40', 1, 20, 'Limpo', 2),
(3, 3, '2021-05-31 20:21:40', 1, 15, 'Limpo', 3),
(4, 4, '2021-05-31 20:21:40', 1, 11, 'Limpo', 4),
(5, 5, '2021-05-31 20:21:40', 1, 10, 'Limpo', 5),
(6, 6, '2021-05-31 20:21:40', 1, 50, 'Limpo', 6),
(7, 7, '2021-05-31 20:21:40', 1, 55, 'Limpo', 7),
(8, 8, '2021-05-31 20:21:40', 1, 100, 'Limpo', 8),
(9, 9, '2021-05-31 20:21:40', 1, 55, 'Limpo', 9),
(10, 10, '2021-05-31 20:21:40', 1, 40, 'Limpo', 10),
(11, 1, '2021-05-31 20:21:40', 1, 30, 'Limpo', 1),
(12, 2, '2021-05-31 20:21:40', 1, 90, 'Limpo', 2),
(13, 3, '2021-05-31 20:21:40', 1, 80, 'Limpo', 3),
(14, 4, '2021-05-31 20:21:40', 1, 101, 'Limpo', 4),
(15, 5, '2021-05-31 20:21:40', 1, 15, 'Limpo', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_veiculo`
--

CREATE TABLE `tipo_veiculo` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_veiculo`
--

INSERT INTO `tipo_veiculo` (`id`, `nome`) VALUES
(1, 'Passeio 1.0'),
(2, 'Passeio 1.6+'),
(3, 'Utilitário'),
(4, 'Van');

-- --------------------------------------------------------

--
-- Estrutura da tabela `valor_quilometro`
--

CREATE TABLE `valor_quilometro` (
  `id` int(11) NOT NULL,
  `codigo` int(11) DEFAULT NULL,
  `valor_quilometro_rodado` float DEFAULT NULL,
  `id_tipo_veiculo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `valor_quilometro`
--

INSERT INTO `valor_quilometro` (`id`, `codigo`, `valor_quilometro_rodado`, `id_tipo_veiculo`) VALUES
(1, 1, 0.3, 1),
(2, 2, 0.5, 2),
(3, 3, 1.1, 3),
(4, 4, 1.3, 4);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `automovel`
--
ALTER TABLE `automovel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_atmv_tipo_veiculo` (`id_tipo_veiculo`);

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cdde_estado` (`id_estado`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clnt_endereco` (`id_endereco`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_edrc_cidade` (`id_cidade`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `locacao`
--
ALTER TABLE `locacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_lcao_automovel` (`id_automovel`),
  ADD KEY `fk_lcao_cliente` (`id_cliente`);

--
-- Índices para tabela `tipo_veiculo`
--
ALTER TABLE `tipo_veiculo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `valor_quilometro`
--
ALTER TABLE `valor_quilometro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vlquil_tipo_veiculo` (`id_tipo_veiculo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `automovel`
--
ALTER TABLE `automovel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `locacao`
--
ALTER TABLE `locacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tipo_veiculo`
--
ALTER TABLE `tipo_veiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `valor_quilometro`
--
ALTER TABLE `valor_quilometro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `automovel`
--
ALTER TABLE `automovel`
  ADD CONSTRAINT `fk_atmv_tipo_veiculo` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tipo_veiculo` (`id`);

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_cdde_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_clnt_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id`);

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `fk_edrc_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id`);

--
-- Limitadores para a tabela `locacao`
--
ALTER TABLE `locacao`
  ADD CONSTRAINT `fk_lcao_automovel` FOREIGN KEY (`id_automovel`) REFERENCES `automovel` (`id`),
  ADD CONSTRAINT `fk_lcao_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);

--
-- Limitadores para a tabela `valor_quilometro`
--
ALTER TABLE `valor_quilometro`
  ADD CONSTRAINT `fk_vlquil_tipo_veiculo` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tipo_veiculo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
