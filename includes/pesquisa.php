<?php
// Redireciona para a página de resultados com o termo de pesquisa
$searchTerm = isset($_GET['q']) ? $_GET['q'] : '';
header("Location: ../resultados.php?q=" . urlencode($searchTerm));
exit();

