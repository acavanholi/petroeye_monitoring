<?php
include 'includes/protect.php';
include 'includes/header.php';
include 'includes/conexao.php';

// Verifica se o termo de pesquisa foi fornecido
if (!isset($_GET['q']) || empty(trim($_GET['q']))) {
    // Redireciona para a página inicial ou exibe uma mensagem de erro
    header("Location: index.php");
    exit();
}

// Obtém o termo de pesquisa da URL
$searchTerm = $_GET['q'];

// Inicializa a consulta SQL
$sql = "SELECT * FROM dados_anp WHERE CONCAT_WS(' ', 
    POCO, CADASTRO, OPERADOR, POCO_OPERADOR, ESTADO, BACIA, BLOCO, SIG_CAMPO, CAMPO, 
    TERRA_MAR, POCO_POS_ANP, TIPO, CATEGORIA, RECLASSIFICACAO, SITUACAO, INICIO, 
    TERMINO, CONCLUSAO, TITULARIDADE, LATITUDE_BASE_4C, LONGITUDE_BASE_4C, LATITUDE_BASE_DD, 
    LONGITUDE_BASE_DD, DATUM_HORIZONTAL, TIPO_DE_COORDENADA_DE_BASE, DIRECAO, 
    PROFUNDIDADE_VERTICAL_M, PROFUNDIDADE_SONDADOR_M, PROFUNDIDADE_MEDIDA_M, 
    REFERENCIA_DE_PROFUNDIDADE, MESA_ROTATIVA, COTA_ALTIMETRICA_M, LAMINA_D_AGUA_M, 
    DATUM_VERTICAL, UNIDADE_ESTRATIGRAFICA, GEOLOGIA_GRUPO_FINAL, GEOLOGIA_FORMACAO_FINAL, 
    GEOLOGIA_MEMBRO_FINAL, CDPE, AGP, PC, PAG, PERFIS_CONVENCIONAIS, DURANTE_PERFURACAO, 
    PERFIS_DIGITAIS, PERFIS_PROCESSADOS, PERFIS_ESPECIAIS, AMOSTRA_LATERAL, SISMICA, 
    TABELA_TEMPO_PROFUNDIDADE, DADOS_DIRECIONAIS, TESTE_A_CABO, TESTE_DE_FORMACAO, CANHONEIO, 
    TESTEMUNHO, GEOQUIMICA, SIG_SONDA, NOM_SONDA, ATINGIU_PRESAL, DHA_ATUALIZACAO) LIKE ?";

// Adiciona filtros adicionais à consulta SQL
$filtros = [
    'categoria' => 'CATEGORIA',
    'situação' => 'SITUACAO',
    'titularidade' => 'TITULARIDADE',
    'tipo de coordenada' => 'TIPO_DE_COORDENADA_DE_BASE',
    'direção' => 'DIRECAO',
    'geoquímica' => 'GEOQUIMICA',
    'dataInicio' => 'INICIO >= ?',
    'dataTermino' => 'TERMINO <= ?'
];

$types = 's'; // Tipo do parâmetro de busca
$params = ["%{$searchTerm}%"];


// Adiciona os filtros gerais
foreach ($filtros as $filtro => $coluna) {
    if (isset($_GET[$filtro]) && $_GET[$filtro] !== '- Limpar Filtro -') {
        if ($filtro !== 'dataInicio' && $filtro !== 'dataTermino') {
            $sql .= " AND {$coluna} = ?";
            $params[] = $_GET[$filtro];
            $types .= 's';
        }
    }
}

// Adiciona os filtros de data
if (isset($_GET['dataInicio']) && !empty(trim($_GET['dataInicio']))) {
    $sql .= " AND INICIO >= ?";
    $params[] = $_GET['dataInicio'];
    $types .= 's';
}

if (isset($_GET['dataTermino']) && !empty(trim($_GET['dataTermino']))) {
    $sql .= " AND TERMINO <= ?";
    $params[] = $_GET['dataTermino'];
    $types .= 's';
}

// Adiciona a cláusula ORDER BY
$sql .= " ORDER BY POCO";

// Prepara a declaração
$stmt = $mysqli->prepare($sql);
if (!$stmt) {
    die('Prepare failed: (' . $mysqli->errno . ') ' . $mysqli->error);
}

// Vincula os parâmetros e executa a declaração
$stmt->bind_param($types, ...$params);
$stmt->execute();

// Obtém o resultado
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/resultados.css" />
    <link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
    <title>Filtros</title>
</head>

