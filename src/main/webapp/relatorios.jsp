<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer totalPublicadores = (Integer) request.getAttribute("totalPublicadores");
    Integer totalNormal = (Integer) request.getAttribute("totalNormal");
    Integer totalAuxiliar = (Integer) request.getAttribute("totalAuxiliar");
    Integer totalRegular = (Integer) request.getAttribute("totalRegular");
    Integer totalEspecial = (Integer) request.getAttribute("totalEspecial");
    Integer horasAuxiliar = (Integer) request.getAttribute("horasAuxiliar");
    Integer horasRegular = (Integer) request.getAttribute("horasRegular");
    Integer horasEspecial = (Integer) request.getAttribute("horasEspecial");
    Integer estudosAuxiliar = (Integer) request.getAttribute("estudosAuxiliar");
    Integer estudosRegular = (Integer) request.getAttribute("estudosRegular");
    Integer estudosEspecial = (Integer) request.getAttribute("estudosEspecial");
    
    // Valores padrão para evitar NullPointerException
    if (totalPublicadores == null) totalPublicadores = 0;
    if (totalNormal == null) totalNormal = 0;
    if (totalAuxiliar == null) totalAuxiliar = 0;
    if (totalRegular == null) totalRegular = 0;
    if (totalEspecial == null) totalEspecial = 0;
    if (horasAuxiliar == null) horasAuxiliar = 0;
    if (horasRegular == null) horasRegular = 0;
    if (horasEspecial == null) horasEspecial = 0;
    if (estudosAuxiliar == null) estudosAuxiliar = 0;
    if (estudosRegular == null) estudosRegular = 0;
    if (estudosEspecial == null) estudosEspecial = 0;
%>  
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatórios - Sistema de Publicadores</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="menu.jsp" />
    
    <div class="container">
        <header class="page-header">
            <h1>📊 Relatórios Detalhados</h1>
            <a href="publicadores" class="btn btn-secondary">← Voltar</a>
        </header>

        <!-- Resumo Geral -->
        <div class="section">
            <h2>📈 Resumo Geral</h2>
            <div class="stats-grid">
                <div class="stat-card">
                    <h3>Total de Publicadores</h3>
                    <span class="stat-number"><%= totalPublicadores %></span>
                </div>
                <div class="stat-card">
                    <h3>Publicadores Normais</h3>
                    <span class="stat-number"><%= totalNormal %></span>
                </div>
                <div class="stat-card">
                    <h3>Pioneiros Auxiliares</h3>
                    <span class="stat-number"><%= totalAuxiliar %></span>
                </div>
                <div class="stat-card">
                    <h3>Pioneiros Regulares</h3>
                    <span class="stat-number"><%= totalRegular %></span>
                </div>
                <div class="stat-card">
                    <h3>Pioneiros Especiais</h3>
                    <span class="stat-number"><%= totalEspecial %></span>
                </div>
            </div>
        </div>

        <!-- Totais de Horas -->
        <div class="section">
            <h2>⏱️ Totais de Horas por Categoria</h2>
            <div class="totais-grid">
                <div class="total-card">
                    <h4>Pioneiros Auxiliares</h4>
                    <div class="total-number"><%= horasAuxiliar %> horas</div>
                    <p>Média: <%= totalAuxiliar > 0 ? String.format("%.1f", (double)horasAuxiliar/totalAuxiliar) : "0" %> horas/pioneiro</p>
                </div>
                <div class="total-card">
                    <h4>Pioneiros Regulares</h4>
                    <div class="total-number"><%= horasRegular %> horas</div>
                    <p>Média: <%= totalRegular > 0 ? String.format("%.1f", (double)horasRegular/totalRegular) : "0" %> horas/pioneiro</p>
                </div>
                <div class="total-card">
                    <h4>Pioneiros Especiais</h4>
                    <div class="total-number"><%= horasEspecial %> horas</div>
                    <p>Média: <%= totalEspecial > 0 ? String.format("%.1f", (double)horasEspecial/totalEspecial) : "0" %> horas/pioneiro</p>
                </div>
            </div>
        </div>

        <!-- Totais de Estudos -->
        <div class="section">
            <h2>📚 Totais de Estudos Bíblicos</h2>
            <div class="totais-grid">
                <div class="total-card">
                    <h4>Pioneiros Auxiliares</h4>
                    <div class="total-number"><%= estudosAuxiliar %> estudos</div>
                    <p>Média: <%= totalAuxiliar > 0 ? String.format("%.1f", (double)estudosAuxiliar/totalAuxiliar) : "0" %> estudos/pioneiro</p>
                </div>
                <div class="total-card">
                    <h4>Pioneiros Regulares</h4>
                    <div class="total-number"><%= estudosRegular %> estudos</div>
                    <p>Média: <%= totalRegular > 0 ? String.format("%.1f", (double)estudosRegular/totalRegular) : "0" %> estudos/pioneiro</p>
                </div>
                <div class="total-card">
                    <h4>Pioneiros Especiais</h4>
                    <div class="total-number"><%= estudosEspecial %> estudos</div>
                    <p>Média: <%= totalEspecial > 0 ? String.format("%.1f", (double)estudosEspecial/totalEspecial) : "0" %> estudos/pioneiro</p>
                </div>
            </div>
        </div>

        <!-- Metas -->
        <div class="section">
            <h2>🎯 Metas Mensais</h2>
            <div class="metas-grid">
                <div class="meta-card">
                    <h4>Pioneiro Auxiliar</h4>
                    <p>Meta: 30 horas/mês</p>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: <%= Math.min(100, (horasAuxiliar/(totalAuxiliar * 30.0)) * 100) %>%"></div>
                    </div>
                    <span><%= String.format("%.0f%%", Math.min(100, (horasAuxiliar/(totalAuxiliar * 30.0)) * 100)) %></span>
                </div>
                <div class="meta-card">
                    <h4>Pioneiro Regular</h4>
                    <p>Meta: 50 horas/mês</p>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: <%= Math.min(100, (horasRegular/(totalRegular * 50.0)) * 100) %>%"></div>
                    </div>
                    <span><%= String.format("%.0f%%", Math.min(100, (horasRegular/(totalRegular * 50.0)) * 100)) %></span>
                </div>
            </div>
        </div>
    </div>
    
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>