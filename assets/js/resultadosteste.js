document.addEventListener('DOMContentLoaded', () => {
    const filtroItems = document.querySelectorAll('.filtros ul li');
    const filtroContainer = document.querySelector('.filtros');

    filtroItems.forEach(item => {
        item.addEventListener('click', () => {
            // Alterna a classe "selected" no item clicado
            item.classList.toggle('selected');

            // Cria uma URL com base nos itens selecionados
            const selectedItems = Array.from(filtroItems)
                .filter(item => item.classList.contains('selected'))
                .map(item => encodeURIComponent(item.textContent.trim()));

            const searchQuery = new URLSearchParams(window.location.search);
            searchQuery.set('q', searchQuery.get('q') || '');

            selectedItems.forEach(item => {
                searchQuery.append('filter', item);
            });

            // Atualiza a URL sem recarregar a página
            window.history.replaceState(null, '', '?' + searchQuery.toString());

            // Aqui você pode adicionar uma chamada para atualizar os resultados
            // com base na nova URL, se necessário
        });
    });

    // Manipulação de Dropdowns com JavaScript puro
    document.querySelectorAll('.dropdown').forEach(dropdown => {
        const dropdownList = dropdown.querySelector('ul');
        const defaultOption = dropdown.querySelector('.default_option');
        const defaultText = defaultOption.textContent;

        defaultOption.addEventListener('click', () => {
            dropdownList.classList.toggle('active');
        });

        dropdownList.querySelectorAll('li').forEach(item => {
            item.addEventListener('click', () => {
                const selectedOption = item.textContent.trim();
                if (selectedOption === '- Limpar Filtro -') {
                    defaultOption.textContent = defaultText;
                } else {
                    defaultOption.textContent = selectedOption;
                }
                dropdownList.classList.remove('active');
            });
        });

        dropdown.addEventListener('mouseleave', () => {
            dropdownList.classList.remove('active');
        });
    });

    // Manipulação do botão de filtro
    document.getElementById('filtrarBtn').addEventListener('click', () => {
        document.querySelector('form').submit();
    });

    // Manipulação dos links de filtro
    document.querySelectorAll('.dropdown a').forEach(link => {
        link.addEventListener('click', function (e) {
            e.preventDefault();
            const filter = this.dataset.filter;
            const value = this.dataset.value;

            if (value === '- Limpar Filtro -') {
                deleteFilter(filter);
            } else {
                setFilter(filter, value);
            }
            document.querySelector('form').submit();
        });
    });
});

function setFilter(name, value) {
    const url = new URL(window.location.href);
    url.searchParams.set(name, value);
    window.history.replaceState({}, '', url);
}

function deleteFilter(name) {
    const url = new URL(window.location.href);
    url.searchParams.delete(name);
    window.history.replaceState({}, '', url);
}
document.addEventListener('DOMContentLoaded', () => {
    const filtroItems = document.querySelectorAll('.filtros ul li');

    filtroItems.forEach(item => {
        item.addEventListener('click', () => {
            // Alterna a classe "selected" no item clicado
            item.classList.toggle('selected');
            
            // Atualiza a visualização dos resultados com base nos filtros selecionados
            updateResults();
        });
    });

    function updateResults() {
        const selectedItems = Array.from(filtroItems)
            .filter(item => item.classList.contains('selected'))
            .map(item => item.textContent.trim());

        // Atualiza os resultados sem enviar o formulário
        console.log('Filtros aplicados:', selectedItems);

        // Exemplo de atualização fictícia (substitua com sua lógica real)
        // updatePageContent(selectedItems);
    }

    document.getElementById('filtrarBtn').addEventListener('click', () => {
        updateResults();
    });
});
