CREATE DATABASE petroeye_monitoring;
USE petroeye_monitoring;

CREATE TABLE empresas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    cep VARCHAR(10) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(255),
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    plano ENUM('Padrão', 'Premium') NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    empresa_id INT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    perfil_imagem VARCHAR(255),
    admin BOOLEAN DEFAULT FALSE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (empresa_id) REFERENCES empresas(id)
);

CREATE TABLE logistica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    empresa_id INT,
    tipo ENUM('bacia', 'campo', 'bloco', 'poco') NOT NULL,
    nome VARCHAR(255) NOT NULL,
    localizacao VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (empresa_id) REFERENCES empresas(id)
);



CREATE TABLE dados_anp (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    POCO VARCHAR(255) DEFAULT NULL,
    CADASTRO VARCHAR(255) DEFAULT NULL,
    OPERADOR VARCHAR(255) DEFAULT NULL,
    POCO_OPERADOR VARCHAR(255) DEFAULT NULL,
    ESTADO VARCHAR(255) DEFAULT NULL,
    BACIA VARCHAR(255) DEFAULT NULL,
    BLOCO VARCHAR(255) DEFAULT NULL,
    SIG_CAMPO VARCHAR(255) DEFAULT NULL,
    CAMPO VARCHAR(255) DEFAULT NULL,
    TERRA_MAR VARCHAR(255) DEFAULT NULL,
    POCO_POS_ANP VARCHAR(255) DEFAULT NULL,
    TIPO VARCHAR(255) DEFAULT NULL,
    CATEGORIA VARCHAR(255) DEFAULT NULL,
    RECLASSIFICACAO VARCHAR(255) DEFAULT NULL,
    SITUACAO VARCHAR(255) DEFAULT NULL,
    INICIO DATE,
    TERMINO DATE,
    CONCLUSAO DATE,
    TITULARIDADE VARCHAR(255) DEFAULT NULL,
    LATITUDE_BASE_4C VARCHAR(255) DEFAULT NULL,
    LONGITUDE_BASE_4C VARCHAR(255) DEFAULT NULL,
    LATITUDE_BASE_DD VARCHAR(255) DEFAULT NULL,
    LONGITUDE_BASE_DD VARCHAR(255) DEFAULT NULL,
    DATUM_HORIZONTAL VARCHAR(255) DEFAULT NULL,
    TIPO_DE_COORDENADA_DE_BASE VARCHAR(255) DEFAULT NULL,
    DIRECAO VARCHAR(255) DEFAULT NULL,
    PROFUNDIDADE_VERTICAL_M VARCHAR(255) DEFAULT NULL,
    PROFUNDIDADE_SONDADOR_M VARCHAR(255) DEFAULT NULL,
    PROFUNDIDADE_MEDIDA_M VARCHAR(255) DEFAULT NULL,
    REFERENCIA_DE_PROFUNDIDADE VARCHAR(255) DEFAULT NULL,
    MESA_ROTATIVA VARCHAR(255) DEFAULT NULL,
    COTA_ALTIMETRICA_M VARCHAR(255) DEFAULT NULL,
    LAMINA_D_AGUA_M VARCHAR(255) DEFAULT NULL,
    DATUM_VERTICAL VARCHAR(255) DEFAULT NULL,
    UNIDADE_ESTRATIGRAFICA VARCHAR(255) DEFAULT NULL,
    GEOLOGIA_GRUPO_FINAL VARCHAR(255) DEFAULT NULL,
    GEOLOGIA_FORMACAO_FINAL VARCHAR(255) DEFAULT NULL,
    GEOLOGIA_MEMBRO_FINAL VARCHAR(255) DEFAULT NULL,
    CDPE VARCHAR(255) DEFAULT NULL,
    AGP VARCHAR(255) DEFAULT NULL,
    PC VARCHAR(255) DEFAULT NULL,
    PAG VARCHAR(255) DEFAULT NULL,
    PERFIS_CONVENCIONAIS VARCHAR(255) DEFAULT NULL,
    DURANTE_PERFURACAO VARCHAR(255) DEFAULT NULL,
    PERFIS_DIGITAIS VARCHAR(255) DEFAULT NULL,
    PERFIS_PROCESSADOS VARCHAR(255) DEFAULT NULL,
    PERFIS_ESPECIAIS VARCHAR(255) DEFAULT NULL,
    AMOSTRA_LATERAL VARCHAR(255) DEFAULT NULL,
    SISMICA VARCHAR(255) DEFAULT NULL,
    TABELA_TEMPO_PROFUNDIDADE VARCHAR(255) DEFAULT NULL,
    DADOS_DIRECIONAIS VARCHAR(255) DEFAULT NULL,
    TESTE_A_CABO VARCHAR(255) DEFAULT NULL,
    TESTE_DE_FORMACAO VARCHAR(255) DEFAULT NULL,
    CANHONEIO VARCHAR(255) DEFAULT NULL,
    TESTEMUNHO VARCHAR(255) DEFAULT NULL,
    GEOQUIMICA VARCHAR(255) DEFAULT NULL,
    SIG_SONDA VARCHAR(255) DEFAULT NULL,
    NOM_SONDA VARCHAR(255) DEFAULT NULL,
    ATINGIU_PRESAL VARCHAR(255) DEFAULT NULL,
    DHA_ATUALIZACAO VARCHAR(255) DEFAULT NULL
);

