<?php
include 'conexao.php'; // Inclua o arquivo de conexão com o banco de dados

// Suponha que o ID do usuário logado esteja armazenado na sessão
if (!isset($_SESSION)) {
    session_start();
}
$user_id = $_SESSION['id'] ?? null;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verifique se o ID do usuário está presente na sessão
    if (!$user_id) {
        die("ID de usuário não encontrado na sessão.");
    }

    // Coleta dos dados do formulário
    $nome = $_POST['nome'] ?? '';
    $email = $_POST['email'] ?? '';
    $senha = $_POST['senha'] ?? '';
    $confirmar_senha = $_POST['confirmar_senha'] ?? '';

    // Verifica se as senhas coincidem
    if (!empty($senha) && $senha !== $confirmar_senha) {
        die("As senhas não coincidem. Por favor, verifique.");
    }

    // Use a senha diretamente, sem hash, se for fornecida
    $senha_atualizada = !empty($senha) ? $senha : null;

    // Query SQL para atualizar apenas os dados do usuário
    $sql = "UPDATE usuarios
            SET nome = ?, email = ?, senha = COALESCE(?, senha)
            WHERE id = ?";

    // Preparação da declaração SQL
    $stmt = $mysqli->prepare($sql);
    if ($stmt === false) {
        die("Erro na preparação da atualização: " . $mysqli->error);
    }
    
    // Bind dos parâmetros e execução da query
    $stmt->bind_param("sssi", $nome, $email, $senha_atualizada, $user_id);
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
