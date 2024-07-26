-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/07/2024 às 18:38
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `petroeye_monitoring`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `dados_anp`
--

CREATE TABLE `dados_anp` (
  `id` int(11) NOT NULL,
  `POCO` varchar(255) DEFAULT NULL,
  `CADASTRO` varchar(255) DEFAULT NULL,
  `OPERADOR` varchar(255) DEFAULT NULL,
  `POCO_OPERADOR` varchar(255) DEFAULT NULL,
  `ESTADO` varchar(255) DEFAULT NULL,
  `BACIA` varchar(255) DEFAULT NULL,
  `BLOCO` varchar(255) DEFAULT NULL,
  `SIG_CAMPO` varchar(255) DEFAULT NULL,
  `CAMPO` varchar(255) DEFAULT NULL,
  `TERRA_MAR` varchar(255) DEFAULT NULL,
  `POCO_POS_ANP` varchar(255) DEFAULT NULL,
  `TIPO` varchar(255) DEFAULT NULL,
  `CATEGORIA` varchar(255) DEFAULT NULL,
  `RECLASSIFICACAO` varchar(255) DEFAULT NULL,
  `SITUACAO` varchar(255) DEFAULT NULL,
  `INICIO` date DEFAULT NULL,
  `TERMINO` date DEFAULT NULL,
  `CONCLUSAO` date DEFAULT NULL,
  `TITULARIDADE` varchar(255) DEFAULT NULL,
  `LATITUDE_BASE_4C` varchar(255) DEFAULT NULL,
  `LONGITUDE_BASE_4C` varchar(255) DEFAULT NULL,
  `LATITUDE_BASE_DD` varchar(255) DEFAULT NULL,
  `LONGITUDE_BASE_DD` varchar(255) DEFAULT NULL,
  `DATUM_HORIZONTAL` varchar(255) DEFAULT NULL,
  `TIPO_DE_COORDENADA_DE_BASE` varchar(255) DEFAULT NULL,
  `DIRECAO` varchar(255) DEFAULT NULL,
  `PROFUNDIDADE_VERTICAL_M` varchar(255) DEFAULT NULL,
  `PROFUNDIDADE_SONDADOR_M` varchar(255) DEFAULT NULL,
  `PROFUNDIDADE_MEDIDA_M` varchar(255) DEFAULT NULL,
  `REFERENCIA_DE_PROFUNDIDADE` varchar(255) DEFAULT NULL,
  `MESA_ROTATIVA` varchar(255) DEFAULT NULL,
  `COTA_ALTIMETRICA_M` varchar(255) DEFAULT NULL,
  `LAMINA_D_AGUA_M` varchar(255) DEFAULT NULL,
  `DATUM_VERTICAL` varchar(255) DEFAULT NULL,
  `UNIDADE_ESTRATIGRAFICA` varchar(255) DEFAULT NULL,
  `GEOLOGIA_GRUPO_FINAL` varchar(255) DEFAULT NULL,
  `GEOLOGIA_FORMACAO_FINAL` varchar(255) DEFAULT NULL,
  `GEOLOGIA_MEMBRO_FINAL` varchar(255) DEFAULT NULL,
  `CDPE` varchar(255) DEFAULT NULL,
  `AGP` varchar(255) DEFAULT NULL,
  `PC` varchar(255) DEFAULT NULL,
  `PAG` varchar(255) DEFAULT NULL,
  `PERFIS_CONVENCIONAIS` varchar(255) DEFAULT NULL,
  `DURANTE_PERFURACAO` varchar(255) DEFAULT NULL,
  `PERFIS_DIGITAIS` varchar(255) DEFAULT NULL,
  `PERFIS_PROCESSADOS` varchar(255) DEFAULT NULL,
  `PERFIS_ESPECIAIS` varchar(255) DEFAULT NULL,
  `AMOSTRA_LATERAL` varchar(255) DEFAULT NULL,
  `SISMICA` varchar(255) DEFAULT NULL,
  `TABELA_TEMPO_PROFUNDIDADE` varchar(255) DEFAULT NULL,
  `DADOS_DIRECIONAIS` varchar(255) DEFAULT NULL,
  `TESTE_A_CABO` varchar(255) DEFAULT NULL,
  `TESTE_DE_FORMACAO` varchar(255) DEFAULT NULL,
  `CANHONEIO` varchar(255) DEFAULT NULL,
  `TESTEMUNHO` varchar(255) DEFAULT NULL,
  `GEOQUIMICA` varchar(255) DEFAULT NULL,
  `SIG_SONDA` varchar(255) DEFAULT NULL,
  `NOM_SONDA` varchar(255) DEFAULT NULL,
  `ATINGIU_PRESAL` varchar(255) DEFAULT NULL,
  `DHA_ATUALIZACAO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dados_anp`
--

INSERT INTO `dados_anp` (`id`, `POCO`, `CADASTRO`, `OPERADOR`, `POCO_OPERADOR`, `ESTADO`, `BACIA`, `BLOCO`, `SIG_CAMPO`, `CAMPO`, `TERRA_MAR`, `POCO_POS_ANP`, `TIPO`, `CATEGORIA`, `RECLASSIFICACAO`, `SITUACAO`, `INICIO`, `TERMINO`, `CONCLUSAO`, `TITULARIDADE`, `LATITUDE_BASE_4C`, `LONGITUDE_BASE_4C`, `LATITUDE_BASE_DD`, `LONGITUDE_BASE_DD`, `DATUM_HORIZONTAL`, `TIPO_DE_COORDENADA_DE_BASE`, `DIRECAO`, `PROFUNDIDADE_VERTICAL_M`, `PROFUNDIDADE_SONDADOR_M`, `PROFUNDIDADE_MEDIDA_M`, `REFERENCIA_DE_PROFUNDIDADE`, `MESA_ROTATIVA`, `COTA_ALTIMETRICA_M`, `LAMINA_D_AGUA_M`, `DATUM_VERTICAL`, `UNIDADE_ESTRATIGRAFICA`, `GEOLOGIA_GRUPO_FINAL`, `GEOLOGIA_FORMACAO_FINAL`, `GEOLOGIA_MEMBRO_FINAL`, `CDPE`, `AGP`, `PC`, `PAG`, `PERFIS_CONVENCIONAIS`, `DURANTE_PERFURACAO`, `PERFIS_DIGITAIS`, `PERFIS_PROCESSADOS`, `PERFIS_ESPECIAIS`, `AMOSTRA_LATERAL`, `SISMICA`, `TABELA_TEMPO_PROFUNDIDADE`, `DADOS_DIRECIONAIS`, `TESTE_A_CABO`, `TESTE_DE_FORMACAO`, `CANHONEIO`, `TESTEMUNHO`, `GEOQUIMICA`, `SIG_SONDA`, `NOM_SONDA`, `ATINGIU_PRESAL`, `DHA_ATUALIZACAO`) VALUES
(1, '1-CES-19-CE', '300960039600', 'Petrobras', '1CES 0019  CE', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '1', 'Pioneiro', 'DESCOBRIDOR DE CAMPO COM PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1977-12-12', '1978-01-21', '1978-01-21', 'Público', '-03:05:02', '-38:48:00', '-3,084023611', '-38,8000675', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2990', '', 'MR', '25', '', '47', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA-3', '', '', '27/02/2024'),
(2, '1-CES-23A-CE', '300960040200', 'Petrobras', '1CES 0023A CE', 'CE', 'Ceará', 'EP', 'EP', 'ESPADA', 'M', 'N', '1', 'Pioneiro', 'DESCOBRIDOR DE CAMPO COM PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1978-03-26', '1978-04-25', '1978-04-25', 'Público', '-03:08:13', '-38:48:51', '-3,137006944', '-38,81424194', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2460', '', 'MR', '23,7', '', '36', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA14', '', '', '27/02/2024'),
(3, '1-CES-23-CE', '300960040100', 'Petrobras', '1CES 0023  CE', 'CE', 'Ceará', 'EP', 'EP', 'ESPADA', 'M', 'N', '1', 'Pioneiro', 'ABANDONADO POR ACIDENTE MECÂNICO', 'ABANDONADO PERMANENTEMENTE', '1978-03-26', '1978-03-27', '1978-03-27', 'Público', '-03:08:13', '-38:48:51', '-3,137006944', '-38,81424194', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '180', '', 'MR', '23,7', '', '36', 'NM', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PA14', '', '', '27/02/2024'),
(4, '1-CES-27-CE', '300960043700', 'Petrobras', '1CES 0027  CE', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '1', 'Pioneiro', 'DESCOBRIDOR DE CAMPO COM PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1979-07-01', '1979-08-13', '1979-08-13', 'Público', '-02:58:31', '-38:57:25', '-2,975275833', '-38,95689722', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '3000', '', 'MR', '26', '', '42', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', 'Existe', 'PA-7', '', '', '27/02/2024'),
(5, '1-CES-45A-CES', '300960046400', 'Petrobras', '1CES 0045A CE', 'CE', 'Ceará', 'XA', 'XA', 'XARÉU', 'M', 'N', '1', 'Pioneiro', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1980-01-08', '1980-02-04', '1980-02-04', 'Público', '-03:01:15', '-39:00:05', '-3,0207925', '-39,00128417', 'SIRGAS2000', 'Definitiva', 'Vertical', '0', '2450', '0', 'MR', '22', '0', '33', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', 'Existe', 'PA18', '', '', '27/02/2024'),
(6, '1-CES-45-CES', '300960046200', 'Petrobras', '1CES 0045  CE', 'CE', 'Ceará', 'XA', 'XA', 'XARÉU', 'M', 'N', '1', 'Pioneiro', 'ABANDONADO POR ACIDENTE MECÂNICO', 'ABANDONADO PERMANENTEMENTE', '1980-01-02', '1980-01-04', '1980-01-04', 'Público', '-03:01:15', '-39:00:05', '-3,0207925', '-39,00128417', 'SIRGAS2000', 'Definitiva', 'Vertical', '0', '238', '0', 'MR', '22', '0', '33', 'NM', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(7, '1-CES-66A-CES', '300960224200', 'Petrobras', '1CES 0066A CE', 'CE', 'Ceará', 'C066', 'C066', 'ÁREA DO CES066', 'M', 'N', '1', 'Pioneiro', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1985-09-02', '1985-09-30', '1985-09-30', 'Público', '-02:57:52', '-39:00:16', '-2,964510833', '-39,00458278', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2331', '', 'MR', '21', '0', '43', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', 'Existe', 'PA18', '', '', '27/02/2024'),
(8, '1-CES-66-CES', '300960070700', 'Petrobras', '1CES 0066  CE', 'CE', 'Ceará', 'C066', 'C066', 'ÁREA DO CES066', 'M', 'N', '1', 'Pioneiro', 'DESCOBRIDOR DE CAMPO COM GÁS NATURAL', 'ABANDONADO PERMANENTEMENTE', '1981-12-02', '1982-01-01', '1982-01-01', 'Público', '-02:57:52', '-39:00:13', '-2,964575833', '-39,00361861', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2820', '', 'MR', '20', '0', '44', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', 'Existe', 'PA18', '', '', '27/02/2024'),
(9, '1-CES-66DA-CES', '300960229500', 'Petrobras', '1CES 0066DACE', 'CE', 'Ceará', 'C066', 'C066', 'ÁREA DO CES066', 'M', 'N', '1', 'Pioneiro', 'DESCOBRIDOR DE CAMPO COM GÁS NATURAL', 'ABANDONADO PERMANENTEMENTE', '1985-10-23', '1985-11-09', '1985-11-09', 'Público', '-02:57:52', '-39:00:13', '-2,964575833', '-39,00361861', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2359', '', 'MR', '21', '0', '43', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA18', '', '', '27/02/2024'),
(10, '1-CES-67-CES', '300960066900', 'Petrobras', '1CES 0067  CE', 'CE', 'Ceará', 'XA', 'XA', 'XARÉU', 'M', 'N', '1', 'Pioneiro', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1981-10-19', '1981-10-31', '1981-10-31', 'Público', '-03:02:38', '-38:59:51', '-3,0439975', '-38,99736139', 'SIRGAS2000', 'Definitiva', 'Vertical', '0', '2007', '0', 'MR', '23', '0', '31', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(11, '1-CES-8-CE', '300960037400', 'Petrobras', '1CES 0008  CE', 'CE', 'Ceará', 'XA', 'XA', 'XARÉU', 'M', 'N', '1', 'Pioneiro', 'DESCOBRIDOR DE CAMPO COM PETRÓLEO', 'ARRASADO', '1976-11-20', '1977-02-05', '1977-02-05', 'Público', '-03:02:02', '-39:02:20', '-3,033784444', '-39,0388675', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '3532', '', 'MR', '26', '', '30', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA12', '', '', '27/02/2024'),
(12, '3-AT-1D-CES', '300960103700', 'Petrobras', '3AT  0001D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '3', 'Extensão', 'EXTENSÃO PARA PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1982-08-22', '1982-10-15', '1982-10-15', 'Público', '-02:57:43', '-38:58:34', '-2,9620525', '-38,97615944', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2932', '', 'MR', '21', '', '42,6', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(13, '3-AT-3D-CES', '300960115900', 'Petrobras', '3AT  0003D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '3', 'Extensão', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1982-11-16', '1982-12-25', '1982-12-25', 'Público', '-02:57:43', '-38:58:34', '-2,962069444', '-38,97617278', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2901', '', 'MR', '20', '', '40', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(14, '3-AT-8-CES', '300960218500', 'Petrobras', '3AT  0008  CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '3', 'Extensão', 'EXTENSÃO PARA PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1985-07-11', '1985-08-29', '1985-08-29', 'Público', '-02:57:06', '-38:59:14', '-2,951566667', '-38,98729833', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '3535', '', 'MR', '24', '', '47', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', 'Existe', 'P-5', 'PETROBRAS V', '', '27/02/2024'),
(15, '3-BRSA-243-CES', '30096020660', 'Petrobras', '3CR27CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'S', '3', 'Extensão', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '2003-09-25', '2003-10-23', '2003-10-29', 'Público', '-03:06:41', '-38:47:44', '-3,111431389', '-38,79544278', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2230', '', 'MR', '30', '0', '43', 'NM', '', '', '', '', 'Existe', 'Existe', 'Existe', '', 'Existe', '', 'Existe', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', 'P-6', 'PETROBRAS VI', '', '27/02/2024'),
(16, '3-CES-28-CE', '300960041400', 'Petrobras', '3CES 0028  CE', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '3', 'Extensão', 'EXTENSÃO PARA PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1978-09-10', '1978-10-03', '1978-10-03', 'Público', '-03:05:43', '-38:47:06', '-3,095275556', '-38,78513583', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2412', '', 'MR', '28', '', '42', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', 'Existe', 'PA14', '', '', '27/02/2024'),
(17, '3-CES-31A-CE', '300960042200', 'Petrobras', '3CES 0031A CE', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '3', 'Extensão', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1978-12-25', '1979-01-20', '1979-01-20', 'Público', '-03:06:20', '-38:46:46', '-3,105536111', '-38,77939139', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2417', '', 'MR', '23,79999', '', '46', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA14', '', '', '27/02/2024'),
(18, '3-CES-31-CE', '300960042100', 'Petrobras', '3CES 0031  CE', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '3', 'Extensão', 'ABANDONADO POR ACIDENTE MECÂNICO', 'ABANDONADO PERMANENTEMENTE', '1978-12-18', '1978-12-20', '1978-12-20', 'Público', '-03:06:20', '-38:46:46', '-3,105536111', '-38,77939139', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '185', '', 'MR', '22', '', '46', 'NM', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PA14', '', '', '27/02/2024'),
(19, '3-CES-32-CE', '300960042500', 'Petrobras', '3CES 0032  CE', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '3', 'Extensão', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1979-01-28', '1979-03-02', '1979-03-02', 'Público', '-03:05:18', '-38:48:37', '-3,088372222', '-38,81026167', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2406', '', 'MR', '23,79999', '', '44', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA14', '', '', '27/02/2024'),
(20, '3-CES-37D-CE', '300960053900', 'Petrobras', '3CES 0037D CE', 'CE', 'Ceará', 'EP', 'EP', 'ESPADA', 'M', 'N', '3', 'Extensão', 'DESCOBRIDOR DE NOVA JAZIDA PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1981-01-04', '1981-03-02', '1981-03-02', 'Público', '-03:08:00', '-38:49:10', '-3,133391944', '-38,81934194', 'SIRGAS2000', 'Definitiva', 'Direcional', '0', '3594', '3592,5', 'MR', '19', '0', '35', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', 'Existe', '', '', 'Existe', '', 'Existe', 'PA18', '', 'I', '27/02/2024'),
(21, '3-CES-38D-CE', '300960056000', 'Petrobras', '3CES 0038D CE', 'CE', 'Ceará', 'EP', 'EP', 'ESPADA', 'M', 'N', '3', 'Extensão', 'EXTENSÃO PARA PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1981-03-26', '1981-04-22', '1981-04-22', 'Público', '-03:08:00', '-38:49:10', '-3,133391944', '-38,81934194', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2393', '', 'MR', '19', '', '35', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(22, '3-CES-40A-CES', '300960134400', 'Petrobras', '3CES 0040A CE', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '3', 'Extensão', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1983-04-05', '1983-04-20', '1983-04-20', 'Público', '-02:59:00', '-38:57:01', '-2,983285833', '-38,95027444', 'SIRGAS2000', 'Definitiva', 'Vertical', '0', '2532', '0', 'MR', '27', '0', '46', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'P-6', 'PETROBRAS VI', '', '27/02/2024'),
(23, '3-CES-40-CES', '300960134200', 'Petrobras', '3CES 0040  CE', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '3', 'Extensão', 'ABANDONADO POR ACIDENTE MECÂNICO', 'ABANDONADO PERMANENTEMENTE', '1983-04-03', '1983-04-03', '1983-04-03', 'Público', '-02:59:00', '-38:57:01', '-2,983285833', '-38,95027444', 'SIRGAS2000', 'Definitiva', 'Vertical', '0', '121', '0', 'MR', '27', '0', '47', 'NM', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'P-6', 'PETROBRAS VI', '', '27/02/2024'),
(24, '3-CES-59D-CE', '300960057700', 'Petrobras', '3CES 0059D CE', 'CE', 'Ceará', 'EP', 'EP', 'ESPADA', 'M', 'N', '3', 'Extensão', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1981-05-27', '1981-06-13', '1981-06-13', 'Público', '-03:08:00', '-38:49:10', '-3,133391944', '-38,81934194', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2112', '', 'MR', '19', '', '35', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(25, '3-CES-62D-CE', '300960086100', 'Petrobras', '3CES 0062D CE', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '3', 'Extensão', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1982-04-18', '1982-05-20', '1982-05-20', 'Público', '-02:58:39', '-38:57:30', '-2,977626111', '-38,95843333', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2437', '', 'MR', '30', '', '39', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA-7', '', '', '27/02/2024'),
(26, '3-CES-63D-CE', '300960076500', 'Petrobras', '3CES 0063D CE', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '3', 'Extensão', 'DESCOBRIDOR DE NOVA JAZIDA PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1982-01-29', '1982-03-26', '1982-03-26', 'Público', '-02:58:39', '-38:57:30', '-2,977614444', '-38,95843', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2593', '', 'MR', '30', '', '39', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA-7', '', '', '27/02/2024'),
(27, '3-CES-64DA-CE', '300960072200', 'Petrobras', '3CES 0064DACE', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '3', 'Extensão', 'EXTENSÃO PARA PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1981-12-20', '1982-01-02', '1982-01-02', 'Público', '-02:58:39', '-38:57:30', '-2,977614444', '-38,95843', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2580', '', 'MR', '30', '', '39', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA-7', '', '', '27/02/2024'),
(28, '3-CES-64D-CE', '300960066300', 'Petrobras', '3CES 0064D CE', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '3', 'Extensão', 'ABANDONADO POR ACIDENTE MECÂNICO', 'ABANDONADO PERMANENTEMENTE', '1981-10-13', '1981-12-11', '1981-12-11', 'Público', '-02:58:39', '-38:57:30', '-2,977614444', '-38,95843', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2572', '', 'MR', '30', '', '39', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA-7', '', '', '27/02/2024'),
(29, '3-CES-83-CE', '300960095600', 'Petrobras', '3CES 0083  CE', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '3', 'Extensão', 'EXTENSÃO PARA PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1982-06-24', '1982-07-18', '1982-07-18', 'Público', '-02:57:43', '-38:58:34', '-2,9620525', '-38,97615944', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2421', '', 'MR', '20', '', '43', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(30, '3-CES-86D-CE', '300960098600', 'Petrobras', '3CES 0086D CE', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '3', 'Extensão', 'EXTENSÃO PARA PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1982-07-13', '1982-08-23', '1982-08-23', 'Público', '-02:58:39', '-38:57:30', '-2,977614444', '-38,95843', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2781', '', 'MR', '31', '', '39', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA-7', '', '', '27/02/2024'),
(31, '3-CR-1-CES', '300960043500', 'Petrobras', '3CR  0001  CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '3', 'Extensão', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1979-05-08', '1979-06-13', '1979-06-13', 'Público', '-03:05:59', '-38:46:27', '-3,099658889', '-38,77411611', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2413', '', 'MR', '24,7', '', '49', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA-7', '', '', '27/02/2024'),
(32, '3-EP-1-CES', '300960058800', 'Petrobras', '3EP  0001  CES', 'CE', 'Ceará', 'EP', 'EP', 'ESPADA', 'M', 'N', '3', 'Extensão', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1981-06-19', '1981-07-02', '1981-07-02', 'Público', '-03:08:00', '-38:49:10', '-3,133391944', '-38,81934194', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '1850', '', 'MR', '22', '0', '36', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(33, '3-EP-5-CES', '300960130600', 'Petrobras', '3EP  0005  CES', 'CE', 'Ceará', 'XA', 'EP', 'ESPADA', 'M', 'N', '3', 'Extensão', 'EXTENSÃO PARA PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE SEM MONITORAMENTO', '1983-03-07', '1983-04-01', '1983-04-01', 'Público', '-03:08:29', '-38:49:49', '-3,1415075', '-38,83033056', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2509', '', 'MR', '22', '', '38', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', '', 'PA-3', '', '', '27/02/2024'),
(34, '3-EP-6-CES', '300960140000', 'Petrobras', '3EP  0006  CES', 'CE', 'Ceará', 'EP', 'EP', 'ESPADA', 'M', 'N', '3', 'Extensão', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1983-05-25', '1983-06-13', '1983-06-13', 'Público', '-03:07:26', '-38:49:07', '-3,123948333', '-38,81857417', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2087', '', 'MR', '25', '', '34', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA-3', '', '', '27/02/2024'),
(35, '3-XA-32-CES', '300960168700', 'Petrobras', '3XA  0032  CES', 'CE', 'Ceará', 'XA', 'XA', 'XARÉU', 'M', 'N', '3', 'Extensão', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1984-02-15', '1984-02-29', '1984-02-29', 'Público', '-03:02:49', '-39:01:23', '-3,046925', '-39,02306167', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2025', '', 'MR', '24', '', '34', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA25', '', '', '27/02/2024'),
(36, '3-XA-33-CES', '300960174000', 'Petrobras', '3XA  0033  CES', 'CE', 'Ceará', 'XA', 'XA', 'XARÉU', 'M', 'N', '3', 'Extensão', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1984-04-08', '1984-04-23', '1984-04-23', 'Público', '-03:01:58', '-39:00:43', '-3,032815556', '-39,01186583', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '1770', '', 'MR', '26', '', '31', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA25', '', '', '27/02/2024'),
(37, '3-XA-6-CES', '300960055700', 'Petrobras', '3XA  0006  CES', 'CE', 'Ceará', 'XA', 'XA', 'XARÉU', 'M', 'N', '3', 'Extensão', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1981-03-09', '1981-04-04', '1981-04-04', 'Público', '-03:02:48', '-39:02:55', '-3,046588333', '-39,04869417', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2423', '', 'MR', '25', '', '33', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', '', 'PA14', '', '', '27/02/2024'),
(38, '4-CES-12A-CE', '300960038200', 'Petrobras', '4CES 0012A CE', 'CE', 'Ceará', 'XA', 'XA', 'XARÉU', 'M', 'N', '4', 'Pioneiro Adjacente', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1977-02-28', '1977-04-22', '1977-04-22', 'Público', '-03:01:22', '-39:03:17', '-3,022767778', '-39,05486028', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '3000', '', 'MR', '23,79999', '', '30', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA-3', '', '', '27/02/2024'),
(39, '4-CES-12-CE', '300960038100', 'Petrobras', '4CES 0012  CE', 'CE', 'Ceará', 'XA', 'XA', 'XARÉU', 'M', 'N', '4', 'Pioneiro Adjacente', 'ABANDONADO POR ACIDENTE MECÂNICO', 'ABANDONADO PERMANENTEMENTE', '1977-02-21', '1977-02-22', '1977-02-22', 'Público', '-03:01:19', '-39:03:17', '-3,021996111', '-39,05484333', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '174', '', 'MR', '25', '', '32', 'NM', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PA-3', '', '', '27/02/2024'),
(40, '4-CES-13-CE', '300960038400', 'Petrobras', '4CES 0013  CE', 'CE', 'Ceará', 'XA', 'XA', 'XARÉU', 'M', 'N', '4', 'Pioneiro Adjacente', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1977-04-01', '1977-05-03', '1977-05-03', 'Público', '-03:01:26', '-39:01:55', '-3,023880278', '-39,03204861', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2180', '', 'MR', '24,39999', '', '29', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA10', 'Plataforma autoelevável 10', '', '27/02/2024'),
(41, '4-CES-14-CE', '300960038600', 'Petrobras', '4CES 0014  CE', 'CE', 'Ceará', 'XA', 'XA', 'XARÉU', 'M', 'N', '4', 'Pioneiro Adjacente', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1977-06-03', '1977-08-18', '1977-08-18', 'Público', '-03:03:20', '-39:01:37', '-3,055670278', '-39,02701333', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2952', '', 'MR', '24', '', '32', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA-3', '', '', '27/02/2024'),
(42, '4-CES-21-CE', '300960040000', 'Petrobras', '4CES 0021  CE', 'CE', 'Ceará', 'XA', 'XA', 'XARÉU', 'M', 'N', '4', 'Pioneiro Adjacente', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1978-02-09', '1978-03-11', '1978-03-11', 'Público', '-03:02:08', '-39:01:09', '-3,035515278', '-39,0190625', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2265', '', 'MR', '24', '', '29', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA-3', '', '', '27/02/2024'),
(43, '4-CES-24-CE', '300960040800', 'Petrobras', '4CES 0024  CE', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '4', 'Pioneiro Adjacente', 'PRODUTOR SUBCOMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1978-05-21', '1978-06-13', '1978-06-13', 'Público', '-03:05:13', '-38:47:14', '-3,086968333', '-38,78729028', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2400', '', 'MR', '24', '', '43', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA14', '', '', '27/02/2024'),
(44, '4-CES-25-CE', '300960041000', 'Petrobras', '4CES 0025  CE', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '4', 'Pioneiro Adjacente', 'EXTENSÃO PARA PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1978-07-18', '1978-08-21', '1978-08-21', 'Público', '-03:05:44', '-38:47:54', '-3,095648333', '-38,79830222', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2500', '', 'MR', '24', '', '47', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA14', '', '', '27/02/2024'),
(45, '7-AT-10D-CES', '300960229000', 'Petrobras', '7AT  0010D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1985-10-19', '1985-11-16', '1985-11-16', 'Público', '-02:58:07', '-38:58:26', '-2,968493056', '-38,97402667', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2493', '', 'MR', '25', '', '43', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA17', '', '', '27/02/2024'),
(46, '7-AT-13DA-CES', '300960246300', 'Petrobras', '7AT  0013DACES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1986-03-20', '1986-04-27', '1986-04-27', 'Público', '-02:58:07', '-38:58:26', '-2,968483056', '-38,97400806', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2739', '', 'MR', '27', '', '42', 'NM', '', '', '', '', '', '', '', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', '', 'PA17', '', '', '27/02/2024'),
(47, '7-AT-13D-CES', '300960246200', 'Petrobras', '7AT  0013D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'ABANDONADO POR ACIDENTE MECÂNICO', 'ABANDONADO PERMANENTEMENTE', '1986-03-14', '1986-03-14', '1986-03-14', 'Público', '-02:58:07', '-38:58:26', '-2,968483056', '-38,97400806', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '141', '', 'MR', '27', '', '40', 'NM', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'PA17', '', '', '27/02/2024'),
(48, '7-AT-16D-CES', '300960262700', 'Petrobras', '7AT  0016D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1986-08-24', '1986-09-13', '1986-09-13', 'Público', '-02:58:07', '-38:58:27', '-2,968476667', '-38,97404389', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2389', '', 'MR', '27', '', '42', 'NM', '', '', '', '', '', '', '', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', 'Existe', '', '', 'PA17', '', '', '27/02/2024'),
(49, '7-AT-17D-CES', '300960265500', 'Petrobras', '7AT  0017D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO E GÁS NATURAL', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1986-09-17', '1986-10-17', '1986-10-17', 'Público', '-02:58:07', '-38:58:27', '-2,968481667', '-38,97403306', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2443', '', 'MR', '26', '', '42', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA17', '', '', '27/02/2024'),
(50, '7-AT-18D-CES', '300960268500', 'Petrobras', '7AT  0018D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1986-10-22', '1986-11-19', '1986-11-19', 'Público', '-02:58:07', '-38:58:27', '-2,968476667', '-38,97404389', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2455', '', 'MR', '27', '', '42', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA17', '', '', '27/02/2024'),
(51, '7-AT-19D-CES', '300960271500', 'Petrobras', '7AT  0019D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1986-11-26', '1987-01-02', '1987-01-02', 'Público', '-02:58:07', '-38:58:27', '-2,968501111', '-38,97404556', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '3003', '', 'MR', '27', '', '42', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA17', '', '', '27/02/2024'),
(52, '7-AT-2D-CES', '300960105600', 'Petrobras', '7AT  0002D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1982-09-02', '1982-10-03', '1982-10-03', 'Público', '-02:58:39', '-38:57:30', '-2,977613611', '-38,95843', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2693', '', 'MR', '30', '', '45', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA-7', '', '', '27/02/2024'),
(53, '7-AT-21DP-CES', '30096018949', 'Petrobras', '7AT21DPCES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'S', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '2000-07-19', '0000-00-00', '2000-09-25', 'Público', '-02:57:43', '-38:58:34', '-2,962014167', '-38,9761475', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '', '', 'MR', '30', '', '42', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', '', 'SPM-21', '', '', '27/02/2024'),
(54, '7-AT-22DP-CES', '30096019697', 'Petrobras', '7AT22DPCES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'S', '7', 'Desenvolvimento', '', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '2001-11-12', '2001-12-24', '2002-01-07', 'Público', '-02:57:42', '-38:58:33', '-2,961779722', '-38,97596', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '', '', 'MR', '21', '0', '40', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', '', 'SPM-21', '', '', '27/02/2024'),
(55, '7-AT-4D-CES', '300960122600', 'Petrobras', '7AT  0004D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE SEM MONITORAMENTO', '1983-01-03', '1983-01-28', '1983-01-28', 'Público', '-02:57:43', '-38:58:34', '-2,962065556', '-38,97615306', 'SIRGAS2000', 'Definitiva', 'Direcional', '0', '2535', '2535,5', 'MR', '20,4', '0', '43', 'NM', '', '', '', '', '', '', 'Existe', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', '', 'PA18', '', 'I', '27/02/2024'),
(56, '7-AT-5D-CES', '300960128200', 'Petrobras', '7AT  0005D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1983-02-19', '1983-03-21', '1983-03-21', 'Público', '-02:57:43', '-38:58:34', '-2,9620525', '-38,97615944', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2788', '', 'MR', '20', '', '40', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(57, '7-AT-6D-CES', '300960133200', 'Petrobras', '7AT  0006D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1983-03-28', '1983-04-27', '1983-04-27', 'Público', '-02:57:43', '-38:58:34', '-2,962065556', '-38,97615194', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2518', '', 'MR', '20', '', '43', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(58, '7-AT-7D-CES', '300960150200', 'Petrobras', '7AT  0007D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1983-08-23', '1983-09-18', '1983-09-18', 'Público', '-02:57:42', '-38:58:33', '-2,961770556', '-38,97594194', 'SIRGAS2000', 'Definitiva', 'Direcional', '0', '2701', '2700', 'MR', '30', '0', '43', 'NM', '', '', '', '', '', '', '', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', 'Existe', '', '', 'PA25', '', 'I', '27/02/2024'),
(59, '7-AT-9D-CES', '300960224100', 'Petrobras', '7AT  0009D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1985-09-02', '1985-10-11', '1985-10-11', 'Público', '-02:58:07', '-38:58:26', '-2,968493889', '-38,9740275', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2565', '', 'MR', '25', '', '43', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA17', '', '', '27/02/2024'),
(60, '7-CES-84D-CE', '300960092900', 'Petrobras', '7CES 0084D CE', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1982-06-06', '1982-07-07', '1982-07-07', 'Público', '-02:58:39', '-38:57:30', '-2,977614444', '-38,95843', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2400', '', 'MR', '31', '', '42', 'NM', '', '', '', '', '', '', '', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', '', 'PA-7', '', '', '27/02/2024'),
(61, '7-CR-17D-CES', '300960169700', 'Petrobras', '7CR  0017D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1984-02-26', '1984-03-17', '1984-03-17', 'Público', '-03:05:27', '-38:47:37', '-3,090863611', '-38,7936225', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2374', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SM-4', '', '', '27/02/2024'),
(62, '7-CR-2D-CES', '300960044500', 'Petrobras', '7CR  0002D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1979-09-06', '1979-10-19', '1979-10-19', 'Público', '-03:05:29', '-38:47:38', '-3,091251111', '-38,79385333', 'SIRGAS2000', 'Definitiva', 'Direcional', '0', '2340', '2335,5', 'MR', '24', '0', '49', 'NM', '', '', '', '', '', '', '', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', 'Existe', '', '', 'PA14', '', 'I', '27/02/2024'),
(63, '7-CR-20D-CES', '300960181600', 'Petrobras', '7CR  0020D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1984-06-19', '1984-07-01', '1984-07-01', 'Público', '-03:05:27', '-38:47:37', '-3,0908725', '-38,79364833', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2473', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SM-4', '', '', '27/02/2024'),
(64, '7-CR-21D-CES', '300960183100', 'Petrobras', '7CR  0021D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1984-07-15', '1984-08-03', '1984-08-03', 'Público', '-03:05:27', '-38:47:37', '-3,090885278', '-38,79356528', 'SIRGAS2000', 'Definitiva', 'Direcional', '0', '2380', '2380', 'MR', '31', '0', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', 'Existe', '', '', 'Existe', '', '', 'SM-4', '', 'I', '27/02/2024'),
(65, '7-CR-22D-CES', '300960188800', 'Petrobras', '7CR  0022D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1984-09-11', '1984-10-03', '1984-10-03', 'Público', '-03:05:27', '-38:47:37', '-3,090863611', '-38,79362333', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2505', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', 'Existe', '', '', 'SM-4', '', '', '27/02/2024'),
(66, '7-CR-23D-CES', '300960194300', 'Petrobras', '7CR  0023D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1984-10-31', '1984-11-21', '1984-11-21', 'Público', '-03:05:27', '-38:47:37', '-3,090875278', '-38,79358806', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2530', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SM-4', '', '', '27/02/2024'),
(67, '7-CR-24D-CES', '300960197400', 'Petrobras', '7CR  0024D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1984-11-27', '1984-12-11', '1984-12-11', 'Público', '-03:05:27', '-38:47:37', '-3,090878611', '-38,79358444', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2435', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SM-4', '', '', '27/02/2024'),
(68, '7-CR-25-CES', '300960442100', 'Petrobras', '7CR  0025  CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'SECO COM INDÍCIOS DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1993-12-16', '1994-01-01', '1994-01-01', 'Público', '-03:05:49', '-38:46:58', '-3,096853611', '-38,78265222', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2218', '', 'MR', '26', '', '46', 'NM', '', '', '', '', '', 'Existe', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'P-3', 'PETROBRAS III', '', '27/02/2024'),
(69, '7-CR-28HP-CES', '30096020952', 'Petrobras', '7CR28HPCES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'S', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '2004-06-18', '0000-00-00', '2004-11-24', 'Público', '-03:05:28', '-38:47:38', '-3,090973056', '-38,79400417', 'SIRGAS2000', 'Definitiva', 'Horizontal', '', '3040', '3040', 'MR', '25', '0', '49', 'NM', '', '', '', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', '', 'P-6', 'PETROBRAS VI', '', '27/02/2024'),
(70, '7-CR-3D-CES', '300960045200', 'Petrobras', '7CR  0003D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1979-10-30', '1979-12-10', '1979-12-10', 'Público', '-03:05:29', '-38:47:38', '-3,091255556', '-38,79385778', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2537', '', 'MR', '24,7', '', '49', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA14', '', '', '27/02/2024'),
(71, '7-CR-4D-CES', '300960045900', 'Petrobras', '7CR  0004D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1979-12-15', '1980-01-16', '1980-01-16', 'Público', '-03:05:29', '-38:47:38', '-3,091255556', '-38,79385778', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2580', '', 'MR', '29', '', '44', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA14', '', '', '27/02/2024'),
(72, '7-CR-5-CES', '300960117400', 'Petrobras', '7CR  0005  CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1982-11-26', '1982-12-31', '1982-12-31', 'Público', '-03:05:27', '-38:47:37', '-3,090871111', '-38,79360333', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2230', '', 'MR', '31', '', '45', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'SM-4', '', '', '27/02/2024'),
(73, '7-CR-6D-CES', '300960123000', 'Petrobras', '7CR  0006D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1983-01-06', '1983-02-08', '1983-02-08', 'Público', '-03:05:27', '-38:47:37', '-3,090893056', '-38,79354194', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2681', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', '', 'SM-4', '', '', '27/02/2024'),
(74, '7-CR-7D-CES', '300960128300', 'Petrobras', '7CR  0007D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1983-02-19', '1983-03-13', '1983-03-13', 'Público', '-03:05:27', '-38:47:37', '-3,090951944', '-38,79358611', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2280', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', 'Existe', '', '', 'Existe', '', '', 'SM-4', '', '', '27/02/2024'),
(75, '7-CR-8D-CES', '300960135900', 'Petrobras', '7CR  0008D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1983-04-16', '1983-05-07', '1983-05-07', 'Público', '-03:05:27', '-38:47:37', '-3,090893056', '-38,79354194', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2325', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SM-4', '', '', '27/02/2024'),
(76, '7-EP-2D-CES', '300960060300', 'Petrobras', '7EP  0002D CES', 'CE', 'Ceará', 'XA', 'EP', 'ESPADA', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1981-07-16', '1981-08-14', '1981-08-14', 'Público', '-03:08:00', '-38:49:10', '-3,133391944', '-38,81934194', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2150', '', 'MR', '22', '', '35', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(77, '7-EP-3D-CES', '300960062500', 'Petrobras', '7EP  0003D CES', 'CE', 'Ceará', 'XA', 'EP', 'ESPADA', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1981-08-20', '1981-09-07', '1981-09-07', 'Público', '-03:08:00', '-38:49:10', '-3,133391944', '-38,81934194', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2241', '', 'MR', '22', '', '35', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(78, '7-EP-4D-CES', '300960064600', 'Petrobras', '7EP  0004D CES', 'CE', 'Ceará', 'XA', 'EP', 'ESPADA', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1981-09-16', '1981-09-30', '1981-09-30', 'Público', '-03:08:00', '-38:49:10', '-3,133391944', '-38,81934194', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2230', '', 'MR', '22', '', '35', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA18', '', '', '27/02/2024'),
(79, '7-EP-7D-CES', '300960423200', 'Petrobras', '7EP  0007D CES', 'CE', 'Ceará', 'XA', 'EP', 'ESPADA', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1993-01-26', '1993-02-19', '1993-02-19', 'Público', '-03:08:01', '-38:49:09', '-3,133511111', '-38,81930167', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2117', '', 'MR', '29', '', '36', 'NM', '', '', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'P-5', 'PETROBRAS V', '', '27/02/2024'),
(80, '7-EP-8DP-CES', '300960557200', 'Petrobras', '7EP  0008DPCES', 'CE', 'Ceará', 'EP', 'EP', 'ESPADA', 'M', 'N', '7', 'Desenvolvimento', 'INDEFINIDO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1999-08-20', '1999-10-14', '1999-10-14', 'Público', '-03:08:00', '-38:49:10', '-3,133392778', '-38,81934278', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2352', '', 'MR', '31', '', '39', 'NM', '', '', '', '', '', 'Existe', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'SPM21', '', '', '27/02/2024'),
(81, '7-XA-1D-CES', '300960049200', 'Petrobras', '7XA  0001D CES', 'CE', 'Ceará', 'EP', 'XA', 'XARÉU', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1980-06-14', '1980-07-21', '1980-07-21', 'Público', '-03:01:50', '-39:02:32', '-3,030616667', '-39,04216778', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '1933', '', 'MR', '34', '', '31,5', 'NM', '', '', '', '', '', '', '', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', '', 'NT-5', '', '', '27/02/2024'),
(82, '7-XA-10D-CES', '300960067600', 'Petrobras', '7XA  0010D CES', 'CE', 'Ceará', 'EP', 'XA', 'XARÉU', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1981-10-27', '1981-11-30', '1981-11-30', 'Público', '-03:01:50', '-39:02:32', '-3,030616667', '-39,04216778', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2101', '', 'MR', '34', '', '31,5', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'NT-5', '', '', '27/02/2024'),
(83, '7-XA-11D-CES', '300960072400', 'Petrobras', '7XA  0011D CES', 'CE', 'Ceará', 'EP', 'XA', 'XARÉU', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1981-12-21', '1982-01-21', '1982-01-21', 'Público', '-03:01:50', '-39:02:32', '-3,030616667', '-39,04216778', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2210', '', 'MR', '34', '', '31,5', 'NM', '', '', '', '', '', '', '', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', '', 'NT-5', '', '', '27/02/2024'),
(84, '7-XA-12D-CES', '300960077200', 'Petrobras', '7XA  0012D CES', 'CE', 'Ceará', 'EP', 'XA', 'XARÉU', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1982-01-31', '1982-03-15', '1982-03-15', 'Público', '-03:01:50', '-39:02:32', '-3,030616667', '-39,04216778', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '1978', '', 'MR', '34', '', '31,5', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'NT-5', '', '', '27/02/2024'),
(85, '7-XA-9-CES', '300960061700', 'Petrobras', '7XA  0009  CES', 'CE', 'Ceará', 'EP', 'XA', 'XARÉU', 'M', 'N', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1981-08-10', '1981-09-14', '1981-09-14', 'Público', '-03:01:50', '-39:02:32', '-3,030615833', '-39,04216778', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '1833', '', 'MR', '32', '', '30', 'NM', '', '', '', '', '', '', '', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', '', 'NT-5', '', '', '27/02/2024'),
(86, '8-AT-11D-CES', '300960232800', 'Petrobras', '8AT  0011D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '8', 'Injeção', 'INJEÇÃO DE ÁGUA', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1985-11-22', '1986-01-07', '1986-01-07', 'Público', '-02:58:07', '-38:58:27', '-2,968481667', '-38,97403306', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2825', '', 'MR', '25', '', '43', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA17', '', '', '27/02/2024'),
(87, '8-AT-12D-CES', '300960241000', 'Petrobras', '8AT  0012D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '8', 'Injeção', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1986-01-30', '1986-03-05', '1986-03-05', 'Público', '-02:58:06', '-38:58:26', '-2,968458056', '-38,97401639', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2540', '', 'MR', '27', '', '42', 'NM', '', '', '', '', '', '', '', '', 'Existe', '', 'Existe', '', '', '', '', '', 'Existe', '', '', 'Existe', '', '', 'PA17', '', '', '27/02/2024'),
(88, '8-AT-14D-CES', '300960253100', 'Petrobras', '8AT  0014D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '8', 'Injeção', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1986-05-22', '1986-06-27', '1986-06-27', 'Público', '-02:58:07', '-38:58:27', '-2,968481111', '-38,97405556', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2728', '', 'MR', '27', '', '42', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA17', '', '', '27/02/2024'),
(89, '8-AT-15D-CES', '300960258900', 'Petrobras', '8AT  0015D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '8', 'Injeção', 'INJEÇÃO DE ÁGUA', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1986-07-21', '1986-08-15', '1986-08-15', 'Público', '-02:58:07', '-38:58:27', '-2,9684825', '-38,97403139', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2550', '', 'MR', '27', '', '42', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA17', '', '', '27/02/2024'),
(90, '8-AT-20D-CES', '300960279800', 'Petrobras', '8AT  0020D CES', 'CE', 'Ceará', 'AT', 'AT', 'ATUM', 'M', 'N', '8', 'Injeção', 'INJEÇÃO DE ÁGUA', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1987-03-17', '1987-04-17', '1987-04-17', 'Público', '-02:58:07', '-38:58:26', '-2,968474444', '-38,97401972', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2602', '', 'MR', '27', '', '42', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'PA17', '', '', '27/02/2024'),
(91, '8-CR-12D-CES', '300960153500', 'Petrobras', '8CR  0012D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '8', 'Injeção', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1983-09-28', '1983-10-19', '1983-10-19', 'Público', '-03:05:27', '-38:47:37', '-3,090901389', '-38,79357944', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2409', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SM-4', '', '', '27/02/2024');
INSERT INTO `dados_anp` (`id`, `POCO`, `CADASTRO`, `OPERADOR`, `POCO_OPERADOR`, `ESTADO`, `BACIA`, `BLOCO`, `SIG_CAMPO`, `CAMPO`, `TERRA_MAR`, `POCO_POS_ANP`, `TIPO`, `CATEGORIA`, `RECLASSIFICACAO`, `SITUACAO`, `INICIO`, `TERMINO`, `CONCLUSAO`, `TITULARIDADE`, `LATITUDE_BASE_4C`, `LONGITUDE_BASE_4C`, `LATITUDE_BASE_DD`, `LONGITUDE_BASE_DD`, `DATUM_HORIZONTAL`, `TIPO_DE_COORDENADA_DE_BASE`, `DIRECAO`, `PROFUNDIDADE_VERTICAL_M`, `PROFUNDIDADE_SONDADOR_M`, `PROFUNDIDADE_MEDIDA_M`, `REFERENCIA_DE_PROFUNDIDADE`, `MESA_ROTATIVA`, `COTA_ALTIMETRICA_M`, `LAMINA_D_AGUA_M`, `DATUM_VERTICAL`, `UNIDADE_ESTRATIGRAFICA`, `GEOLOGIA_GRUPO_FINAL`, `GEOLOGIA_FORMACAO_FINAL`, `GEOLOGIA_MEMBRO_FINAL`, `CDPE`, `AGP`, `PC`, `PAG`, `PERFIS_CONVENCIONAIS`, `DURANTE_PERFURACAO`, `PERFIS_DIGITAIS`, `PERFIS_PROCESSADOS`, `PERFIS_ESPECIAIS`, `AMOSTRA_LATERAL`, `SISMICA`, `TABELA_TEMPO_PROFUNDIDADE`, `DADOS_DIRECIONAIS`, `TESTE_A_CABO`, `TESTE_DE_FORMACAO`, `CANHONEIO`, `TESTEMUNHO`, `GEOQUIMICA`, `SIG_SONDA`, `NOM_SONDA`, `ATINGIU_PRESAL`, `DHA_ATUALIZACAO`) VALUES
(92, '8-CR-13D-CES', '300960157200', 'Petrobras', '8CR  0013D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '8', 'Injeção', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1983-10-30', '1983-11-19', '1983-11-19', 'Público', '-03:05:27', '-38:47:37', '-3,090856667', '-38,79364222', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2450', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SM-4', '', '', '27/02/2024'),
(93, '8-CR-15D-CES', '300960164300', 'Petrobras', '8CR  0015D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '8', 'Injeção', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1984-01-01', '1984-01-29', '1984-01-29', 'Público', '-03:05:27', '-38:47:37', '-3,090893611', '-38,79359056', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2503', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SM-4', '', '', '27/02/2024'),
(94, '8-CR-16D-CES', '300960167600', 'Petrobras', '8CR  0016D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '8', 'Injeção', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1984-02-03', '1984-02-12', '1984-02-12', 'Público', '-03:05:27', '-38:47:37', '-3,090893611', '-38,79359056', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2364', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SM-4', '', '', '27/02/2024'),
(95, '8-CR-18D-CES', '300960173800', 'Petrobras', '8CR  0018D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '8', 'Injeção', 'ABANDONADO POR OUTRAS RAZÕES', 'ABANDONADO PERMANENTEMENTE', '1984-04-08', '1984-04-29', '1984-04-29', 'Público', '-03:05:27', '-38:47:37', '-3,090876667', '-38,7936275', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2440', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SM-4', '', '', '27/02/2024'),
(96, '8-CR-19D-CES', '300960177300', 'Petrobras', '8CR  0019D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '8', 'Injeção', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1984-05-07', '1984-05-16', '1984-05-16', 'Público', '-03:05:27', '-38:47:37', '-3,090879167', '-38,79362861', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2461', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SM-4', '', '', '27/02/2024'),
(97, '8-CR-26DP-CES', '300960537000', 'Petrobras', '8CR  0026DPCES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '8', 'Injeção', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1998-05-16', '1998-07-18', '1998-07-18', 'Público', '-03:05:27', '-38:47:37', '-3,090875556', '-38,79360611', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2560', '', 'MR', '29', '', '47', 'NM', '', '', '', '', '', 'Existe', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SPM22', '', '', '27/02/2024'),
(98, '8-CR-9D-CES', '300960138600', 'Petrobras', '8CR  0009D CES', 'CE', 'Ceará', 'CR', 'CR', 'CURIMÃ', 'M', 'N', '8', 'Injeção', 'DESCOBRIDOR DE NOVA JAZIDA PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1983-05-13', '1983-06-03', '1983-06-03', 'Público', '-03:05:27', '-38:47:37', '-3,090893056', '-38,79354194', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2671', '', 'MR', '31', '', '47', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SM-4', '', '', '27/02/2024'),
(99, '8-XA-23D-CES', '300960146000', 'Petrobras', '8XA  0023D CES', 'CE', 'Ceará', 'EP', 'XA', 'XARÉU', 'M', 'N', '8', 'Injeção', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1983-07-12', '1983-08-01', '1983-08-01', 'Público', '-03:02:23', '-39:02:22', '-3,039613611', '-39,03937556', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '2123', '', 'MR', '31', '', '29', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'NT-5', '', '', '27/02/2024'),
(100, '8-XA-25D-CES', '300960149100', 'Petrobras', '8XA  0025D CES', 'CE', 'Ceará', 'EP', 'XA', 'XARÉU', 'M', 'N', '8', 'Injeção', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'ABANDONADO TEMPORARIAMENTE COM MONITORAMENTO', '1983-08-11', '1983-09-14', '1983-09-14', 'Público', '-03:02:23', '-39:02:22', '-3,039613333', '-39,03936139', 'SIRGAS2000', 'Definitiva', 'Direcional', '', '1920', '', 'MR', '31', '', '29', 'NM', '', '', '', '', '', '', '', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'NT-5', '', '', '27/02/2024');

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `razao_social` varchar(255) NOT NULL,
  `nome_fantasia` varchar(255) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `plano` enum('Padrão','Premium') NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `empresas`
--

INSERT INTO `empresas` (`id`, `razao_social`, `nome_fantasia`, `cnpj`, `cep`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `plano`, `data_cadastro`) VALUES
(1, 'Petróleo Brasileiro S/A Petrobras', 'Petrobras', '33.000.167/0001-01', '20031-912', 'Avenida República do Chile', '65', '', 'Centro', 'Rio de Janeiro', 'RJ', 'Premium', '2024-07-24 16:35:47'),
(2, 'Petroleo Mais S/A', 'PetroMais', '12.345.678/0001-90', '01000-000', 'Rua Fictícia', '123', '', 'Centro', 'São Paulo', 'SP', 'Padrão', '2024-07-24 16:35:47');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_visitas`
--

CREATE TABLE `historico_visitas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `dados_anp_id` int(11) NOT NULL,
  `data_visita` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `logistica`
--

CREATE TABLE `logistica` (
  `id` int(11) NOT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `tipo` enum('bacia','campo','bloco','poco') NOT NULL,
  `nome` varchar(255) NOT NULL,
  `localizacao` varchar(255) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissoes`
--

CREATE TABLE `permissoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `acesso_logistica` tinyint(1) DEFAULT 0,
  `tornar_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `permissoes`
--

INSERT INTO `permissoes` (`id`, `usuario_id`, `empresa_id`, `acesso_logistica`, `tornar_admin`) VALUES
(1, 1, 1, 1, 1),
(2, 4, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `perfil_imagem` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT 0,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `empresa_id`, `nome`, `email`, `senha`, `perfil_imagem`, `admin`, `data_cadastro`) VALUES
(1, 1, 'Sylvia dos Anjos', 's.anjos@petrobras.com.br', '123456', NULL, 1, '2024-07-24 16:35:47'),
(2, 1, 'Maria Clara Miguel', 'm.clara@petrobras.com.br', '123456', NULL, 0, '2024-07-24 16:35:47'),
(3, 1, 'Isadora Júlia Oliveira', 'isadora.julia@petrobras.com.br', '123456', NULL, 0, '2024-07-24 16:35:47'),
(4, 2, 'Caio Santos', 'c.santos@petromais.com', '123456', NULL, 1, '2024-07-24 16:35:47'),
(5, 2, 'Cecília Flores', 'c.flores@petromais.com', '123456', NULL, 0, '2024-07-24 16:35:47'),
(6, 2, 'Rafael Novaes', 'r.novaes@petromais.com', '123456', NULL, 0, '2024-07-24 16:35:47');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `dados_anp`
--
ALTER TABLE `dados_anp`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Índices de tabela `historico_visitas`
--
ALTER TABLE `historico_visitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `dados_anp_id` (`dados_anp_id`);

--
-- Índices de tabela `logistica`
--
ALTER TABLE `logistica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Índices de tabela `permissoes`
--
ALTER TABLE `permissoes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`,`empresa_id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `dados_anp`
--
ALTER TABLE `dados_anp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de tabela `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `historico_visitas`
--
ALTER TABLE `historico_visitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `logistica`
--
ALTER TABLE `logistica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `permissoes`
--
ALTER TABLE `permissoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `historico_visitas`
--
ALTER TABLE `historico_visitas`
  ADD CONSTRAINT `historico_visitas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historico_visitas_ibfk_2` FOREIGN KEY (`dados_anp_id`) REFERENCES `dados_anp` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `logistica`
--
ALTER TABLE `logistica`
  ADD CONSTRAINT `logistica_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);

--
-- Restrições para tabelas `permissoes`
--
ALTER TABLE `permissoes`
  ADD CONSTRAINT `permissoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permissoes_ibfk_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
