<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Publicadores </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 4rem 0;
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .hero-content {
            max-width: 800px;
            margin: 0 auto;
            padding: 0 2rem;
        }
        
        .hero-title {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .hero-subtitle {
            font-size: 1.3rem;
            margin-bottom: 2rem;
            opacity: 0.9;
            font-weight: 300;
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin: 3rem 0;
        }
        
        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid #e9ecef;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }
        
        .feature-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            display: block;
        }
        
        .feature-title {
            color: #2c3e50;
            font-size: 1.4rem;
            margin-bottom: 1rem;
            font-weight: 600;
        }
        
        .feature-description {
            color: #7f8c8d;
            line-height: 1.6;
        }
        
        .quick-actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
            margin: 2rem 0;
        }
        
        .btn-large {
            padding: 15px 30px;
            font-size: 1.1rem;
            border-radius: 10px;
        }
        
        .stats-preview {
            background: #f8f9fa;
            padding: 3rem 0;
            margin-top: 3rem;
        }
        
        .welcome-message {
            text-align: center;
            margin-bottom: 3rem;
            padding: 0 2rem;
        }
        
        .welcome-message h2 {
            color: #2c3e50;
            font-size: 2.2rem;
            margin-bottom: 1rem;
        }
        
        .welcome-message p {
            color: white;
            font-size: 1.1rem;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }
        
        .jose {
        	color: yellow;
        }
        
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.2rem;
            }
            
            .hero-subtitle {
                font-size: 1.1rem;
            }
            
            .quick-actions {
                flex-direction: column;
                align-items: center;
            }
            
            .btn-large {
                width: 100%;
                max-width: 300px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp" />
    
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-content">
            <h1 class="hero-title">📊 Sistema de Publicadores</h1>
            <p class="hero-subtitle">Pra gerenciar de forma eficiente os relatórios de serviço dos publicadores da Congregacao Nhamaonha</p>
            
            <div class="quick-actions">
                <a href="${pageContext.request.contextPath}/publicadores?action=novo" class="btn btn-primary btn-large">
                    ➕ Novo Publicador
                </a>
                <a href="${pageContext.request.contextPath}/publicadores" class="btn btn-secondary btn-large">
                    👥 Ver Publicadores
                </a>
                <a href="${pageContext.request.contextPath}/publicadores?action=relatorios" class="btn btn-secondary btn-large">
                    📈 Ver Relatórios
                </a>
            </div>
        </div>
    </section>

    <div class="container">
        <!-- Welcome Message -->
        <div class="welcome-message">
            <h2>Bem-vindo Joao Anibal ao sistema de Relatorios para Publicadores</h2>
            <p>Uma ferramenta completa para acompanhar o serviço dos publicadores, pioneiros auxiliares, regulares e especiais da congregação.</p>
        </div>

        <!-- Features Grid -->
        <div class="features-grid">
            <div class="feature-card">
                <span class="feature-icon">👥</span>
                <h3 class="feature-title">Gestão de Publicadores</h3>
                <p class="feature-description">
                    Adicione e veja todos os publicadores da congregação. 
                    Mantenha registros atualizados com informações completas sobre 
                    cada servo de Jeová.
                </p>
            </div>
            
            <div class="feature-card">
                <span class="feature-icon">⏱️</span>
                <h3 class="feature-title">Controle de Horas</h3>
                <p class="feature-description">
                    Registre as horas de serviço de cada publicador. 
                    Acompanhe o cumprimento das metas mensais dos pioneiros 
                    auxiliares, regulares e especiais.
                </p>
            </div>
            
            <div class="feature-card">
                <span class="feature-icon">📚</span>
                <h3 class="feature-title">Estudos Bíblicos</h3>
                <p class="feature-description">
                    Controle o número de estudos bíblicos conduzidos por cada publicador. 
                    Acompanhe o progresso no ensino das verdades bíblicas.
                </p>
            </div>
            
            <div class="feature-card">
                <span class="feature-icon">📊</span>
                <h3 class="feature-title">Relatórios Detalhados</h3>
                <p class="feature-description">
                    Gere relatórios completos com totais por categoria, 
                    médias de horas e estudos, e análise do desempenho geral 
                    da congregação.
                </p>
            </div>
            
            <div class="feature-card">
                <span class="feature-icon">🎯</span>
                <h3 class="feature-title">Metas e Acompanhamento</h3>
                <p class="feature-description">
                    Defina metas mensais e acompanhe o progresso em tempo real. 
                    Visualize gráficos e indicadores de desempenho.
                </p>
            </div>
            
            <div class="feature-card">
                <span class="feature-icon">✅</span>
                <h3 class="feature-title">Controle de Participação</h3>
                <p class="feature-description">
                    Registre a participação mensal de cada publicador no serviço. 
                    Mantenha um histórico completo de atividade.
                </p>
            </div>
        </div>

        <!-- Stats Preview -->
        <div class="stats-preview">
            <div class="container">
                <h2 style="text-align: center; color: #2c3e50; margin-bottom: 2rem;">Como Funciona</h2>
                
                <div class="features-grid">
                    <div class="feature-card">
                        <h3 class="feature-title">1. Cadastro</h3>
                        <p class="feature-description">
                            Cadastre cada publicador informando nome, tipo 
                            (Normal, Auxiliar, Regular ou Especial), horas e estudos.
                        </p>
                    </div>
                    
                    <div class="feature-card">
                        <h3 class="feature-title">2. Acompanhamento</h3>
                        <p class="feature-description">
                            Acompanhe mensalmente o serviço de cada publicador 
                            e atualize os registros conforme necessário.
                        </p>
                    </div>
                    
                    <div class="feature-card">
                        <h3 class="feature-title">3. Relatórios</h3>
                        <p class="feature-description">
                            Gere relatórios detalhados com totais, médias e 
                            análises do serviço da congregação.
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Access -->
        <div style="text-align: center; margin: 4rem 0;">
            <h2 style="color: #2c3e50; margin-bottom: 2rem;">Comece Agora Mesmo</h2>
            <div class="quick-actions">
                <a href="${pageContext.request.contextPath}/publicadores?action=novo" class="btn btn-primary btn-large">
                    🚀 Adicionar novo publicador
                </a>
                <a href="${pageContext.request.contextPath}/publicadores" class="btn btn-secondary btn-large">
                    📋 Ver Lista Completa
                </a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer style="background: #2c3e50; color: white; text-align: center; padding: 2rem 0; margin-top: 4rem;">
        <div class="container">
            <p style="margin: 0; opacity: 0.8;">
                Sistema de Publicadores - Desenvolvido para o serviço do Reino 
                
                <p class="jose"> <strong>  💯 JOSE JOAO ANIBAL DA SILVA 🕊️ </strong>  </p>
            </p>
            <p style="margin: 0.5rem 0 0 0; opacity: 0.6; font-size: 0.9rem;">
                "Vão e façam discípulos de pessoas de todas as nações" - Mateus 28:19
            </p>
        </div>
    </footer> 

    <script src="${pageContext.request.contextPath}/js/script.js"></script>
    <script>
        // Animação específica para a página inicial
        document.addEventListener('DOMContentLoaded', function() {
            // Animar cards de features
            const featureCards = document.querySelectorAll('.feature-card');
            featureCards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                card.style.transition = 'all 0.6s ease';
                
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, 200 * index);
            });
            
            // Contador animado (exemplo)
            const counters = document.querySelectorAll('.stat-number');
            counters.forEach(counter => {
                const target = +counter.innerText;
                let count = 0;
                const increment = target / 100;
                
                const updateCount = () => {
                    if (count < target) {
                        count += increment;
                        counter.innerText = Math.ceil(count);
                        setTimeout(updateCount, 20);
                    } else {
                        counter.innerText = target;
                    }
                };
                
                // Iniciar quando o elemento estiver visível
                const observer = new IntersectionObserver((entries) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            updateCount();
                            observer.unobserve(entry.target);
                        }
                    });
                });
                
                observer.observe(counter);
            });
        });
        
        // Função para demonstrar features
        function demonstrarFeature(feature) {
            const mensagens = {
                'cadastro': 'Redirecionando para cadastro de publicadores...',
                'relatorios': 'Abrindo relatórios detalhados...',
                'lista': 'Carregando lista completa de publicadores...'
            };
            
            if (mensagens[feature]) {
                alert(mensagens[feature]);
            }
        }
    </script>
</body>
</html>