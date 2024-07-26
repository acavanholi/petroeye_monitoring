<?php
include 'includes/protect.php';
include 'includes/header.php';
include 'includes/conexao.php';

// Obtém o ID do usuário logado
$usuarioId = $_SESSION['id'];

// Consulta para obter o histórico de visitas do usuário
$sql = "SELECT hv.*, da.POCO, da.CADASTRO, da.OPERADOR, da.CATEGORIA, da.ESTADO, da.BLOCO, da.RECLASSIFICACAO, da.SITUACAO,da.TITULARIDADE, da.INICIO, da.TERMINO, da.LATITUDE_BASE_DD,da.LONGITUDE_BASE_DD
        FROM historico_visitas hv
        JOIN dados_anp da ON hv.dados_anp_id = da.id
        WHERE hv.usuario_id = ?
        ORDER BY hv.data_visita DESC";

$stmt = $mysqli->prepare($sql);
if (!$stmt) {
    die('Prepare failed: (' . $mysqli->errno . ') ' . $mysqli->error);
}

// Vincula o parâmetro e executa a declaração
$stmt->bind_param('i', $usuarioId);
$stmt->execute();

// Obtém o resultado
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/historico.css" />
    <link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
    <title>Histórico</title>
</head>

<body>

    <div class="resultados">
    <h2>Histórico</h2>
        <?php while ($row = $result->fetch_assoc()): ?>
            <div class="resultado">
                <div class="nomePOCO">
                    <h3><a
                            href="detalhes.php?id=<?php echo urlencode($row['dados_anp_id']); ?>"><?php echo htmlspecialchars($row['POCO']); ?></a>
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
    </div>
    

    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="js/resultados.js"></script>
</body>

</html>

<?php
$stmt->close();
$mysqli->close();
?>