<body>

    <div class="filtros">
        <div class="filtro-container">
            <img src="assets/img/filtro.png" alt="Filter Icon" class="filtroicon">
            <h5 class="filtros-title">Filtros</h5>
        </div>

        <!-- Dropdown 1 -->
        <div class="dropdown">
            <div class="default_option" data-default-text="Categoria">
                <?php
                $selectedCategory = isset($_GET['categoria']) ? htmlspecialchars($_GET['categoria']) : 'Categoria';
                echo $selectedCategory;
                ?>
            </div>
            <ul>
                <?php
                $categoria_options = ['- Limpar Filtro -', 'Desenvolvimento', 'Especial', 'Estratigráfico', 'Extensão', 'Injeção', 'Jazida Mais Profunda', 'Jazida mais rasa', 'Pioneiro', 'Pioneiro Adjacente'];
                foreach ($categoria_options as $option) {
                    $currentParams = $_GET;
                    if ($option === '- Limpar Filtro -') {
                        unset($currentParams['categoria']);
                    } else {
                        $currentParams['categoria'] = $option;
                    }
                    $queryString = http_build_query($currentParams);
                    $selected = (isset($_GET['categoria']) && $_GET['categoria'] === $option) ? 'selected' : '';
                    echo "<li><a href=\"?$queryString\" $selected>$option</a></li>";
                }
                ?>
            </ul>
        </div>

        <!-- Dropdown 2 -->
        <div class="dropdown">
            <div class="default_option" data-default-text="Situação">
                <?php
                $situacaoSelected = isset($_GET['situação']) ? htmlspecialchars($_GET['situação']) : 'Situação';
                echo $situacaoSelected;
                ?>
            </div>
            <ul>
                <?php
                $situacao_options = ['- Limpar Filtro -', 'Abandonado', 'Arrasado', 'Cedido para a captação de água', 'Devolvido', 'Equipado', 'Fechado', 'Injetando', 'Operação', 'Produzindo'];
                foreach ($situacao_options as $option) {
                    $currentParams = $_GET;
                    if ($option === '- Limpar Filtro -') {
                        unset($currentParams['situação']);
                    } else {
                        $currentParams['situação'] = $option;
                    }
                    $queryString = http_build_query($currentParams);
                    $selected = (isset($_GET['situação']) && $_GET['situação'] === $option) ? 'selected' : '';
                    echo "<li><a href=\"?$queryString\" $selected>$option</a></li>";
                }
                ?>
            </ul>
        </div>

        <!-- Dropdown 3 -->
        <div class="dropdown">
            <div class="default_option" data-default-text="Titularidade">
                <?php
                $titularidadeSelected = isset($_GET['titularidade']) ? htmlspecialchars($_GET['titularidade']) : 'Titularidade';
                echo $titularidadeSelected;
                ?>
            </div>
            <ul>
                <?php
                $titularidade_options = ['- Limpar Filtro -', 'Confidencial', 'Público'];
                foreach ($titularidade_options as $option) {
                    $currentParams = $_GET;
                    if ($option === '- Limpar Filtro -') {
                        unset($currentParams['titularidade']);
                    } else {
                        $currentParams['titularidade'] = $option;
                    }
                    $queryString = http_build_query($currentParams);
                    $selected = (isset($_GET['titularidade']) && $_GET['titularidade'] === $option) ? 'selected' : '';
                    echo "<li><a href=\"?$queryString\" $selected>$option</a></li>";
                }
                ?>
            </ul>
        </div>

        <!-- Dropdown 4 -->
        <div class="dropdown">
            <div class="default_option" data-default-text="Tipo de Coordenada">
                <?php
                $tipoCoordenadaSelected = isset($_GET['tipo_de_coordenada']) ? htmlspecialchars($_GET['tipo_de_coordenada']) : 'Tipo de Coordenada';
                echo $tipoCoordenadaSelected;
                ?>
            </div>
            <ul>
                <?php
                $tipo_coordenada_options = ['- Limpar Filtro -', 'Definitiva', 'Provisória'];
                foreach ($tipo_coordenada_options as $option) {
                    $currentParams = $_GET;
                    if ($option === '- Limpar Filtro -') {
                        unset($currentParams['tipo_de_coordenada']);
                    } else {
                        $currentParams['tipo_de_coordenada'] = $option;
                    }
                    $queryString = http_build_query($currentParams);
                    $selected = (isset($_GET['tipo_de_coordenada']) && $_GET['tipo_de_coordenada'] === $option) ? 'selected' : '';
                    echo "<li><a href=\"?$queryString\" $selected>$option</a></li>";
                }
                ?>
            </ul>
        </div>

        <!-- Dropdown 5 -->
        <div class="dropdown">
            <div class="default_option" data-default-text="Direção">
                <?php
                $direcaoSelected = isset($_GET['direção']) ? htmlspecialchars($_GET['direção']) : 'Direção';
                echo $direcaoSelected;
                ?>
            </div>
            <ul>
                <?php
                $direcao_options = ['- Limpar Filtro -', 'Direcional', 'Horizontal', 'Vertical'];
                foreach ($direcao_options as $option) {
                    $currentParams = $_GET;
                    if ($option === '- Limpar Filtro -') {
                        unset($currentParams['direção']);
                    } else {
                        $currentParams['direção'] = $option;
                    }
                    $queryString = http_build_query($currentParams);
                    $selected = (isset($_GET['direção']) && $_GET['direção'] === $option) ? 'selected' : '';
                    echo "<li><a href=\"?$queryString\" $selected>$option</a></li>";
                }
                ?>
            </ul>
        </div>

        <!-- Dropdown 6 -->
        <div class="dropdown">
            <div class="default_option" data-default-text="Geoquímica">
                <?php
                $geoquimicaSelected = isset($_GET['geoquímica']) ? htmlspecialchars($_GET['geoquímica']) : 'Geoquímica';
                echo $geoquimicaSelected;
                ?>
            </div>
            <ul>
                <?php
                $geoquimica_options = ['- Limpar Filtro -', 'Existe'];
                foreach ($geoquimica_options as $option) {
                    $currentParams = $_GET;
                    if ($option === '- Limpar Filtro -') {
                        unset($currentParams['geoquímica']);
                    } else {
                        $currentParams['geoquímica'] = $option;
                    }
                    $queryString = http_build_query($currentParams);
                    $selected = (isset($_GET['geoquímica']) && $_GET['geoquímica'] === $option) ? 'selected' : '';
                    echo "<li><a href=\"?$queryString\" $selected>$option</a></li>";
                }
                ?>
            </ul>
        </div>




        <!-- Formulário de Data -->
        <form method="GET">
            <div class="datepicker">
                <p>Data de Início</p>
                <input type="date" id="dataInicio" name="dataInicio"
                    value="<?php echo isset($_GET['dataInicio']) ? htmlspecialchars($_GET['dataInicio']) : ''; ?>">
            </div>
            <div class="datepicker">
                <p>Data de Término</p>
                <input type="date" id="dataTermino" name="dataTermino"
                    value="<?php echo isset($_GET['dataTermino']) ? htmlspecialchars($_GET['dataTermino']) : ''; ?>">
            </div>
            <input type="hidden" name="q" value="<?php echo htmlspecialchars($searchTerm); ?>">
            <button type="submit" onclick="filtrar()" class="btn-filtrar">Filtrar</button>
        </form>
    </div>

    <div class="resultados">
        <h5>Resultados para "<?php echo htmlspecialchars($searchTerm); ?>"</h5>
        <?php if ($result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
                <div class="resultado">
                    <div class="nomePOCO">

                        <h3><a
                                href="detalhes.php?id=<?php echo urlencode($row['id']); ?>"><?php echo htmlspecialchars($row['POCO']); ?></a>
                        </h3>

                    </div>


                    <div class="descricao">
                        <ul>
                            <li><b>Cadastro: </b><?php echo htmlspecialchars($row['CADASTRO']); ?></li>
                            <li><b>Operador: </b><?php echo htmlspecialchars($row['OPERADOR']); ?></li>
                            <li><b>Categoria: </b><?php echo htmlspecialchars($row['CATEGORIA']); ?></li>

                            <li><b>Estado: </b><?php echo htmlspecialchars($row['ESTADO']); ?></li>
                            <li><b>Bloco: </b><?php echo htmlspecialchars($row['BLOCO']); ?></li>

                        </ul>
                    </div>
                    <div class="descricao">
                        <ul>
                            <li><b>Reclassificação: </b><?php echo htmlspecialchars($row['RECLASSIFICACAO']); ?></li>
                            <li><b>Situação: </b><?php echo htmlspecialchars($row['SITUACAO']); ?></li>
                            <li><b>Titularidade: </b><?php echo htmlspecialchars($row['TITULARIDADE']); ?></li>

                        </ul>
                    </div>
                    <div class="descricao">
                        <ul>
                            <li><b>Início: </b><?php echo htmlspecialchars($row['INICIO']); ?></li>

                            <li><b>Término: </b><?php echo htmlspecialchars($row['TERMINO']); ?></li>
                            <li><b>Latitude (Base DD): </b><?php echo htmlspecialchars($row['LATITUDE_BASE_DD']); ?></li>
                            <li><b>Longitude (Base DD): </b><?php echo htmlspecialchars($row['LONGITUDE_BASE_DD']); ?></li>
                        </ul>
                    </div>
                </div>
            <?php endwhile; ?>
        <?php else: ?>
            <p>Nenhum resultado encontrado.</p>
        <?php endif; ?>
    </div>

    <?php
    $result->free();
    $stmt->close();
    $mysqli->close();
    include 'includes/footer.php';
    
    ?>

    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="js/resultados.js"></script>
</body>

</html>