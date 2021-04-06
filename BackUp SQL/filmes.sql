-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Abr-2021 às 03:02
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
-- Estrutura da tabela `categorias_filmes`
--

CREATE TABLE `categorias_filmes` (
  `id_categoria_filme` int(11) NOT NULL,
  `id_filme` int(11) NOT NULL,
  `id_tipo_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categorias_filmes`
--

INSERT INTO `categorias_filmes` (`id_categoria_filme`, `id_filme`, `id_tipo_categoria`) VALUES
(7, 1, 1),
(8, 1, 2),
(9, 1, 3),
(10, 5, 3),
(11, 5, 1),
(12, 5, 4);

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
  `id_tipo_filme` int(11) NOT NULL,
  `id_classificacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `filme`
--

INSERT INTO `filme` (`id_filme`, `nome`, `descricao`, `duracao`, `data_lancamento`, `fg_lancamento`, `avaliacao`, `id_tipo_filme`, `id_classificacao`) VALUES
(1, 'Vingadores', 'Filme de luta', '03:00', '2020-10-10 00:00:00', 0, 9.5, 1, 2),
(5, 'The Walking Dead', 'Apocalipse Zumbi', '00:50', '2021-10-10 00:00:00', 1, 8, 5, 4),
(6, 'Cosmo', 'Ficção, Científico', '02:00', '2015-05-05 00:00:00', 0, 9, 2, 3),
(7, 'Minions', 'Animação dos Minions', '02:00', '2021-01-12 00:00:00', 1, 9, 3, 1),
(8, 'Dragon Ball', 'Aventuras do Goku batendo em geral', '20:00', '1995-05-16 00:00:00', 0, 10, 4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_categoria`
--

CREATE TABLE `tipo_categoria` (
  `id_tipo_categoria` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tipo_categoria`
--

INSERT INTO `tipo_categoria` (`id_tipo_categoria`, `nome`) VALUES
(1, 'Ação'),
(2, 'Aventura'),
(3, 'Ficção'),
(4, 'Fantasia'),
(5, 'Animação'),
(6, 'Comédia'),
(7, 'Anime');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_classificacao`
--

CREATE TABLE `tipo_classificacao` (
  `id_classificacao` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tipo_classificacao`
--

INSERT INTO `tipo_classificacao` (`id_classificacao`, `nome`, `descricao`) VALUES
(1, 'Livre', 'Qualquer um pode assistir'),
(2, '12+', 'Acima de 12 anos'),
(3, '16+', 'Acima de 16 anos'),
(4, '18+', 'Acima de 18 anos');

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
-- Índices para tabela `categorias_filmes`
--
ALTER TABLE `categorias_filmes`
  ADD PRIMARY KEY (`id_categoria_filme`),
  ADD KEY `id_tipo_categoria` (`id_tipo_categoria`),
  ADD KEY `id_filme` (`id_filme`);

--
-- Índices para tabela `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`id_filme`),
  ADD KEY `id_tipo_filme` (`id_tipo_filme`),
  ADD KEY `id_classificacao` (`id_classificacao`);

--
-- Índices para tabela `tipo_categoria`
--
ALTER TABLE `tipo_categoria`
  ADD PRIMARY KEY (`id_tipo_categoria`);

--
-- Índices para tabela `tipo_classificacao`
--
ALTER TABLE `tipo_classificacao`
  ADD PRIMARY KEY (`id_classificacao`);

--
-- Índices para tabela `tipo_filme`
--
ALTER TABLE `tipo_filme`
  ADD PRIMARY KEY (`id_tipo_filme`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias_filmes`
--
ALTER TABLE `categorias_filmes`
  MODIFY `id_categoria_filme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `filme`
--
ALTER TABLE `filme`
  MODIFY `id_filme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tipo_categoria`
--
ALTER TABLE `tipo_categoria`
  MODIFY `id_tipo_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tipo_classificacao`
--
ALTER TABLE `tipo_classificacao`
  MODIFY `id_classificacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipo_filme`
--
ALTER TABLE `tipo_filme`
  MODIFY `id_tipo_filme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categorias_filmes`
--
ALTER TABLE `categorias_filmes`
  ADD CONSTRAINT `categorias_filmes_ibfk_1` FOREIGN KEY (`id_tipo_categoria`) REFERENCES `tipo_categoria` (`id_tipo_categoria`),
  ADD CONSTRAINT `categorias_filmes_ibfk_2` FOREIGN KEY (`id_filme`) REFERENCES `filme` (`id_filme`);

--
-- Limitadores para a tabela `filme`
--
ALTER TABLE `filme`
  ADD CONSTRAINT `filme_ibfk_1` FOREIGN KEY (`id_tipo_filme`) REFERENCES `tipo_filme` (`id_tipo_filme`),
  ADD CONSTRAINT `filme_ibfk_3` FOREIGN KEY (`id_classificacao`) REFERENCES `tipo_classificacao` (`id_classificacao`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
