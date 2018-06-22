-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20-Jun-2018 às 14:56
-- Versão do servidor: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cleianec_refeitorio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '4', 1527820241),
('discente', '2', 1529098287),
('discente', '31', 1529099881),
('discente', '34', 1529070347),
('nutricionista', '29', 1528829178),
('nutricionista', '3', 1529100311);

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('addPost', 2, 'Add a post', NULL, NULL, 1527819967, 1527819967),
('admin', 1, NULL, 'userGroup', NULL, 1527819968, 1527819968),
('deletePost', 2, 'Delete a post', NULL, NULL, 1527819967, 1527819967),
('discente', 1, NULL, 'userGroup', NULL, 1527819968, 1527819968),
('editPost', 2, 'Edit a post', NULL, NULL, 1527819967, 1527819967),
('indexPost', 2, 'Index a post', NULL, NULL, 1527819967, 1527819967),
('nutricionista', 1, NULL, 'userGroup', NULL, 1527819968, 1527819968),
('viewPost', 2, 'View a post', NULL, NULL, 1527819967, 1527819967);

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'addPost'),
('discente', 'addPost'),
('nutricionista', 'addPost'),
('admin', 'deletePost'),
('nutricionista', 'deletePost'),
('admin', 'editPost'),
('nutricionista', 'editPost'),
('admin', 'indexPost'),
('admin', 'viewPost'),
('discente', 'viewPost'),
('nutricionista', 'viewPost');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('userGroup', 0x4f3a32323a226170705c726261635c5573657247726f757052756c65223a333a7b733a343a226e616d65223b733a393a227573657247726f7570223b733a393a22637265617465644174223b693a313532373831393936373b733a393a22757064617465644174223b693a313532373831393936373b7d, 1527819967, 1527819967);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cardapio`
--

CREATE TABLE `cardapio` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `descricao` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `descricao`) VALUES
(2, 'Carnes'),
(6, 'Grãos'),
(7, 'Laticínios'),
(8, 'Frios'),
(11, 'Cereais'),
(12, 'Hortaliças'),
(13, 'Codimentos e temperos'),
(14, 'Verduras'),
(15, 'Legumes'),
(16, 'Frutas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE `contrato` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `unidade_id` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `qtde` double NOT NULL,
  `valoruni` double NOT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contrato`
--

INSERT INTO `contrato` (`id`, `numero`, `produto_id`, `unidade_id`, `marca`, `qtde`, `valoruni`, `fornecedor_id`, `data`) VALUES
(1, 22018, 6, 1, 'Frial', 200, 8.99, 1, '2018-06-23'),
(2, 8888, 2, 3, 'Frial', 200, 8.99, 2, '2018-06-07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `qtde` int(11) NOT NULL,
  `tipolanc` varchar(10) NOT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `numero` int(6) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `isAtivo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id`, `nome`, `email`, `telefone`, `cnpj`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `isAtivo`) VALUES
