-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Abr-2021 às 01:01
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
-- Banco de dados: aula6_prova
--

-- --------------------------------------------------------

--
-- Estrutura da tabela estoque
--

CREATE TABLE estoque (
  id_estoque int(11) NOT NULL,
  id_produtos int(11) DEFAULT NULL,
  quantidade int(11) DEFAULT NULL,
  id_lote int(11) DEFAULT NULL,
  valor float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela estoque
--

INSERT INTO estoque (id_estoque, id_produtos, quantidade, id_lote, valor) VALUES
(1, 1, 100, 1, 85000),
(2, 1, 200, 1, 170000),
(3, 2, 100, 2, 50000),
(4, 2, 200, 2, 100000),
(5, 3, 100, 3, 60000),
(6, 3, 200, 3, 120000),
(7, 4, 100, 4, 25000),
(8, 4, 200, 4, 50000),
(9, 5, 100, 5, 145000),
(10, 5, 200, 5, 290000);

-- --------------------------------------------------------

--
-- Estrutura da tabela fornecedores
--

CREATE TABLE fornecedores (
  id_fornecedores int(11) NOT NULL,
  nome varchar(45) DEFAULT NULL,
  telefone varchar(16) DEFAULT NULL,
  email varchar(100) DEFAULT NULL,
  cnpj bigint(20) DEFAULT NULL,
  rua varchar(150) DEFAULT NULL,
  bairro varchar(100) DEFAULT NULL,
  cidade varchar(100) DEFAULT NULL,
  cep bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela fornecedores
--

INSERT INTO fornecedores (id_fornecedores, nome, telefone, email, cnpj, rua, bairro, cidade, cep) VALUES
(1, 'HyperX', '(99) 9 9999-9999', 'hyperx@email.com', 77777777777, 'R. jorge', 'Jorge', 'Blumenau', 87451445),
(2, 'Logitech G', '(88) 8 8888-8888', 'logitech@email.com', 55555555555, 'R. jaoquim', 'Joaquim', 'Blumenau', 84563214),
(3, 'X-RAY', '(77) 7 7777-7777', 'xray@email.com', 22222222222, 'R. sergio', 'Sergio', 'Blumenau', 86592444),
(4, 'ASUS', '(66) 6 6666-6666', 'asus@email.com', 66666666666, 'R. Tobias', 'Tobias', 'Blumenau', 85621477);

-- --------------------------------------------------------

--
-- Estrutura da tabela funcionario
--

CREATE TABLE funcionario (
  id_funcionario int(11) NOT NULL,
  nome varchar(45) DEFAULT NULL,
  cargo varchar(45) DEFAULT NULL,
  data_admisssao datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela funcionario
--

INSERT INTO funcionario (id_funcionario, nome, cargo, data_admisssao) VALUES
(1, 'Joaquim', 'Gerente', '2021-04-26 19:40:46'),
(2, 'Sergio', 'Administrador', '2021-04-26 19:40:46'),
(3, 'Jorge', 'Atendente', '2021-04-26 19:40:46'),
(4, 'Samuel', 'Programador', '2021-04-26 19:40:46'),
(5, 'Junior', 'Estagiario', '2021-04-26 19:40:46');

-- --------------------------------------------------------

--
-- Estrutura da tabela lote
--

CREATE TABLE lote (
  id_lote int(11) NOT NULL,
  nome varchar(45) DEFAULT NULL,
  codigo varchar(16) DEFAULT NULL,
  id_fornecedores int(11) DEFAULT NULL,
  data_cadastro datetime DEFAULT current_timestamp(),
  id_funcionario int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela lote
--

INSERT INTO lote (id_lote, nome, codigo, id_fornecedores, data_cadastro, id_funcionario) VALUES
(1, 'Lote Logitech Mouse Superlight', 'LOGIG78965', 2, '2021-04-26 19:50:31', 1),
(2, 'Lote Logitech Carbon 13', 'LOGIG32658', 2, '2021-04-26 19:50:31', 2),
(3, 'Lote HyperX Cloud Alpha S', 'HPX25698', 1, '2021-04-26 19:50:31', 3),
(4, 'Lote X-RAY Aqual Control Plus', 'XRA23698', 3, '2021-04-26 19:50:31', 4),
(5, 'Lote ASUS Monitor 165hz', 'ASUS26984', 4, '2021-04-26 19:50:31', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela produtos
--

CREATE TABLE produtos (
  id_produtos int(11) NOT NULL,
  nome varchar(45) DEFAULT NULL,
  descricao varchar(200) DEFAULT NULL,
  data_cadastro datetime DEFAULT current_timestamp(),
  peso float DEFAULT NULL,
  categoria varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela produtos
--

INSERT INTO produtos (id_produtos, nome, descricao, data_cadastro, peso, categoria) VALUES
(1, 'Mouse Superligth', 'Lotitech G', '2021-04-26 19:39:15', 0.6, 'Gamer'),
(2, 'Keyboard Carbom 13', 'Lotitech G', '2021-04-26 19:39:15', 2, 'Gamer'),
(3, 'HyperX Cloud Alpha S Blackout', 'HyperX', '2021-04-26 19:39:15', 1, 'Gamer'),
(4, 'Aqual Control Plus+', 'X-RAY MousePad 50x50mm', '2021-04-26 19:39:15', 0.5, 'Gamer'),
(5, 'Monitor Asus', 'Asus 165hz 0.5ms', '2021-04-26 19:39:15', 3, 'Gamer');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela estoque
--
ALTER TABLE estoque
  ADD PRIMARY KEY (id_estoque),
  ADD KEY id_produtos (id_produtos),
  ADD KEY id_lote (id_lote);

--
-- Índices para tabela fornecedores
--
ALTER TABLE fornecedores
  ADD PRIMARY KEY (id_fornecedores);

--
-- Índices para tabela funcionario
--
ALTER TABLE funcionario
  ADD PRIMARY KEY (id_funcionario);

--
-- Índices para tabela lote
--
ALTER TABLE lote
  ADD PRIMARY KEY (id_lote),
  ADD KEY id_fornecedores (id_fornecedores),
  ADD KEY id_funcionario (id_funcionario);

--
-- Índices para tabela produtos
--
ALTER TABLE produtos
  ADD PRIMARY KEY (id_produtos);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela estoque
--
ALTER TABLE estoque
  MODIFY id_estoque int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela fornecedores
--
ALTER TABLE fornecedores
  MODIFY id_fornecedores int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela funcionario
--
ALTER TABLE funcionario
  MODIFY id_funcionario int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela lote
--
ALTER TABLE lote
  MODIFY id_lote int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela produtos
--
ALTER TABLE produtos
  MODIFY id_produtos int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela estoque
--
ALTER TABLE estoque
  ADD CONSTRAINT estoque_ibfk_1 FOREIGN KEY (id_produtos) REFERENCES produtos (id_produtos),
  ADD CONSTRAINT estoque_ibfk_2 FOREIGN KEY (id_lote) REFERENCES lote (id_lote);

--
-- Limitadores para a tabela lote
--
ALTER TABLE lote
  ADD CONSTRAINT lote_ibfk_1 FOREIGN KEY (id_fornecedores) REFERENCES fornecedores (id_fornecedores),
  ADD CONSTRAINT lote_ibfk_2 FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
