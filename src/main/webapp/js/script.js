// script.js - Funcionalidades do Sistema de Publicadores

document.addEventListener('DOMContentLoaded', function() {
    inicializarSistema();
    configurarValidacoes();
    configurarAnimações();
    configurarEventListeners();
});

function inicializarSistema() {
    console.log('Sistema de Publicadores inicializado com sucesso!');
    
    // Verificar se há dados para mostrar animações
    const tabela = document.querySelector('.data-table tbody');
    if (tabela && tabela.children.length > 0) {
        animarEntradaElementos();
    }
}

function configurarValidacoes() {
    const form = document.getElementById('publicadorForm');
    if (form) {
        form.addEventListener('submit', function(e) {
            if (!validarFormulario()) {
                e.preventDefault();
                return false;
            }
            mostrarLoading();
        });
        
        // Validação em tempo real
        const inputs = form.querySelectorAll('input[required], select[required]');
        inputs.forEach(input => {
            input.addEventListener('blur', function() {
                validarCampo(this);
            });
            
            input.addEventListener('input', function() {
                limparErro(this);
            });
        });
    }
}

function validarFormulario() {
    const nome = document.getElementById('nome');
    const tipo = document.getElementById('tipo');
    const horas = document.getElementById('horas');
    const estudos = document.getElementById('estudos');
    
    let valido = true;
    
    // Validar nome
    if (!nome.value.trim()) {
        mostrarErro(nome, 'Por favor, preencha o nome do publicador.');
        valido = false;
    } else if (nome.value.trim().length < 2) {
        mostrarErro(nome, 'O nome deve ter pelo menos 2 caracteres.');
        valido = false;
    }
    
    // Validar tipo
    if (!tipo.value) {
        mostrarErro(tipo, 'Por favor, selecione o tipo de publicador.');
        valido = false;
    }
    
    // Validar horas
    if (!horas.value || horas.value < 0) {
        mostrarErro(horas, 'As horas não podem ser negativas.');
        valido = false;
    } else if (horas.value > 200) {
        mostrarErro(horas, 'As horas não podem ser superiores a 200.');
        valido = false;
    }
    
    // Validar estudos
    if (!estudos.value || estudos.value < 0) {
        mostrarErro(estudos, 'O número de estudos não pode ser negativo.');
        valido = false;
    } else if (estudos.value > 50) {
        mostrarErro(estudos, 'O número de estudos não pode ser superior a 50.');
        valido = false;
    }
    
    return valido;
}

function validarCampo(campo) {
    switch(campo.type) {
        case 'text':
            if (!campo.value.trim()) {
                mostrarErro(campo, 'Este campo é obrigatório.');
            }
            break;
        case 'number':
            if (campo.value < 0) {
                mostrarErro(campo, 'O valor não pode ser negativo.');
            }
            break;
        case 'select-one':
            if (!campo.value) {
                mostrarErro(campo, 'Por favor, selecione uma opção.');
            }
            break;
    }
}

function mostrarErro(campo, mensagem) {
    limparErro(campo);
    
    campo.style.borderColor = '#e74c3c';
    
    const erroDiv = document.createElement('div');
    erroDiv.className = 'erro-validacao';
    erroDiv.style.color = '#e74c3c';
    erroDiv.style.fontSize = '0.8rem';
    erroDiv.style.marginTop = '0.3rem';
    erroDiv.textContent = mensagem;
    
    campo.parentNode.appendChild(erroDiv);
}

function limparErro(campo) {
    campo.style.borderColor = '';
    
    const erroExistente = campo.parentNode.querySelector('.erro-validacao');
    if (erroExistente) {
        erroExistente.remove();
    }
}

function configurarAnimações() {
    // Configurar observador de interseção para animações
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, { threshold: 0.1 });
    
    // Observar elementos para animação
    const elementosAnimaveis = document.querySelectorAll('.stat-card, .total-card, .data-table tr');
    elementosAnimaveis.forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(20px)';
        el.style.transition = 'all 0.6s ease';
        observer.observe(el);
    });
}

function animarEntradaElementos() {
    const linhas = document.querySelectorAll('.data-table tr');
    linhas.forEach((linha, index) => {
        linha.style.animationDelay = `${index * 0.1}s`;
    });
}

function configurarEventListeners() {
    // Melhorar experiência do usuário com feedback visual
    const botoes = document.querySelectorAll('.btn');
    botoes.forEach(botao => {
        botao.addEventListener('click', function(e) {
            if (this.classList.contains('btn-delete')) {
                if (!confirm('Tem certeza que deseja excluir este registro?')) {
                    e.preventDefault();
                }
            }
        });
    });
    
    // Adicionar tooltips
    const elementosComTooltip = document.querySelectorAll('[title]');
    elementosComTooltip.forEach(el => {
        el.addEventListener('mouseenter', mostrarTooltip);
        el.addEventListener('mouseleave', esconderTooltip);
    });
}