CREATE TABLE `historico_visitas` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `usuario_id` INT NOT NULL,
    `dados_anp_id` INT NOT NULL,
    `data_visita` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`usuario_id`) REFERENCES `usuarios`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`dados_anp_id`) REFERENCES `dados_anp`(`id`) ON DELETE CASCADE
	 );


-- Adicionando a primeira empresa (Petrobras)
INSERT INTO empresas (razao_social, nome_fantasia, cnpj, cep, rua, numero, complemento, bairro, cidade, estado, plano)
VALUES ('Petróleo Brasileiro S/A Petrobras', 'Petrobras', '33.000.167/0001-01', '20031-912', 'Avenida República do Chile', '65', '', 'Centro', 'Rio de Janeiro', 'RJ', 'Premium');

-- Obtendo o ID da empresa adicionada
SET @empresa_id_petrobras = LAST_INSERT_ID();

-- Adicionando o administrador da Petrobras
INSERT INTO usuarios (nome, email, senha, admin, empresa_id)
VALUES ('Sylvia dos Anjos', 's.anjos@petrobras.com.br', '123456', 1, @empresa_id_petrobras);

-- Adicionando os usuários da Petrobras
INSERT INTO usuarios (nome, email, senha, admin, empresa_id)
VALUES ('Maria Clara Miguel', 'm.clara@petrobras.com.br', '123456', 0, @empresa_id_petrobras);

INSERT INTO usuarios (nome, email, senha, admin, empresa_id)
VALUES ('Isadora Júlia Oliveira', 'isadora.julia@petrobras.com.br', '123456', 0, @empresa_id_petrobras);

-- Adicionando a segunda empresa fictícia (Petroleo Mais S/A)
INSERT INTO empresas (razao_social, nome_fantasia, cnpj, cep, rua, numero, complemento, bairro, cidade, estado, plano)
VALUES ('Petroleo Mais S/A', 'PetroMais', '12.345.678/0001-90', '01000-000', 'Rua Fictícia', '123', '', 'Centro', 'São Paulo', 'SP', 'Padrão');

-- Obtendo o ID da empresa adicionada
SET @empresa_id_ficticia = LAST_INSERT_ID();

-- Adicionando o administrador da Empresa Fictícia
INSERT INTO usuarios (nome, email, senha, admin, empresa_id)
VALUES ('Caio Santos', 'c.santos@petromais.com', '123456', 1, @empresa_id_ficticia);

-- Adicionando os usuários da Empresa Fictícia
INSERT INTO usuarios (nome, email, senha, admin, empresa_id)
VALUES ('Cecília Flores', 'c.flores@petromais.com', '123456', 0, @empresa_id_ficticia);

INSERT INTO usuarios (nome, email, senha, admin, empresa_id)
VALUES ('Rafael Novaes', 'r.novaes@petromais.com', '123456', 0, @empresa_id_ficticia);


