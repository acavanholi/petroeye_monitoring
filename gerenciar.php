<?php
include 'includes/conexao.php';
include 'includes/header.php';
include 'includes/protect.php';


// Verifica se o usuário está logado e é administrador
if (!isset($_SESSION['id']) || $_SESSION['admin'] != 1) {
    header("Location: index.php"); // Redireciona para a página inicial se não for admin
    exit;
}

// ID do usuário logado
$usuario_logado_id = $_SESSION['id'];
// Processar o formulário de concessão de permissões
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['adicionar_usuario'])) {
        $nome = $_POST['nome'];
        $email = $_POST['email'];
        $senha = password_hash($_POST['senha'], PASSWORD_DEFAULT);
        $empresa_id = $_SESSION['empresa_id']; // ID da empresa do administrador logado
        $acesso_logistica = isset($_POST['acesso_logistica']) ? 1 : 0;
        $administrador = isset($_POST['administrador']) ? 1 : 0;

        // Inserir novo usuário
        $sql = "INSERT INTO usuarios (nome, email, senha, empresa_id, admin) VALUES (?, ?, ?, ?, ?)";
        if ($stmt = $mysqli->prepare($sql)) {
            $stmt->bind_param('sssii', $nome, $email, $senha, $empresa_id, $administrador);
            $stmt->execute();
            $novo_usuario_id = $stmt->insert_id;
            $stmt->close();

            // Conceder acesso à logística se necessário
            if ($acesso_logistica == 1) {
                $sql = "INSERT INTO permissoes (usuario_id, empresa_id, acesso_logistica) VALUES (?, ?, 1) ON DUPLICATE KEY UPDATE acesso_logistica = 1";
                if ($stmt = $mysqli->prepare($sql)) {
                    $stmt->bind_param('ii', $novo_usuario_id, $empresa_id);
                    $stmt->execute();
                    $stmt->close();
                } else {
                    $msg = "Erro ao conceder acesso à logística: " . $mysqli->error;
                }
            }

            $msg = "Novo usuário adicionado com sucesso.";
        } else {
            $msg = "Erro ao adicionar usuário: " . $mysqli->error;
        }
    } elseif (isset($_POST['tornar_admin'])) {
        $usuario_id = $_POST['tornar_admin'];

        // Tornar o usuário administrador e conceder acesso à logística
        $sql = "UPDATE usuarios SET admin = 1 WHERE id = ?";
        if ($stmt = $mysqli->prepare($sql)) {
            $stmt->bind_param('i', $usuario_id);
            $stmt->execute();
            $stmt->close();

            // Conceder acesso à logística
            $sql = "INSERT INTO permissoes (usuario_id, empresa_id, acesso_logistica) VALUES (?, ?, 1) ON DUPLICATE KEY UPDATE acesso_logistica = 1";
            if ($stmt = $mysqli->prepare($sql)) {
                $stmt->bind_param('ii', $usuario_id, $_SESSION['empresa_id']);
                $stmt->execute();
                $stmt->close();
                $msg = "Usuário tornado administrador e acesso à logística concedido com sucesso.";
            } else {
                $msg = "Usuário tornado administrador, mas erro ao conceder acesso à logística: " . $mysqli->error;
            }
        } else {
            $msg = "Erro ao tornar usuário administrador: " . $mysqli->error;
        }
    } elseif (isset($_POST['acesso_logistica'])) {
        $usuario_id = $_POST['acesso_logistica'];
        $acao = $_POST['acao'];

        // Conceder ou revogar acesso à logística
        if ($acao == 'conceder') {
            $sql = "INSERT INTO permissoes (usuario_id, empresa_id, acesso_logistica) VALUES (?, ?, 1) ON DUPLICATE KEY UPDATE acesso_logistica = 1";
            $msg = "Acesso à logística concedido com sucesso.";
        } else {
            $sql = "UPDATE permissoes SET acesso_logistica = 0 WHERE usuario_id = ? AND empresa_id = ?";
            $msg = "Acesso à logística revogado com sucesso.";
        }

        if ($stmt = $mysqli->prepare($sql)) {
            $stmt->bind_param('ii', $usuario_id, $_SESSION['empresa_id']);
            $stmt->execute();
            $stmt->close();
        } else {
            $msg = "Erro ao alterar acesso à logística: " . $mysqli->error;
        }
    } elseif (isset($_POST['mudar_para_usuario'])) {
        $usuario_id = $_POST['mudar_para_usuario'];

        // Mudar o usuário para usuário comum e revogar acesso à logística
        $sql = "UPDATE usuarios SET admin = 0 WHERE id = ?";
        if ($stmt = $mysqli->prepare($sql)) {
            $stmt->bind_param('i', $usuario_id);
            $stmt->execute();
            $stmt->close();

            // Revogar acesso à logística
            $sql = "UPDATE permissoes SET acesso_logistica = 0 WHERE usuario_id = ? AND empresa_id = ?";
            if ($stmt = $mysqli->prepare($sql)) {
                $stmt->bind_param('ii', $usuario_id, $_SESSION['empresa_id']);
                $stmt->execute();
                $stmt->close();
                $msg = "Usuário alterado para usuário comum e acesso à logística revogado com sucesso.";
            } else {
                $msg = "Usuário alterado para usuário comum, mas erro ao revogar acesso à logística: " . $mysqli->error;
            }
        } else {
            $msg = "Erro ao alterar usuário para usuário comum: " . $mysqli->error;
        }
    } elseif (isset($_POST['remover_usuario'])) {
        $usuario_id = $_POST['remover_usuario'];

        // Remover usuário
        $sql = "DELETE FROM usuarios WHERE id = ?";
        if ($stmt = $mysqli->prepare($sql)) {
            $stmt->bind_param('i', $usuario_id);
            $stmt->execute();
            $stmt->close();
            $msg = "Usuário removido com sucesso.";
        } else {
            $msg = "Erro ao remover usuário: " . $mysqli->error;
        }
    }
}
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Gerenciar Usuários</title>
    <link rel="stylesheet" href="assets/css/gerenciar.css">

