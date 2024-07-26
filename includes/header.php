<?php
// Inicia a sessão apenas se não estiver iniciada
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/style_header.css">
    <title>PetroEye</title>
</head>

<body>
    <div class="header">
        <div class="hamburger" onclick="toggleMenu()">&#9776;</div>
        <div class="logo">
            <img src="assets/images/logo.png" alt="Logo">
        </div>
        <div class="search-icon" onclick="toggleSearch()">
            <img src="assets/images/lupa2.png" alt="Search Icon">
        </div>
        <div id="searchBox" class="search-box">
            <form id="searchForm" action="includes/pesquisa.php" method="GET">
                <input type="text" id="searchInput" name="q" placeholder="Pesquisar...">
            </form>
        </div>
    </div>

    <div id="myNav" class="nav-list">
        <a href="javascript:void(0)" class="closebtn" onclick="toggleMenu()">&times;</a>
        <a href="index.php">Início</a>

        <?php if (isset($_SESSION['admin']) && !$_SESSION['admin']): ?>
            <a href="perfil_usuario.php">Perfil</a>
        <?php elseif (isset($_SESSION['admin']) && $_SESSION['admin']): ?>
            <a href="perfil.php">Perfil</a>
            <a href="gerenciar.php">Gerenciar</a>
        <?php endif; ?>

        <a href="formulario_bacia.php">Logística</a>
        <a href="historico.php">Histórico</a>

        <a href="logout.php">Sair</a>
    </div>

    <script>
        function toggleMenu() {
            var nav = document.getElementById("myNav");
            if (nav.style.width === "250px") {
                nav.style.width = "0";
            } else {
                nav.style.width = "250px";
            }
        }

        function toggleSearch() {
            var searchBox = document.getElementById("searchBox");
            if (searchBox.style.width === "250px") {
                searchBox.style.width = "0";
                setTimeout(() => { searchBox.style.display = "none"; }, 500);
            } else {
                searchBox.style.display = "flex";
                setTimeout(() => { searchBox.style.width = "250px"; }, 10);
                document.getElementById("searchInput").focus();
            }
        }

        window.onclick = function (event) {
            var nav = document.getElementById("myNav");
            var searchBox = document.getElementById("searchBox");
            var searchInput = document.getElementById("searchInput");
            if (!nav.contains(event.target) && event.target !== document.querySelector(".hamburger") && !event.target.classList.contains('closebtn')) {
                nav.style.width = "0";
            }
            if (!searchBox.contains(event.target) && event.target !== document.querySelector(".search-icon img") && event.target !== searchInput) {
                searchBox.style.width = "0";
                setTimeout(() => { searchBox.style.display = "none"; }, 500);
            }
        }

        // Adiciona um evento para o campo de pesquisa que envia o formulário quando Enter é pressionado
        document.getElementById('searchInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault(); // Impede o comportamento padrão
                document.getElementById('searchForm').submit(); // Envia o formulário
            }
        });
    </script>
</body>

</html>
