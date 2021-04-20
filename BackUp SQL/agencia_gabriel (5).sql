-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Abr-2021 às 03:01
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
-- Banco de dados: `agencia_gabriel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `id_agencia` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`id_agencia`, `nome`, `cidade`, `bairro`) VALUES
(1, 'Nubank', 'São Paulo', 'itaquera'),
(2, 'Sicredi', 'Blumenau', 'centro'),
(3, 'Neon', 'Curitiba', 'zona sul');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` bigint(20) DEFAULT NULL,
  `rg` int(7) DEFAULT NULL,
  `telefone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_nasc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `cpf`, `rg`, `telefone`, `celular`, `data_nasc`) VALUES
(1, 'Juca', 12121212122, 3232323, '(99) 9 9999-9999', '(99) 9 9999-9999', '2000-12-14'),
(2, 'Zezinha', 45454545455, 5454544, '(00) 0 0000-0000', '(00) 0 0000-0000', '1999-11-13'),
(3, 'Joana', 78787878788, 6565656, '(11) 1 1111-1111', '(11) 1 1111-1111', '1998-10-12'),
(4, 'Ana', 89898989898, 9898988, '(22) 2 2222-2222', '(22) 2 2222-2222', '1997-09-11'),
(5, 'Samira', 32323232232, 7474747, '(33) 3 3333-3333', '(33) 3 3333-3333', '1996-08-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta_cliente`
--

