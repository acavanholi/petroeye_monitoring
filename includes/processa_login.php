<?php
// Inicia a sessão
session_start();

// Incluir arquivo de conexão com o banco de dados
include 'conexao.php';


// Verificar se o formulário foi submetido
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Receber dados do formulário
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    // SQL para verificar usuário
    $sql = "SELECT u.id, u.nome, u.admin, u.empresa_id, e.nome_fantasia, e.plano 
            FROM usuarios u 
            INNER JOIN empresas e ON u.empresa_id = e.id 
            WHERE u.email = ? AND u.senha = ?";
    
    // Preparar a declaração SQL
    $stmt = $mysqli->prepare($sql);
    
    // Bind dos parâmetros e execução da consulta
    $stmt->bind_param("ss", $email, $senha);
    $stmt->execute();
    
    // Obter resultado
    $result = $stmt->get_result();

    // Verificar se encontrou o usuário
    if ($result->num_rows == 1) {
        // Armazenar dados do usuário na sessão
        $row = $result->fetch_assoc();
        $_SESSION['id'] = $row['id'];
        $_SESSION['nome'] = $row['nome'];
        $_SESSION['admin'] = $row['admin'];
        $_SESSION['empresa_id'] = $row['empresa_id']; // Adicionando empresa_id
        $_SESSION['nome_fantasia'] = $row['nome_fantasia'];
        $_SESSION['plano'] = $row['plano'];
        $_SESSION['email'] = $row['email'];

        // Redirecionar para o index.php
        header("Location: ../index.php");
        exit();
    } else {
        // Usuário ou senha inválidos, redirecionar para login.php com mensagem de erro
        header("Location: ../login.php?erro=1");
        exit();
    }
} else {
    // Se o método de requisição não for POST, redirecionar para login.php
    header("Location: ../login.php");
    exit();
}