</head>

<body>
    <div class="container">
        <h1>Gerenciar Usuários</h1>
        <?php if (!empty($msg)): ?>
            <p class="msg"><?php echo htmlspecialchars($msg); ?></p>
        <?php endif; ?>
        <!-- Formulário de Adicionar Novo Usuário -->
        <div class="adicionar-usuario-container">
            <h2>Novo Usuário</h2>
            <form method="post" action="gerenciar.php">
                <input type="hidden" name="adicionar_usuario" value="1">
                <div class="form-row">
                    <label for="nome">Nome:</label> <br>
                    <input type="text" id="nome" name="nome" required>
                </div>
                <div class="form-row">
                    <label for="email">Email:</label> <br>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-row">
                    <label for="senha">Senha:</label> <br>
                    <input type="password" id="senha" name="senha" required>
                </div>
                <div class="form-group">
                    <label for="confirmar_senha">Confirmar Senha:</label> <br>
                    <input type="password" id="confirmar_senha" name="confirmar_senha" required>
                </div>
                
                <div class="form-row">
                    <button type="submit" class="salvarbtn">Salvar</button>
                </div>
            </form>
        </div>

        <div class="conteudo-usuarios">
            <!-- Tabela de usuários -->
            <h2>Usuários</h2>
            <input type="text" id="search" onkeyup="buscarUsuarios()" placeholder="Buscar por usuário...">

            <table id="usuariosTable">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Logística</th>
                        <th>Permissão</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Listar usuários, excluindo o administrador logado
                    $sql = "SELECT u.id, u.nome, u.email, u.admin, COALESCE(p.acesso_logistica, 0) as acesso_logistica
                        FROM usuarios u
                        LEFT JOIN permissoes p ON u.id = p.usuario_id AND p.empresa_id = ?
                        WHERE u.empresa_id = ? AND u.id != ?";

                    if ($stmt = $mysqli->prepare($sql)) {
                        $stmt->bind_param('iii', $_SESSION['empresa_id'], $_SESSION['empresa_id'], $usuario_logado_id);
                        $stmt->execute();
                        $result = $stmt->get_result();

                        while ($row = $result->fetch_assoc()) {
                            echo '<tr>';
                            echo '<td>' . htmlspecialchars($row['nome']) . '</td>';
                            echo '<td>' . htmlspecialchars($row['email']) . '</td>';
                            echo '<td>' . ($row['acesso_logistica'] == 1 ? 'Sim' : 'Não') . '</td>';
                            echo '<td>' . ($row['admin'] == 1 ? 'Administrador' : 'Usuário') . '</td>';

                            echo '<td>';

                            // Exibir botões com base no status do usuário
                            if ($row['admin'] == 0) {
                                // Usuário comum
                                $acao_logistica = $row['acesso_logistica'] == 1 ? 'revogar' : 'conceder';
                                echo '<div class="dropdown">
                                    <button class="dropbtn">Alterar</button>
                                    <div class="dropdown-content">
                                        <form method="post" style="display:inline;">
                                            <input type="hidden" name="tornar_admin" value="' . $row['id'] . '">
                                            <button type="submit" class="btn">Tornar administrador</button>
                                        </form>
                                        <form method="post" style="display:inline;">
                                            <input type="hidden" name="acesso_logistica" value="' . $row['id'] . '">
                                            <input type="hidden" name="acao" value="' . $acao_logistica . '">
                                            <button type="submit" class="btn">' . ($acao_logistica == 'conceder' ? 'Conceder Acesso à Logística' : 'Revogar Acesso à Logística') . '</button>
                                        </form>
                                    </div>
                                </div>';
                                echo '<form method="post" style="display:inline;">
                                    <input type="hidden" name="remover_usuario" value="' . $row['id'] . '">
                                    <button type="submit" class="btn-remover" onclick="return confirm(\'Tem certeza que deseja remover este usuário?\')">Remover</button>
                                </form>';
                            } else {
                                // Administrador
                                echo '<form method="post" style="display:inline;">
                                    <input type="hidden" name="mudar_para_usuario" value="' . $row['id'] . '">
                                    <button type="submit" class="mudar_para_usuario">Mudar para Usuário</button>
                                </form>';
                            }

                            echo '</td></tr>';
                        }
                        $stmt->close();
                    } else {
                        echo '<tr><td colspan="5">Erro ao carregar usuários: ' . $mysqli->error . '</td></tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
    <script>function buscarUsuarios() {
            let input = document.getElementById('search').value;
            input = input.toLowerCase();
            let rows = document.getElementById('usuariosTable').getElementsByTagName('tr');
            for (let i = 1; i < rows.length; i++) {
                let cells = rows[i].getElementsByTagName('td');
                let match = false;
                for (let j = 0; j < cells.length - 1; j++) {
                    if (cells[j].innerHTML.toLowerCase().includes(input)) {
                        match = true;
                        break;
                    }
                }
                rows[i].style.display = match ? '' : 'none';
            }
        }

        function concederPermissoes(usuarioId) {
            const acessoLogistica = document.querySelector(`input[name='acesso_logistica_${usuarioId}']`).checked ? 1 : 0;
            const editarLogistica = document.querySelector(`input[name='editar_logistica_${usuarioId}']`).checked ? 1 : 0;

            const formData = new FormData();
            formData.append('usuario_id', usuarioId);
            formData.append('acesso_logistica', acessoLogistica);
            formData.append('editar_logistica', editarLogistica);

            fetch('gerenciar.php', {
                method: 'POST',
                body: formData
            })
                .then(response => response.text())
                .then(data => alert(data))
                .catch(error => console.error('Erro:', error));
        }
    </script>

</body>

</html>