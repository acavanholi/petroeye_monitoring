<?php
// Inclua o arquivo de conexão com o banco de dados
include 'conexao.php';

// Captura os parâmetros de filtro
$searchTerm = isset($_GET['q']) ? mysqli_real_escape_string($mysqli, $_GET['q']) : '';
$categoria = isset($_GET['categoria']) ? mysqli_real_escape_string($mysqli, $_GET['categoria']) : '';
$situacao = isset($_GET['situacao']) ? mysqli_real_escape_string($mysqli, $_GET['situacao']) : '';
$titularidade = isset($_GET['titularidade']) ? mysqli_real_escape_string($mysqli, $_GET['titularidade']) : '';
$tipoCoordenada = isset($_GET['tipo_coordenada']) ? mysqli_real_escape_string($mysqli, $_GET['tipo_coordenada']) : '';
$direcao = isset($_GET['direcao']) ? mysqli_real_escape_string($mysqli, $_GET['direcao']) : '';
$geoquimica = isset($_GET['geoquimica']) ? mysqli_real_escape_string($mysqli, $_GET['geoquimica']) : '';

// Construir a consulta SQL com base nos filtros
$sql = "SELECT * FROM sua_tabela WHERE 1=1";
if ($searchTerm) $sql .= " AND coluna LIKE '%$searchTerm%'";
if ($categoria && $categoria !== '- Limpar Filtro -') $sql .= " AND categoria = '$categoria'";
if ($situacao && $situacao !== '- Limpar Filtro -') $sql .= " AND situacao = '$situacao'";
if ($titularidade && $titularidade !== '- Limpar Filtro -') $sql .= " AND titularidade = '$titularidade'";
if ($tipoCoordenada && $tipoCoordenada !== '- Limpar Filtro -') $sql .= " AND tipo_coordenada = '$tipoCoordenada'";
if ($direcao && $direcao !== '- Limpar Filtro -') $sql .= " AND direcao = '$direcao'";
if ($geoquimica && $geoquimica !== '- Limpar Filtro -') $sql .= " AND geoquimica = '$geoquimica'";

// Executar a consulta
$result = mysqli_query($mysqli, $sql);

// Verificar se há resultados
if (mysqli_num_rows($result) > 0) {
    // Exibir os resultados
    echo "<table border='1'>
            <tr>
                <th>ID</th>
                <th>Coluna</th>
                <th>Categoria</th>
                <th>Situação</th>
                <th>Titularidade</th>
                <th>Tipo de Coordenada</th>
                <th>Direção</th>
                <th>Geoquímica</th>
            </tr>";

    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>
                <td>{$row['id']}</td>
                <td>{$row['coluna']}</td>
                <td>{$row['categoria']}</td>
                <td>{$row['situacao']}</td>
                <td>{$row['titularidade']}</td>
                <td>{$row['tipo_coordenada']}</td>
                <td>{$row['direcao']}</td>
                <td>{$row['geoquimica']}</td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "Nenhum resultado encontrado.";
}

// Fechar a conexão com o banco de dados
mysqli_close($mysqli);