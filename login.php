<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Verifica se o usuário está logado
if (isset($_SESSION['id'])) {
    header("Location: index.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/style_login.css">
    <title>Login</title>
</head>
<body>
    <div class="header">
        <div class="logo">
            <img src="assets/images/logo.png" alt="Logo">
        </div>
    </div>

    <!-- Caixa de login -->
    <div class="container">
        <div class="login">
            <h3>Login</h3>
            <?php
            // Exibir mensagem de erro, se houver
            if (isset($_GET['erro']) && $_GET['erro'] == 1) {
                echo '<p style="color: red;">Usuário ou senha inválidos.</p>';
            }
            ?>
            <form method="POST" action="includes/processa_login.php">
                <div class="input-box">
                    <input type="text" name="email" required placeholder=" ">
                    <label>Usuário</label>
                </div>
                <div class="input-box">
                    <input type="password" name="senha" required placeholder=" ">
                    <label>Senha</label>
                </div>
                <a class="forget" href="https://drive.google.com/file/d/1JZunTF3j8Evygqfb41TF2d8Z1UyVHV2J/view" target="_blank">Esqueceu a senha?</a>
                <button class="botton" type="submit">Entrar</button>
            </form>
        </div>
    </div>
</body>
</html>
