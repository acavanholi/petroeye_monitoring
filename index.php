<?php
include 'includes/header.php';
include 'includes/protect.php';
include 'includes/conexao.php';


// Verifica se as informações da empresa estão na sessão
if (!isset($_SESSION['nome_fantasia']) || !isset($_SESSION['plano'])) {
    $user_id = $_SESSION['id'];

    // Consulta para buscar dados da empresa
    $sql = "SELECT e.nome_fantasia, e.plano
            FROM usuarios u
            JOIN empresas e ON u.empresa_id = e.id
            WHERE u.id = ?";
    
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $empresa = $result->fetch_assoc();
        $_SESSION['nome_fantasia'] = $empresa['nome_fantasia'];
        $_SESSION['plano'] = $empresa['plano'];
    } else {
        // Defina valores padrão ou redirecione para uma página de erro
        $_SESSION['nome_fantasia'] = 'Nome da Empresa';
        $_SESSION['plano'] = 'Plano Não Disponível';
    }

    $stmt->close();
    $mysqli->close();
}
?>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/index.css"> 

    <title>PetroEye Monitoring</title>
</head>


<body>
    <div class="welcome">
        <h1>Bem-vindo(a), <?php echo htmlspecialchars($_SESSION['nome']); ?>!</h1>
        <p>Permissão: <?php echo $_SESSION['admin'] ? 'Administrador' : 'Usuário'; ?></p>
        <p>Empresa: <?php echo htmlspecialchars($_SESSION['nome_fantasia']); ?></p>
        <p>Plano da empresa: <?php echo htmlspecialchars($_SESSION['plano']); ?></p>
        <a href="logout.php">Sair</a>
    </div>
    <?php include 'includes/footer.php'; ?>
</body>

</html>