(1, 'Caribé', 'caribe@gmail.com', '(87)98638-2672', '43.567.890/8765-43', 'Rua Central', 54, '', 'Centro', 'Januária', 'Minas Gerais', 1),
(2, 'Center Frios ltda', 'center.frios@gmail.com', '(56)46534-5324', '43.677.899/6535-43', 'Rua do sertanejo', 876, 'Loja', 'Centro', 'Januária', 'Minas Gerais', 1),
(3, 'Pão de Mel', 'paodemel@gmail.com', '(92)39817-3655', '09.893.724/4444-44', 'Av. Conego Ramiro Leite', 730, 'Loja', 'Centro', 'Januária', 'Minas Gerais', 1),
(4, 'teste', 'teste@gmail.com', '(98)49757-8436', '08.973.456/2744-44', 'Rua C', 32, '', 'Centro', 'teste', 'Minas Gerais', 0),
(5, 'gkjkhsdgvv', 'djf@gmail.com', '(98)74637-2222', '08.437.576/4753-74', 'a', 43, '', 'cs', 'cddf', 'Paraná', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `conteudo` text NOT NULL,
  `data` date DEFAULT NULL,
  `imageFile` blob,
  `isAtivo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `conteudo`, `data`, `imageFile`, `isAtivo`) VALUES
(3, 'hjgjhsda', 'jkghjgvjhgdjf hkjahkjdshgkj', '2018-04-03', 0x7e735677353930302e6a7067, 0),
(4, 'jhgjgjhcv', 'dffvsdfgvdf', '2018-04-03', 0x7e735677353930302e6a7067, 0),
(23, 'mjhgbxcvm', 'jhgdhfjjjjjjjjjjjgsdah', '2018-04-11', 0x7e735677353930302e6a7067, 0),
(27, 'iiiiiiiiiiiiiiiiiiiiiiiii', 'jhgdhfjjjjjjjjjjjgsdah', '2018-04-11', 0x7e735677353930302e6a7067, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `prato`
--

CREATE TABLE `prato` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `prato`
--

INSERT INTO `prato` (`id`, `descricao`) VALUES
(1, 'Feijão tropeiro'),
(2, 'Arroz'),
(4, 'Salada'),
(5, 'Bife'),
(12, 'Macarronada'),
(18, 'Macarrão de panela');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prato_cardapio`
--

CREATE TABLE `prato_cardapio` (
  `id` int(11) NOT NULL,
  `prato_id` int(11) DEFAULT NULL,
  `cardapio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `unidade_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `descricao`, `categoria_id`, `unidade_id`) VALUES
(1, 'Biscoito', 11, 2),
(2, 'Carne ', 2, 1),
(3, 'Arroz', 6, 1),
(4, 'Feijão', 6, 1),
(5, 'Alface', 12, 1),
(6, 'Frango', 8, 1),
(7, 'Leite', 7, 2),
(8, 'Cenoura', 15, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_contrato`
--

CREATE TABLE `produto_contrato` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `contrato_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_prato`
--

CREATE TABLE `produto_prato` (
  `id` int(11) NOT NULL,
  `prato_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `percapita` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto_prato`
--

INSERT INTO `produto_prato` (`id`, `prato_id`, `produto_id`, `percapita`) VALUES
(26, NULL, 3, NULL),
(27, NULL, 3, NULL),
(28, 20, 5, 1),
(29, 21, 3, 1),
(30, 22, 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `refeicao`
--

CREATE TABLE `refeicao` (
  `id` int(11) NOT NULL,
  `descricao` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `refeicao`
--

INSERT INTO `refeicao` (`id`, `descricao`) VALUES
(1, 'Almoço'),
(2, 'Café da manhã'),
(3, 'Janta'),
(4, 'Lanche da tarde');

-- --------------------------------------------------------

--
-- Estrutura da tabela `refeicao_prato`
--

CREATE TABLE `refeicao_prato` (
  `id` int(11) NOT NULL,
  `prato_id` int(11) DEFAULT NULL,
  `refeicao_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sugestoes`
--

CREATE TABLE `sugestoes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `verifyCode` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `unidade`
--

CREATE TABLE `unidade` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `unidade`
--

INSERT INTO `unidade` (`id`, `descricao`) VALUES
(1, 'KG'),
(2, 'Caixa'),
(3, 'Fardo'),
(4, 'Litro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `numero` int(6) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `role` varchar(30) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `isAtivo` tinyint(1) NOT NULL DEFAULT '0',
  `codVerificacao` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `email`, `telefone`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `role`, `password_hash`, `isAtivo`, `codVerificacao`) VALUES
(2, 'discente', '637.544.375-67', 'discente@gmail.com', '(87)23666-4656', 'Rua Bahia', 765, '', 'Centro', 'Itacarambi', 'Minas Gerais', '3', '$2y$13$PWBTZHZ7ga0K9Ui851ovc.yOPrin2vgUveWoOcWrkSAzipBH40sQi', 1, '0'),
(3, 'Nutricionista', '989.371.583-65', 'nutricionista@gmail.com', '(98)73896-1875', 'Rua Tal', 90, '', 'Centro', 'Januária', 'Minas Gerais', '2', '$2y$13$yGk0lS3/lzCxGdRohr6VZOEpFq3pC3qWDd7UgTzhypel.2T4RY/3i', 1, '06cac183'),
(4, 'admin', '878.623.755-55', 'admin@gmail.com', '(38)09049-0387', 'Rua Bahia', 123, 'Casa', 'São José', 'Itacarambi', 'Minas Gerais', '1', '$2y$13$EMp3N4Qw/0Un01rYNpVwmOtd0lAnC4Dv61iedgYRmX5/L07xdUHIW', 1, '0'),
(34, 'monica', '089.479.877-80', 'monica@gmail.com', '', '', NULL, '', '', '', '', '3', '$2y$13$EQJe0Z8TQ5W9g6v5BOs4uuzFrbxx7F0PG59DV4HjPf.jr.gp.0ria', 1, '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `cardapio`
--
ALTER TABLE `cardapio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `unidade_id` (`unidade_id`),
  ADD KEY `fornecedor_id` (`fornecedor_id`);

--
-- Indexes for table `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Indexes for table `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prato`
--
ALTER TABLE `prato`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prato_cardapio`
--
ALTER TABLE `prato_cardapio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prato_id` (`prato_id`),
  ADD KEY `cardapio_id` (`cardapio_id`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `unidade_id` (`unidade_id`);

--
-- Indexes for table `produto_contrato`
--
ALTER TABLE `produto_contrato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `contrato_id` (`contrato_id`);

--
-- Indexes for table `produto_prato`
--
ALTER TABLE `produto_prato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prato_id` (`prato_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Indexes for table `refeicao`
--
ALTER TABLE `refeicao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refeicao_prato`
--
ALTER TABLE `refeicao_prato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prato_id` (`prato_id`),
  ADD KEY `refeicao_id` (`refeicao_id`);

--
-- Indexes for table `sugestoes`
--
ALTER TABLE `sugestoes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unidade`
--
ALTER TABLE `unidade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cardapio`
--
ALTER TABLE `cardapio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `estoque`
--
ALTER TABLE `estoque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `prato`
--
ALTER TABLE `prato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `prato_cardapio`
--
ALTER TABLE `prato_cardapio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `produto_contrato`
--
ALTER TABLE `produto_contrato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produto_prato`
--
ALTER TABLE `produto_prato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `refeicao`
--
ALTER TABLE `refeicao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `refeicao_prato`
--
ALTER TABLE `refeicao_prato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sugestoes`
--
ALTER TABLE `sugestoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unidade`
--
ALTER TABLE `unidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`unidade_id`) REFERENCES `unidade` (`id`),
  ADD CONSTRAINT `contrato_ibfk_3` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id`);

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`);

--
-- Limitadores para a tabela `prato_cardapio`
--
ALTER TABLE `prato_cardapio`
  ADD CONSTRAINT `prato_cardapio_ibfk_1` FOREIGN KEY (`cardapio_id`) REFERENCES `cardapio` (`id`),
  ADD CONSTRAINT `prato_cardapio_ibfk_2` FOREIGN KEY (`prato_id`) REFERENCES `prato` (`id`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`unidade_id`) REFERENCES `unidade` (`id`),
  ADD CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`);

--
-- Limitadores para a tabela `produto_contrato`
--
ALTER TABLE `produto_contrato`
  ADD CONSTRAINT `produto_contrato_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `produto_contrato_ibfk_2` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`);

--
-- Limitadores para a tabela `produto_prato`
--
ALTER TABLE `produto_prato`
  ADD CONSTRAINT `produto_prato_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `produto_prato_ibfk_2` FOREIGN KEY (`prato_id`) REFERENCES `prato` (`id`);

--
-- Limitadores para a tabela `refeicao_prato`
--
ALTER TABLE `refeicao_prato`
  ADD CONSTRAINT `refeicao_prato_ibfk_1` FOREIGN KEY (`prato_id`) REFERENCES `prato` (`id`),
  ADD CONSTRAINT `refeicao_prato_ibfk_2` FOREIGN KEY (`refeicao_id`) REFERENCES `refeicao` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
