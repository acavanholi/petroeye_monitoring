function buscarUsuarios() {
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
