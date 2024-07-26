<?php
include 'includes/protect.php'; // Protege a página, garantindo que o usuário esteja logado
include 'includes/header.php'; // Inclui o cabeçalho da página
include 'includes/conexao.php'; // Inclui a conexão com o banco de dados

// Obtenha o ID do poço da URL e converta para inteiro
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Verifique se o ID é válido
if ($id <= 0) {
    die('ID inválido.');
}

// Obtenha o ID do usuário da sessão
$user_id = isset($_SESSION['id']) ? intval($_SESSION['id']) : 0;

// Verifique se o ID do usuário é válido
if ($user_id <= 0) {
    die('Usuário inválido.');
}

// Registrar a visita na tabela historico_visitas
$sql = "INSERT INTO historico_visitas (usuario_id, dados_anp_id, data_visita) VALUES (?, ?, NOW())";
$stmt = $mysqli->prepare($sql);
if (!$stmt) {
    die('Erro ao preparar a consulta de inserção: ' . $mysqli->error);
}
$stmt->bind_param("ii", $user_id, $id);
if (!$stmt->execute()) {
    die('Erro ao executar a consulta de inserção: ' . $stmt->error);
}
$stmt->close();

// Prepare a consulta SQL para buscar detalhes do poço
$sql = "SELECT * FROM dados_anp WHERE id = ?";
$stmt = $mysqli->prepare($sql);
if (!$stmt) {
    die('Erro ao preparar a consulta de seleção: ' . $mysqli->error);
}
$stmt->bind_param("i", $id);
if (!$stmt->execute()) {
    die('Erro ao executar a consulta de seleção: ' . $stmt->error);
}
$result = $stmt->get_result();

// Verifique se o poço foi encontrado
if ($result->num_rows === 0) {
    die('Poço não encontrado.');
}

// Obtenha os dados do poço
$row = $result->fetch_assoc();

// Feche a conexão
$stmt->close();
$mysqli->close();
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes do Poço</title>
    <link rel="stylesheet" href="assets/css/detalhes.css">
</head>

<body>
    <div class="container-detalhes">
        <h3 class="nome-poço"><?php echo htmlspecialchars($row['POCO']), ":"; ?>
            <span class="situacao"><?php echo htmlspecialchars($row['SITUACAO']); ?></span>
        </h3>

        <div class="detalhes-descricao">
            <div class="list-container">
                <ul class="list-column">
                    <li><strong>Cadastro:</strong> <?php echo htmlspecialchars($row['CADASTRO']); ?></li>
                    <li><strong>Operador:</strong> <?php echo htmlspecialchars($row['OPERADOR']); ?></li>
                    <li><strong>Poco Operador:</strong> <?php echo htmlspecialchars($row['POCO_OPERADOR']); ?></li>
                    <li><strong>Estado:</strong> <?php echo htmlspecialchars($row['ESTADO']); ?></li>
                    <li><strong>Bacia:</strong> <?php echo htmlspecialchars($row['BACIA']); ?></li>
                    <li><strong>Bloco:</strong> <?php echo htmlspecialchars($row['BLOCO']); ?></li>
                    <li><strong>Sig Campo:</strong> <?php echo htmlspecialchars($row['SIG_CAMPO']); ?></li>
                    <li><strong>Campo:</strong> <?php echo htmlspecialchars($row['CAMPO']); ?></li>
                    <li><strong>Terra Mar:</strong> <?php echo htmlspecialchars($row['TERRA_MAR']); ?></li>
                    <li><strong>Poco Pos ANP:</strong> <?php echo htmlspecialchars($row['POCO_POS_ANP']); ?></li>
                    <li><strong>Tipo:</strong> <?php echo htmlspecialchars($row['TIPO']); ?></li>
                    <li><strong>Categoria:</strong> <?php echo htmlspecialchars($row['CATEGORIA']); ?></li>
                    <li><strong>Reclassificação:</strong> <?php echo htmlspecialchars($row['RECLASSIFICACAO']); ?></li>
                    <li><strong>Situação:</strong> <?php echo htmlspecialchars($row['SITUACAO']); ?></li>
                    <li><strong>Início:</strong> <?php echo htmlspecialchars($row['INICIO']); ?></li>
                    <li><strong>Término:</strong> <?php echo htmlspecialchars($row['TERMINO']); ?></li>
                    <li><strong>Conclusão:</strong> <?php echo htmlspecialchars($row['CONCLUSAO']); ?></li>
                    <li><strong>Titularidade:</strong> <?php echo htmlspecialchars($row['TITULARIDADE']); ?></li>

                </ul>
                <ul class="list-column">
                    <li><strong>Latitude Base 4C:</strong> <?php echo htmlspecialchars($row['LATITUDE_BASE_4C']); ?>
                    </li>
                    <li><strong>Longitude Base 4C:</strong> <?php echo htmlspecialchars($row['LONGITUDE_BASE_4C']); ?>
                    </li>
                    <li><strong>Latitude Base DD:</strong> <?php echo htmlspecialchars($row['LATITUDE_BASE_DD']); ?>
                    </li>
                    <li><strong>Longitude Base DD:</strong> <?php echo htmlspecialchars($row['LONGITUDE_BASE_DD']); ?>
                    </li>
                    <li><strong>Datum Horizontal:</strong> <?php echo htmlspecialchars($row['DATUM_HORIZONTAL']); ?>
                    </li>
                    <li><strong>Tipo de Coordenada de Base:</strong>
                        <?php echo htmlspecialchars($row['TIPO_DE_COORDENADA_DE_BASE']); ?></li>
                    <li><strong>Direção:</strong> <?php echo htmlspecialchars($row['DIRECAO']); ?></li>
                    <li><strong>Profundidade Vertical M:</strong>
                        <?php echo htmlspecialchars($row['PROFUNDIDADE_VERTICAL_M']); ?></li>
                    <li><strong>Profundidade Sondador M:</strong>
                        <?php echo htmlspecialchars($row['PROFUNDIDADE_SONDADOR_M']); ?></li>
                    <li><strong>Profundidade Medida M:</strong>
                        <?php echo htmlspecialchars($row['PROFUNDIDADE_MEDIDA_M']); ?></li>
                    <li><strong>Referência de Profundidade:</strong>
                        <?php echo htmlspecialchars($row['REFERENCIA_DE_PROFUNDIDADE']); ?></li>
                    <li><strong>Mesa Rotativa:</strong> <?php echo htmlspecialchars($row['MESA_ROTATIVA']); ?></li>
                    <li><strong>Cota Altimétrica M:</strong> <?php echo htmlspecialchars($row['COTA_ALTIMETRICA_M']); ?>
                    </li>
                    <li><strong>Lâmina d'Água M:</strong> <?php echo htmlspecialchars($row['LAMINA_D_AGUA_M']); ?></li>
                    <li><strong>Datum Vertical:</strong> <?php echo htmlspecialchars($row['DATUM_VERTICAL']); ?></li>
                    <li><strong>Unidade Estratigráfica:</strong>
                        <?php echo htmlspecialchars($row['UNIDADE_ESTRATIGRAFICA']); ?></li>
                    <li><strong>Geologia Grupo Final:</strong>
                        <?php echo htmlspecialchars($row['GEOLOGIA_GRUPO_FINAL']); ?></li>
                </ul>
            </div>
        </div>

    </div>

</body>

</html>