<?php include 'includes/protect.php'; ?>
<?php include 'includes/conexao.php'; ?>
<?php include 'includes/header.php'; 
// Verifica se o usuário tem permissão para acessar
if ($_SESSION['acesso_logistica'] !== 1 && $_SESSION['admin'] !== 1) {
    header('Location: index.php');
    exit();
}?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Campos</title>
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
        <h1>Campos</h1>
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
    </div>

    <script src="assets/js/formularios.js"></script>
</body>

</html>