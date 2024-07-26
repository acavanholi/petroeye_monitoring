<?php include 'includes/protect.php'; ?>
<?php include 'includes/conexao.php'; ?>
<?php include 'includes/header.php'; 


// Verifica se o usuário tem permissão para acessar
if ($_SESSION['acesso_logistica'] !== 1 && $_SESSION['admin'] !== 1) {
    header('Location: index.php');
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome = $_POST['nome'];
    $cadastro = $_POST['cadastro'];
    $estado = $_POST['estado'];
    $latitude = $_POST['latitude'];
    $longitude = $_POST['longitude'];
    $data_inicio = $_POST['data_inicio'];
    $data_fim = $_POST['data_fim'];
    $TM = $_POST['TM'];
    $situacao = $_POST['situacao'];
    $lamina = $_POST['lamina'];

    // Obtendo o ID do usuário e da empresa da sessão
    $usuario_id = $_SESSION['user_id'];
    $empresa_id = $_SESSION['empresa_id'];

    $sql = "INSERT INTO bacias (nome, cadastro, estado, latitude, longitude, data_inicio, data_fim, TM, situacao, lamina, usuario_id, empresa_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('ssssssssssii', $nome, $cadastro, $estado, $latitude, $longitude, $data_inicio, $data_fim, $TM, $situacao, $lamina, $usuario_id, $empresa_id);

    if ($stmt->execute()) {
        echo "<p>Dados inseridos com sucesso.</p>";
    } else {
        echo "<p>Erro ao inserir dados: " . $stmt->error . "</p>";
    }
}
?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bacias</title>
    <link rel="stylesheet" href="assets/css/style_formularios.css">
</head>

<body>
    <div class="container">
        <div class="menu-block">
            <ul>
                <li><button onclick="location.href='formulario_bacia.php'">Formulário Bacias</button></li>
            </ul>
        </div>
        <div class="menu-block">
            <ul>
                <li><button onclick="location.href='formulario_poco.php'">Formulário Poços</button></li>
            </ul>
        </div>
        <div class="menu-block">
            <ul>
                <li><button onclick="location.href='formulario_campos.php'">Formulário Campos</button></li>
            </ul>
        </div>
    </div>

    <div class="main-container">
        <h1>Bacias</h1>
        <hr>

        <div class="content-container">
            <div class="form-group">
                <div class="form-item">
                    <label for="nome">Nome</label>
                    <input type="text" id="nome"  required>
                </div>
                <div class="form-item">
                    <label for="cadastro">Cadastro</label>
                    <input type="text" id="cadastro" required>
                </div>
                <div class="form-item">
                    <label for="estado">Estado</label>
                    <input type="text" id="estado" placeholder="Ex: ES" required>
                </div>
            </div>
            <div class="form-group">
                <div class="form-item">
                    <label for="latitude">Latitude (Base DD)</label>
                    <input type="text" id="latitude" required>
                </div>
                <div class="form-item">
                    <label for="longitude">Longitude (Base DD)</label>
                    <input type="text" id="longitude" required>
                </div>
                <div class="form-item">
                    <label for="data_inicio">Data de início</label>
                    <input type="text" id="data_inicio" required>
                </div>
            </div>
            <div class="form-group">
                <div class="form-item">
                    <label for="data_fim">Data de término</label>
                    <input type="text" id="data_fim" required>
                </div>
                <div class="form-item">
                    <label for="TM">Terra/Mar</label>
                    <input type="text" id="TM" required>
                </div>
                <div class="form-item">
                    <label for="situacao">Situação</label>
                    <input type="text" id="situacao" required>
                </div>
            </div>
            <div class="form-group">
                <div class="form-item">
                    <label for="lamina">Lâmina d'água</label>
                    <input type="text" id="lamina" required>
                </div>
            </div>
        </div>


        <div class="table-container">
            <p>Quantidade de pessoas no local</p>
            <table id="tablePessoas" class="dataTable">
                <thead>
                    <tr>
                        <th>Data</th>
                        <th>Quantidade</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <div class="button-container">
                <button class="botton" onclick="addRow('tablePessoas')">+Adicionar Linha</button>
            </div>

            <p>Produtos extraídos do local e sua quantidade</p>
            <table id="tableProdutos" class="dataTable">
                <thead>
                    <tr>
                        <th>Data</th>
                        <th>Produto</th>
                        <th>Quantidade</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <div class="button-container">
                <button class="botton" onclick="addRow('tableProdutos')">+Adicionar Linha</button>
            </div>
        </div>

        <div class="action-buttons">
            <button class="botao_enviar" type="submit">Enviar</button>
            <button class="botao_cancelar" type="submit">Cancelar</button>
        </div>
    </div>

    <script src="assets/js/formularios.js"></script>
</body>

</html>