CREATE TABLE `conta_cliente` (
  `id_conta_cliente` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_agencia` int(11) DEFAULT NULL,
  `id_tipo_conta` int(11) DEFAULT NULL,
  `saldo_cliente` double DEFAULT NULL,
  `conta_bancaria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `conta_cliente`
--

INSERT INTO `conta_cliente` (`id_conta_cliente`, `id_cliente`, `id_agencia`, `id_tipo_conta`, `saldo_cliente`, `conta_bancaria`) VALUES
(1, 1, 1, 1, 50000, 123456),
(2, 1, 2, 2, 5000, 123457),
(3, 2, 1, 1, 10000, 321654),
(4, 2, 2, 2, 1000, 321657),
(5, 3, 1, 1, 20000, 456789),
(6, 3, 2, 2, 2000, 456781),
(7, 4, 1, 1, 30000, 987654),
(8, 4, 2, 2, 3000, 987653),
(9, 5, 1, 2, 40000, 147258),
(10, 5, 2, 1, 4000, 147259);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionarios` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` bigint(20) DEFAULT NULL,
  `rg` int(7) DEFAULT NULL,
  `salario` double DEFAULT NULL,
  `cargo` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_agencia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionarios`, `nome`, `cpf`, `rg`, `salario`, `cargo`, `id_agencia`) VALUES
(1, 'Gabriel', 99999999999, 1000000, 10000, 'Programador', 1),
(2, 'Jorge', 10000000000, 5555555, 15000, 'Gerente', 1),
(3, 'Amanda', 33333333333, 1111111, 20000, 'CEO', 2),
(4, 'Maria', 77777777777, 2222222, 10000, 'Programador', 2),
(5, 'Samuel', 66666666666, 6666666, 5000, 'Atendente', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE `historico` (
  `id_historico` int(11) NOT NULL,
  `numero_transacao` int(11) DEFAULT NULL,
  `transacao` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` datetime DEFAULT current_timestamp(),
  `valor` double DEFAULT NULL,
  `saldo_atual` double DEFAULT NULL,
  `limite` double DEFAULT NULL,
  `id_tipo_transacao` int(11) DEFAULT NULL,
  `id_conta_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `historico`
--

INSERT INTO `historico` (`id_historico`, `numero_transacao`, `transacao`, `data`, `valor`, `saldo_atual`, `limite`, `id_tipo_transacao`, `id_conta_cliente`) VALUES
(1, 1, 'transa1', '2021-04-19 22:01:02', 100, 50000, 100000, 1, 1),
(2, 2, 'transa2', '2021-04-19 22:01:02', 200, 5000, 110000, 1, 2),
(3, 3, 'transa3', '2021-04-19 22:01:02', 300, 10000, 120000, 1, 3),
(4, 4, 'transa4', '2021-04-19 22:01:02', 400, 1000, 130000, 1, 4),
(5, 5, 'transa5', '2021-04-19 22:01:02', 500, 20000, 130000, 1, 5),
(6, 6, 'transa6', '2021-04-19 22:01:02', 500, 2000, 140000, 1, 6),
(7, 7, 'transa7', '2021-04-19 22:01:02', 700, 30000, 150000, 1, 7),
(8, 8, 'transa8', '2021-04-19 22:01:02', 800, 3000, 160000, 1, 8),
(9, 9, 'transa9', '2021-04-19 22:01:02', 900, 40000, 170000, 1, 9),
(10, 10, 'transa10', '2021-04-19 22:01:02', 1000, 4000, 180000, 1, 10),
(11, 11, 'transa11', '2021-04-19 22:01:02', 2000, 50000, 190000, 1, 1),
(12, 12, 'transa12', '2021-04-19 22:01:02', 3000, 5000, 100000, 1, 2),
(13, 13, 'transa13', '2021-04-19 22:01:02', 4000, 10000, 110000, 1, 3),
(14, 14, 'transa14', '2021-04-19 22:01:02', 5000, 1000, 120000, 1, 4),
(15, 15, 'transa15', '2021-04-19 22:01:02', 6000, 20000, 130000, 1, 5),
(16, 16, 'transa16', '2021-04-19 22:01:02', 7000, 2000, 130000, 1, 6),
(17, 17, 'transa17', '2021-04-19 22:01:02', 8000, 30000, 140000, 1, 7),
(18, 18, 'transa18', '2021-04-19 22:01:02', 9000, 3000, 150000, 1, 8),
(19, 19, 'transa19', '2021-04-19 22:01:02', 10000, 40000, 160000, 1, 9),
(20, 20, 'transa20', '2021-04-19 22:01:02', 11000, 4000, 170000, 1, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_conta`
--

CREATE TABLE `tipo_conta` (
  `id_tipo_conta` int(11) NOT NULL,
  `tipo_conta` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tipo_conta`
--

INSERT INTO `tipo_conta` (`id_tipo_conta`, `tipo_conta`) VALUES
(1, 'conta corrente'),
(2, 'conta poupança');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_transacao`
--

CREATE TABLE `tipo_transacao` (
  `id_tipo_transacao` int(11) NOT NULL,
  `tipo_transacao` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tipo_transacao`
--

INSERT INTO `tipo_transacao` (`id_tipo_transacao`, `tipo_transacao`) VALUES
(1, 'depósito'),
(2, 'saque'),
(3, 'transferência');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`id_agencia`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `conta_cliente`
--
ALTER TABLE `conta_cliente`
  ADD PRIMARY KEY (`id_conta_cliente`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_agencia` (`id_agencia`),
  ADD KEY `id_tipo_conta` (`id_tipo_conta`),
  ADD KEY `id_conta_bancaria` (`conta_bancaria`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionarios`),
  ADD KEY `id_agencia` (`id_agencia`);

--
-- Índices para tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`id_historico`),
  ADD KEY `id_tipo_transacao` (`id_tipo_transacao`),
  ADD KEY `id_conta_cliente` (`id_conta_cliente`);

--
-- Índices para tabela `tipo_conta`
--
ALTER TABLE `tipo_conta`
  ADD PRIMARY KEY (`id_tipo_conta`);

--
-- Índices para tabela `tipo_transacao`
--
ALTER TABLE `tipo_transacao`
  ADD PRIMARY KEY (`id_tipo_transacao`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agencia`
--
ALTER TABLE `agencia`
  MODIFY `id_agencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `conta_cliente`
--
ALTER TABLE `conta_cliente`
  MODIFY `id_conta_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `id_historico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `tipo_conta`
--
ALTER TABLE `tipo_conta`
  MODIFY `id_tipo_conta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tipo_transacao`
--
ALTER TABLE `tipo_transacao`
  MODIFY `id_tipo_transacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `conta_cliente`
--
ALTER TABLE `conta_cliente`
  ADD CONSTRAINT `conta_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `conta_cliente_ibfk_2` FOREIGN KEY (`id_agencia`) REFERENCES `agencia` (`id_agencia`),
  ADD CONSTRAINT `conta_cliente_ibfk_3` FOREIGN KEY (`id_tipo_conta`) REFERENCES `tipo_conta` (`id_tipo_conta`);

--
-- Limitadores para a tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`id_agencia`) REFERENCES `agencia` (`id_agencia`);

--
-- Limitadores para a tabela `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`id_tipo_transacao`) REFERENCES `tipo_transacao` (`id_tipo_transacao`),
  ADD CONSTRAINT `historico_ibfk_2` FOREIGN KEY (`id_conta_cliente`) REFERENCES `conta_cliente` (`id_conta_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
