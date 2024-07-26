document.querySelectorAll('.dropdown').forEach(dropdown => {
    const defaultOption = dropdown.querySelector('.default_option');
    const options = dropdown.querySelectorAll('ul li a');

    // Mostra o dropdown quando clicado
    defaultOption.addEventListener('click', () => {
        dropdown.querySelector('ul').classList.toggle('active');
    });

    // Atualiza o texto do botão com o item selecionado e fecha o dropdown
    options.forEach(option => {
        option.addEventListener('click', () => {
            defaultOption.textContent = option.textContent; // Atualiza o texto
            dropdown.querySelector('ul').classList.remove('active'); // Fecha o dropdown
        });
    });

    // Oculta o dropdown quando o mouse sai da área
    dropdown.addEventListener('mouseleave', () => {
        dropdown.querySelector('ul').classList.remove('active');
    });
});

// Opcional: para fechar o dropdown quando clicar fora dele
document.addEventListener('click', (event) => {
    document.querySelectorAll('.dropdown').forEach(dropdown => {
        if (!dropdown.contains(event.target)) {
            dropdown.querySelector('ul').classList.remove('active');
        }
    });
});