INSERT INTO `dados_anp` (`id`, `POCO`, `CADASTRO`, `OPERADOR`, `POCO_OPERADOR`, `ESTADO`, `BACIA`, `BLOCO`, `SIG_CAMPO`, `CAMPO`, `TERRA_MAR`, `POCO_POS_ANP`, `TIPO`, `CATEGORIA`, `RECLASSIFICACAO`, `SITUACAO`, `INICIO`, `TERMINO`, `CONCLUSAO`, `TITULARIDADE`, `LATITUDE_BASE_4C`, `LONGITUDE_BASE_4C`, `LATITUDE_BASE_DD`, `LONGITUDE_BASE_DD`, `DATUM_HORIZONTAL`, `TIPO_DE_COORDENADA_DE_BASE`, `DIRECAO`, `PROFUNDIDADE_VERTICAL_M`, `PROFUNDIDADE_SONDADOR_M`, `PROFUNDIDADE_MEDIDA_M`, `REFERENCIA_DE_PROFUNDIDADE`, `MESA_ROTATIVA`, `COTA_ALTIMETRICA_M`, `LAMINA_D_AGUA_M`, `DATUM_VERTICAL`, `UNIDADE_ESTRATIGRAFICA`, `GEOLOGIA_GRUPO_FINAL`, `GEOLOGIA_FORMACAO_FINAL`, `GEOLOGIA_MEMBRO_FINAL`, `CDPE`, `AGP`, `PC`, `PAG`, `PERFIS_CONVENCIONAIS`, `DURANTE_PERFURACAO`, `PERFIS_DIGITAIS`, `PERFIS_PROCESSADOS`, `PERFIS_ESPECIAIS`, `AMOSTRA_LATERAL`, `SISMICA`, `TABELA_TEMPO_PROFUNDIDADE`, `DADOS_DIRECIONAIS`, `TESTE_A_CABO`, `TESTE_DE_FORMACAO`, `CANHONEIO`, `TESTEMUNHO`, `GEOQUIMICA`, `SIG_SONDA`, `NOM_SONDA`, `ATINGIU_PRESAL`, `DHA_ATUALIZACAO`) VALUES
(1, '1-BRSA-1059-AM', '14020026101', 'Petrobras', '1NCB1AM', 'AM', 'Solimões', 'SOL-T-171', '', '', 'T', 'S', '1', 'Pioneiro', 'PORTADOR DE PETRÓLEO E GÁS NATURAL', 'ARRASADO', '2012-03-12', '2012-07-09', '2012-07-10', 'Público', '-04:32:38', '-65:20:04', '-4,543933056', '-65,33444806', 'SIRGAS2000', 'Definitiva', 'Vertical', '-3470,3', '3546', '3550,3', 'MR', '79', '72,6', '0', 'NM', '', '', '', '', 'Existe', '', 'Existe', 'Existe', 'Existe', 'Existe', '', '', '', 'Existe', 'Existe', '', '', 'Existe', '', '', 'Existe', 'Existe', 'QG-V', 'Queiroz Galvão V', 'I', '2024-02-27'),
(2, '2-INST-1-AM', '140100009000', '', '2INST0001  AM', 'AM', 'Acre', 'Brasil', '', '', 'T', 'N', '2', 'Estratigráfico', 'SECO SEM INDÍCIOS', 'ARRASADO', '1959-11-19', '1959-12-24', '1959-12-24', 'Público', '-07:14:01', '-72:18:24', '-7,23348', '-72,30658472', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2203,7', '', 'MR', '188', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-02-27'),
(3, '1-BI-1-BA', '202300098800', '', '1BI  0001  BA', 'BA', 'Tucano Sul', 'Brasil', '', '', 'T', 'N', '1', 'Pioneiro', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1960-09-19', '1960-10-30', '1960-10-30', 'Público', '-11:37:55', '-38:48:41', '-11,63202306', '-38,81143278', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '996,8', '', 'MR', '202', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', '', 'SC-18', 'SONDA CONVENCIONAL 18', '', '2024-02-27'),
(4, '7-CP-1766D-SE', '90120024721', 'Carmo', '7CP1766DSE', 'SE', 'Sergipe', 'CP', 'CP', 'CARMÓPOLIS', 'T', 'S', '7', 'Desenvolvimento', 'PRODUTOR COMERCIAL DE PETRÓLEO', 'PRODUZINDO', '2010-04-28', '2010-05-09', '2010-05-09', 'Público', '-10:39:30', '-36:57:10', '-10,65837444', '-36,95272528', 'SIRGAS2000', 'Definitiva', 'Direcional', '-867,89', '910', '911', 'MR', '11', '6,73', '0', 'NM', '', '', '', '', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', '', 'BCH-06', 'BCH Energy 6', '', '2024-02-27'),
(5, '2-CP-1-MA', '500900058200', 'Eneva', '2CP  0001  MA', 'MA', 'Parnaíba', 'PN-T-68', 'GVA', 'GAVIÃO AZUL', 'T', 'N', '2', 'Estratigráfico', 'SECO COM INDÍCIOS GÁS NATURAL', 'FECHADO', '1987-07-04', '1987-10-27', '1987-10-27', 'Público', '-04:45:51', '-44:17:51', '-4,764227222', '-44,29736778', 'SIRGAS2000', 'Definitiva', 'Vertical', '0', '3423', '0', 'MR', '112', '0', '0', 'NM', '', 'Canindé', 'Cabeças', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', 'Existe', 'GREAT120 (TUS 120)', 'GREAT - 120', 'I', '2024-02-27'),
(6, '2-IZST-1-MA', '500900012900', '', '2IZST0001  MA', 'MA', 'Parnaíba', 'Brasil', '', '', 'T', 'N', '2', 'Estratigráfico', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1960-12-19', '1961-05-21', '1961-05-21', 'Público', '-05:31:39', '-47:29:27', '-5,527375', '-47,49079917', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2176,8', '', 'MR', '119', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'SC-24', 'SONDA CONVENCIONAL 24', '', '2024-02-27'),
(7, '1-MA-2-PI', '680900017200', '', '1MA  0002  PI', 'PI', 'Parnaíba', 'Brasil', '', '', 'T', 'N', '1', 'Pioneiro', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1963-07-11', '1964-07-13', '1964-07-13', 'Público', '-04:50:58', '-42:46:33', '-4,849348611', '-42,77586972', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2029,2', '', 'MR', '110', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'SC-15', 'SONDA CONVENCIONAL 15', '', '2024-02-27'),
(8, '2-SM-1-MT', '543200752800', '', '2SM  0001  MT', 'MT', 'Parecis - Alto Xingu', 'Brasil', '', '', 'T', 'N', '2', 'Estratigráfico', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1995-01-30', '1995-11-20', '1995-11-20', 'Público', '-13:30:46', '-55:24:39', '-13,51271194', '-55,41094', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '5777', '', 'MR', '406', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', '', '', '', '', 'Existe', 'SC113', '', '', '2024-02-27'),
(9, '2-TL-1-MS', '563000705600', '', '2TL  0001  MS', 'MS', 'Paraná', 'Brasil', '', '', 'T', 'N', '2', 'Estratigráfico', 'SECO SEM INDÍCIOS', 'CEDIDO PARA A CAPTAÇÃO DE ÁGUA', '1962-06-29', '1963-09-05', '1963-09-05', 'Público', '-20:52:46', '-51:45:02', '-20,87947472', '-51,7505325', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '4582', '', 'MR', '316', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'SC-57', 'SONDA CONVENCIONAL 57', '', '2024-02-27'),
(10, '1-API-1-PR', '643000752300', '', '1API 0001  PR', 'PR', 'Paraná', 'Brasil', '', '', 'T', 'N', '1', 'Pioneiro', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1991-05-07', '1992-01-13', '1992-01-13', 'Público', '-24:05:02', '-53:31:36', '-24,08395278', '-53,52671583', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '5909', '', 'MR', '324,29998', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', 'Existe', 'SC113', '', '', '2024-02-27'),
(11, '1-GO-1-SC', '823000008300', '', '1GO  0001  SC', 'SC', 'Paraná', 'Brasil', '', '', 'T', 'N', '1', 'Pioneiro', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1981-11-25', '1982-06-10', '1982-06-10', 'Público', '-26:22:59', '-52:42:37', '-26,38306', '-52,71019639', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '4110,9', '', 'MR', '903', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'EE-2', '', '', '2024-02-27'),
(12, '1-TI-1-SP', '863000010200', '', '1TI  0001  SP', 'SP', 'Paraná', 'Brasil', '', '', 'T', 'N', '1', 'Pioneiro', 'SECO COM INDÍCIOS GÁS NATURAL', 'ABANDONADO PERMANENTEMENTE', '1982-05-01', '1982-10-09', '1982-10-09', 'Público', '-22:21:14', '-51:40:25', '-22,35397417', '-51,67371611', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '4814', '', 'MR', '331', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', 'Existe', 'EG-2', '', '', '2024-02-27'),
(13, '1-RM-1-AM', '140300011500', '', '1RM  0001  AM', 'AM', 'Amazonas', 'Brasil', '', '', 'T', 'N', '1', 'Pioneiro', 'SECO COM INDÍCIOS DE PETRÓLEO E GÁS NATURAL', 'ARRASADO', '1960-07-02', '1960-10-15', '1960-10-15', 'Público', '-03:27:20', '-59:35:45', '-3,455624444', '-59,59592389', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '1855,4', '', 'MR', '32,2', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'SC-22', 'SONDA CONVENCIONAL 22', '', '2024-02-27'),
(14, '1-ALS-11-AL', '81160163400', '', '1ALS 0011  AL', 'AL', 'Alagoas', 'Brasil', '', '', 'M', 'N', '1', 'Pioneiro', 'DESCOBRIDOR DE CAMPO COM PETRÓLEO', 'ABANDONADO PERMANENTEMENTE', '1975-08-14', '1975-10-23', '1975-10-23', 'Público', '-10:14:19', '-36:09:16', '-10,23856361', '-36,15433306', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '', '', 'MR', '20,5', '', '12', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'PA-2', '', '', '2024-02-27'),
(15, '1-RM-1-AC', '40100047000', '', '1RM  0001  AC', 'AC', 'Acre', 'Brasil', '', '', 'T', 'N', '1', 'Pioneiro', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1982-07-03', '1983-02-01', '1983-02-01', 'Público', '-08:02:34', '-73:13:11', '-8,042874722', '-73,21974944', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '', '', 'MR', '237', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'SM-8', '', '', '2024-02-27'),
(16, '1-CES-46-CE', '300960138400', '', '1CES 0046  CE', 'CE', 'Ceará', 'Brasil', '', '', 'M', 'N', '1', 'Pioneiro', 'SECO SEM INDÍCIOS', 'ABANDONADO AGUARDANDO ABANDONO DEFINITIVO/ARRASAMENTO', '1983-05-10', '1983-09-12', '1983-09-12', 'Público', '-02:41:36', '-39:43:24', '-2,693468611', '-39,72322667', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '3294', '', 'MR', '22', '', '19', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', 'Existe', '', '', '', '', 'Existe', 'PA18', '', '', '2024-02-27'),
(17, '1-RC-1-GO', '442750015700', '', '1RC  0001  GO', 'GO', 'São Francisco', 'Brasil', '', '', 'T', 'N', '1', 'Pioneiro', 'SECO SEM INDÍCIOS', 'DEVOLVIDO', '1989-01-27', '1989-03-12', '1989-03-12', 'Público', '-14:33:12', '-46:19:44', '-14,55319528', '-46,32877722', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '1203', '', 'MR', '708', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', '', '', '', '', '', '', '', 'Existe', 'SC-60', 'SONDA CONVENCIONAL 60', '', '2024-02-27'),
(18, '1-TU-1-RR', '780400041700', '', '1TU  0001  RR', 'RR', 'Tacutu', 'Brasil', '', '', 'T', 'N', '1', 'Pioneiro', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1980-12-16', '1981-02-24', '1981-02-24', 'Público', '	+03:27:15,977', '-60:00:55', '+3,4544380555', '-60,015145', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '2428,8', '', 'MR', '98', '', '', '', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', 'Existe', 'SM-2', '', '', '2024-02-27'),
(19, '1-PTRA-2-MG', '58275025665', 'Petra Energia', '1RP1MG', 'MG', 'São Francisco', 'SF-T-125', '', '', 'T', 'S', '1', 'Pioneiro', 'PORTADOR DE GÁS NATURAL', 'OUTRO', '2012-02-14', '2012-06-16', '2012-06-27', 'Público', '-18:02:18', '-46:08:59', '-18,03824139', '-46,1496', 'SIRGAS2000', 'Definitiva', 'Vertical', '-2152,2', '3000', '3004', 'MR', '851,8', '844', '0', 'NM', '', '', '', '', 'Existe', '', 'Existe', '', 'Existe', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', 'Existe', 'Existe', 'FV-1', 'FAXE-1', 'I', '2024-02-27'),
(20, '1-APS-41-AP', '120510040700', '', '1APS 0041  AP', 'AP', 'Foz do Amazonas', 'Brasil', '', '', 'M', 'N', '1', 'Pioneiro', 'SECO SEM INDÍCIOS', 'ABANDONADO PERMANENTEMENTE', '1980-08-03', '1980-11-08', '1980-11-08', 'Público', '	+02:40:59,084', '-49:05:21', '+2,6830788888', '-49,08914417', 'SIRGAS2000', 'Definitiva', 'Vertical', '', '4211', '', 'MR', '23', '', '36', 'NM', '', '', '', '', '', 'Existe', 'Existe', '', '', '', 'Existe', '', '', '', 'Existe', 'Existe', '', '', '', '', '', 'Existe', 'PA15', '', '', '2024-02-27');




