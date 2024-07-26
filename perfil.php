<?php
include 'includes/protect.php';
include 'includes/header.php';
include 'includes/conexao.php'; // Inclua o arquivo de conexão com o banco de dados

// Suponha que o ID do usuário logado esteja armazenado na sessão
$user_id = $_SESSION['id'];

// Verifica se está logado e se é um administrador
if (!isset($_SESSION['id']) || $_SESSION['admin'] != 1) {
    header("Location: index.php"); // Redireciona para a página inicial se não for admin
    exit;
}

// Consultando os dados do usuário junto com os dados da empresa
$sql = "SELECT u.nome AS nome, u.email, u.senha, e.cnpj, e.razao_social, e.nome_fantasia, e.cep, e.rua, e.numero, e.complemento, e.bairro, e.cidade, e.estado
        FROM usuarios u 
        JOIN empresas e ON u.empresa_id = e.id 
        WHERE u.id = ?";
$stmt = $mysqli->prepare($sql);

// Verifique se a preparação da consulta foi bem-sucedida
if ($stmt === false) {
    die("Erro na preparação da consulta: " . $mysqli->error);
}

$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

// Verificando se encontrou o usuário
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $nomeAdministrador = $row['nome'];
    $email = $row['email'];
    $senha = $row['senha'];
    $nomeEmpresa = $row['razao_social'];
    $nomeFantasia = $row['nome_fantasia'];
    $cnpj = $row['cnpj'];
    $cep = $row['cep'];
    $rua = $row['rua'];
    $numero = $row['numero'];
    $complemento = $row['complemento'];
    $bairro = $row['bairro'];
    $cidade = $row['cidade'];
    $estado = $row['estado'];

} else {
    // Definindo valores padrão ou redirecionando para uma página de erro
    $nomeAdministrador = 'Nome do Administrador';
    $email = 'email@example.com';
    $nomeEmpresa = 'Nome da Empresa';
    $nomeFantasia = 'Nome Fantasia';
    $cnpj = '00.000.000/0000-00';
    $cep = '';
    $rua = '';
    $numero = '';
    $complemento = '';
    $bairro = '';
    $cidade = '';
}

$stmt->close();
$mysqli->close();
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/perfil.css">

    <title>Perfil</title>

    <style>
        .editando .form-group input {
            background-color: #f9f9f9;
        }
    </style>
</head>

<body>

    <div class="container">
        <!-- Quadro de foto -->
        <div class="foto_perfil">
            <img id="Image"
                src="https://media.bzi.ro/unsafe/0x600/smart/filters:contrast(3):format(jpeg):quality(100)/http://www.bzi.ro/wp-content/uploads/2022/01/farapoza-de-profil.jpg"
                alt="Foto de Perfil">
        </div>

        <!-- Link para alterar foto -->
        <a class="editar" href="">Editar foto</a>
        <h3>Empresa <?php echo htmlspecialchars($_SESSION['plano']); ?></h3>

        <!-- Formulário -->
        <form id="formulario-perfil" action="includes/atualizar_perfil.php" method="post">
            <div class="form-group">
                <label for="administrador">Administrador</label>
                <input type="text" id="administrador" name="nome"
                    value="<?php echo htmlspecialchars($nomeAdministrador); ?>" readonly>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($email); ?>" readonly>
            </div>
            <hr>
            <div class="form-group">
                <label for="empresa">Nome da empresa</label>
                <input type="text" id="empresa" name="razao_social"
                    value="<?php echo htmlspecialchars($nomeEmpresa); ?>" readonly>
            </div>

            <div class="form-group">
                <label for="nome_fantasia">Nome Fantasia</label>
                <input type="text" id="nome_fantasia" name="nome_fantasia"
                    value="<?php echo htmlspecialchars($nomeFantasia); ?>" readonly>
            </div>

            <div class="form-group">
                <label for="cnpj">CNPJ</label>
                <input type="text" id="cnpj" name="cnpj" value="<?php echo htmlspecialchars($cnpj); ?>" readonly>
            </div>

            <div class="form-group">
                <label for="cep">CEP</label>
                <input type="text" id="cep" name="cep" value="<?php echo htmlspecialchars($cep); ?>" readonly>
            </div>

            <div class="form-group">
                <label for="rua">Rua</label>
                <input type="text" id="rua" name="rua" value="<?php echo htmlspecialchars($rua); ?>" readonly>
            </div>

            <div class="form-group">
                <label for="numero">Número</label>
                <input type="text" id="numero" name="numero" value="<?php echo htmlspecialchars($numero); ?>" readonly>
            </div>

            <div class="form-group">
                <label for="complemento">Complemento</label>
                <input type="text" id="complemento" name="complemento"
                    value="<?php echo htmlspecialchars($complemento); ?>" readonly>
            </div>

            <div class="form-group">
                <label for="bairro">Bairro</label>
                <input type="text" id="bairro" name="bairro" value="<?php echo htmlspecialchars($bairro); ?>" readonly>
            </div>

            <div class="form-group">
                <label for="cidade">Cidade</label>
                <input type="text" id="cidade" name="cidade" value="<?php echo htmlspecialchars($cidade); ?>" readonly>
            </div>

            <div class="form-group">
                <label for="estado">Estado</label>
                <input type="text" id="estado" name="estado" value="<?php echo htmlspecialchars($estado); ?>" readonly>
            </div>

            

            <a class="editar-informacoes" href="javascript:void(0);">Editar informações</a>

            <hr class="hr">
            <h1>Senha</h1>
            <div class="form-group">
                <label for="senha">Redefinir senha</label>
                <input type="password" id="senha" name="senha" placeholder="Nova senha">
            </div>

            <div class="form-group">
                <label for="confirmar_senha">Confirmar Senha</label>
                <input type="password" id="confirmar_senha" name="confirmar_senha" placeholder="Confirmar senha">
            </div>

            <div class="button-group">
                <button class="salvar" type="submit">Salvar</button>
            </div>
        </form>

    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const formPerfil = document.getElementById('formulario-perfil');
            const editarBtn = document.querySelector('.editar-informacoes');
            const salvarBtn = document.querySelector('.salvar');
            const senha = document.getElementById('senha');
            const confirmarSenha = document.getElementById('confirmar_senha');

            // Adiciona evento de clique ao botão de editar informações
            editarBtn.addEventListener('click', function () {
                formPerfil.classList.add('editando');
                // Habilita todos os inputs
                formPerfil.querySelectorAll('.form-group input').forEach(input => {
                    input.removeAttribute('readonly');
                });
            });

            // Adiciona evento de clique ao botão de salvar
            salvarBtn.addEventListener('click', function (event) {
                // Verifica se as senhas coincidem
                if (senha.value !== confirmarSenha.value) {
                    event.preventDefault(); // Impede o envio do formulário
                    alert('As senhas não coincidem. Por favor, tente novamente.');
                } else {
                    alert('Informações atualizadas com sucesso!');
                }
            });
        });
    </script>

</body>

</html>