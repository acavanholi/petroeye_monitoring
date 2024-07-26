<?php
include 'protect.php'; // Inclua o arquivo de proteção de acesso, se necessário
include 'conexao.php'; // Inclua o arquivo de conexão com o banco de dados

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Suponha que o ID do usuário logado esteja armazenado na sessão
    if (!isset($_SESSION)) {
        session_start();
    }
    $user_id = $_SESSION['id'] ?? null;

    // Verifique se o ID do usuário está presente na sessão
    if (!$user_id) {
        die("ID de usuário não encontrado na sessão.");
    }

    // Coleta dos dados do formulário
    $nome = $_POST['nome'] ?? '';
    $email = $_POST['email'] ?? '';
    $senha = $_POST['senha'] ?? '';
    $confirmar_senha = $_POST['confirmar_senha'] ?? ''; // Captura o campo de confirmação de senha
    $razao_social = $_POST['razao_social'] ?? '';
    $nome_fantasia = $_POST['nome_fantasia'] ?? '';
    $cnpj = $_POST['cnpj'] ?? '';
    $cep = $_POST['cep'] ?? '';
    $rua = $_POST['rua'] ?? '';
    $numero = $_POST['numero'] ?? '';
    $complemento = $_POST['complemento'] ?? '';
    $bairro = $_POST['bairro'] ?? '';
    $cidade = $_POST['cidade'] ?? '';
    $estado = $_POST['estado'] ?? '';
    $plano = $_POST['plano'] ?? ''; // Captura o plano, se fornecido

    // Verifica se as senhas coincidem
    if (!empty($senha) && $senha !== $confirmar_senha) {
        die("As senhas não coincidem. Por favor, verifique.");
    }

    // Use a senha diretamente, sem hash, se for fornecida
    $senha_atualizada = !empty($senha) ? $senha : null;

    // Criação da query SQL dinamicamente com base na presença do valor do plano
    $sql = "UPDATE usuarios u
            JOIN empresas e ON u.empresa_id = e.id
            SET u.nome = ?, u.email = ?, u.senha = COALESCE(?, u.senha), e.razao_social = ?, e.nome_fantasia = ?, e.cnpj = ?, e.cep = ?, e.rua = ?, e.numero = ?, e.complemento = ?, e.bairro = ?, e.cidade = ?, e.estado = ?";

    // Adiciona o campo de plano à query se ele estiver definido
    if (!empty($plano)) {
        $sql .= ", e.plano = ?";
    }

    $sql .= " WHERE u.id = ?";

    // Preparação da declaração SQL
    $stmt = $mysqli->prepare($sql);
    if ($stmt === false) {
        die("Erro na preparação da atualização: " . $mysqli->error);
    }
    
    // Bind dos parâmetros e execução da query
    if (!empty($plano)) {
        $stmt->bind_param("ssssssssssssssi", $nome, $email, $senha_atualizada, $razao_social, $nome_fantasia, $cnpj, $cep, $rua, $numero, $complemento, $bairro, $cidade, $estado, $plano, $user_id);
    } else {
        $stmt->bind_param("sssssssssssssi", $nome, $email, $senha_atualizada, $razao_social, $nome_fantasia, $cnpj, $cep, $rua, $numero, $complemento, $bairro, $cidade, $estado, $user_id);
    }

    if ($stmt->execute()) {
        // Redirecionamento para a página de perfil após a atualização
        header("Location: ../perfil.php");
        exit();
    } else {
        echo "Erro ao atualizar o perfil: " . $stmt->error;
    }

    // Fechamento do statement e da conexão
    $stmt->close();
    $mysqli->close();
} else {
    // Redirecionamento em caso de método de requisição inválido
    header("Location: ../perfil.php");
    exit();
}
