-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Abr-2021 às 23:39
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
-- Banco de dados: `filmes`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `filme`
--

CREATE TABLE `filme` (
  `id_filme` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `duracao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_lancamento` datetime NOT NULL,
  `fg_lancamento` int(11) NOT NULL,
  `avaliacao` float NOT NULL,
  `id_tipo_filme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `filme`
--

INSERT INTO `filme` (`id_filme`, `nome`, `descricao`, `duracao`, `data_lancamento`, `fg_lancamento`, `avaliacao`, `id_tipo_filme`) VALUES
(1, 'Vingadores', 'Filme de luta', '03:00', '2020-10-10 00:00:00', 0, 9.5, 1),
(5, 'The Walking Dead', 'Apocalipse Zumbi', '00:50', '2021-10-10 00:00:00', 1, 8, 5),
(6, 'Cosmo', 'Ficção, Científico', '02:00', '2015-05-05 00:00:00', 0, 9, 2),
(7, 'Minions', 'Animação dos Minions', '02:00', '2021-01-12 00:00:00', 1, 9, 3),
(8, 'Dragon Ball', 'Aventuras do Goku batendo em geral', '20:00', '1995-05-16 00:00:00', 0, 10, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_filme`
--

CREATE TABLE `tipo_filme` (
  `id_tipo_filme` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tipo_filme`
--

INSERT INTO `tipo_filme` (`id_tipo_filme`, `nome`) VALUES
(1, 'Filme'),
(2, 'Documentário'),
(3, 'Animação'),
(4, 'Anime'),
(5, 'Série');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`id_filme`),
  ADD KEY `id_tipo_filme` (`id_tipo_filme`);

--
-- Índices para tabela `tipo_filme`
--
ALTER TABLE `tipo_filme`
  ADD PRIMARY KEY (`id_tipo_filme`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `filme`
--
ALTER TABLE `filme`
  MODIFY `id_filme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tipo_filme`
--
ALTER TABLE `tipo_filme`
  MODIFY `id_tipo_filme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `filme`
--
ALTER TABLE `filme`
  ADD CONSTRAINT `filme_ibfk_1` FOREIGN KEY (`id_tipo_filme`) REFERENCES `tipo_filme` (`id_tipo_filme`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