function mostrarTooltip(e) {
    const tooltip = document.createElement('div');
    tooltip.className = 'tooltip';
    tooltip.textContent = this.title;
    tooltip.style.position = 'absolute';
    tooltip.style.background = 'rgba(0,0,0,0.8)';
    tooltip.style.color = 'white';
    tooltip.style.padding = '5px 10px';
    tooltip.style.borderRadius = '4px';
    tooltip.style.fontSize = '0.8rem';
    tooltip.style.zIndex = '1000';
    
    document.body.appendChild(tooltip);
    
    const rect = this.getBoundingClientRect();
    tooltip.style.left = rect.left + 'px';
    tooltip.style.top = (rect.top - tooltip.offsetHeight - 5) + 'px';
    
    this._tooltip = tooltip;
}

function esconderTooltip() {
    if (this._tooltip) {
        this._tooltip.remove();
        this._tooltip = null;
    }
}

function mostrarLoading() {
    const botaoSubmit = document.querySelector('button[type="submit"]');
    if (botaoSubmit) {
        const textoOriginal = botaoSubmit.textContent;
        botaoSubmit.innerHTML = '⏳ Processando...';
        botaoSubmit.disabled = true;
        
        // Restaurar após 3 segundos (fallback)
        setTimeout(() => {
            botaoSubmit.innerHTML = textoOriginal;
            botaoSubmit.disabled = false;
        }, 3000);
    }
}

// Funções para cálculos e relatórios
function calcularTotais(publicadores) {
    const totais = {
        normal: { count: 0, horas: 0, estudos: 0 },
        auxiliar: { count: 0, horas: 0, estudos: 0 },
        regular: { count: 0, horas: 0, estudos: 0 },
        especial: { count: 0, horas: 0, estudos: 0 },
        totalPublicadores: 0
    };
    
    publicadores.forEach(p => {
        totais.totalPublicadores++;
        
        switch(p.tipoPublicador) {
            case 'NORMAL':
                totais.normal.count++;
                totais.normal.horas += p.horasMes;
                totais.normal.estudos += p.estudosBiblicos;
                break;
            case 'AUXILIAR':
                totais.auxiliar.count++;
                totais.auxiliar.horas += p.horasMes;
                totais.auxiliar.estudos += p.estudosBiblicos;
                break;
            case 'REGULAR':
                totais.regular.count++;
                totais.regular.horas += p.horasMes;
                totais.regular.estudos += p.estudosBiblicos;
                break;
            case 'ESPECIAL':
                totais.especial.count++;
                totais.especial.horas += p.horasMes;
                totais.especial.estudos += p.estudosBiblicos;
                break;
        }
    });
    
    return totais;
}

// Exportar dados (funcionalidade futura)
function exportarParaCSV() {
    console.log('Funcionalidade de exportação CSV será implementada em breve.');
    alert('Funcionalidade de exportação será implementada em breve!');
}

// Busca em tempo real (funcionalidade futura)
function configurarBusca() {
    const inputBusca = document.createElement('input');
    inputBusca.type = 'text';
    inputBusca.placeholder = 'Buscar publicadores...';
    inputBusca.style.marginBottom = '1rem';
    inputBusca.style.padding = '0.5rem';
    inputBusca.style.width = '100%';
    inputBusca.style.border = '2px solid #bdc3c7';
    inputBusca.style.borderRadius = '5px';
    
    // Adicionar campo de busca se houver tabela
    const tabelaContainer = document.querySelector('.table-container');
    if (tabelaContainer) {
        tabelaContainer.parentNode.insertBefore(inputBusca, tabelaContainer);
        
        inputBusca.addEventListener('input', function() {
            const termo = this.value.toLowerCase();
            const linhas = document.querySelectorAll('.data-table tbody tr');
            
            linhas.forEach(linha => {
                const textoLinha = linha.textContent.toLowerCase();
                if (textoLinha.includes(termo)) {
                    linha.style.display = '';
                } else {
                    linha.style.display = 'none';
                }
            });
        });
    }
}

// Inicializar busca se necessário
if (document.querySelector('.data-table')) {
    // configurarBusca(); // Descomente para ativar a busca
}

// Utilitários
function formatarData(data) {
    return new Date(data).toLocaleDateString('pt-BR');
}

function formatarNumero(numero) {
    return new Intl.NumberFormat('pt-BR').format(numero);
}