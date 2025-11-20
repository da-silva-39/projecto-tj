<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Publicador" %>
<%@ page import="java.util.List" %>
<%
    List<Publicador> publicadores = (List<Publicador>) request.getAttribute("publicadores");
    
    // Calcular totais
    long totalNormal = publicadores.stream().filter(p -> p.getTipoPublicador() == Publicador.TipoPublicador.NORMAL).count();
    long totalAuxiliar = publicadores.stream().filter(p -> p.getTipoPublicador() == Publicador.TipoPublicador.AUXILIAR).count();
    long totalRegular = publicadores.stream().filter(p -> p.getTipoPublicador() == Publicador.TipoPublicador.REGULAR).count();
    long totalEspecial = publicadores.stream().filter(p -> p.getTipoPublicador() == Publicador.TipoPublicador.ESPECIAL).count();
    
    int totalHorasAuxiliar = publicadores.stream()
        .filter(p -> p.getTipoPublicador() == Publicador.TipoPublicador.AUXILIAR)
        .mapToInt(Publicador::getHorasMes)
        .sum();
        
    int totalHorasRegular = publicadores.stream()
        .filter(p -> p.getTipoPublicador() == Publicador.TipoPublicador.REGULAR)
        .mapToInt(Publicador::getHorasMes)
        .sum();
        
    int totalEstudosAuxiliar = publicadores.stream()
        .filter(p -> p.getTipoPublicador() == Publicador.TipoPublicador.AUXILIAR)
        .mapToInt(Publicador::getEstudosBiblicos)
        .sum();
        
    int totalEstudosRegular = publicadores.stream()
        .filter(p -> p.getTipoPublicador() == Publicador.TipoPublicador.REGULAR)
        .mapToInt(Publicador::getEstudosBiblicos)
        .sum();
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Publicadores</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="menu.jsp" />
    
    <div class="container">
        <header class="page-header">
            <h1>👥 Lista de Publicadores</h1>
            <a href="publicadores?action=novo" class="btn btn-primary">➕ Novo Publicador</a>
        </header>

        <!-- Estatísticas -->
        <div class="stats-grid">
            <div class="stat-card">
                <h3>Total de Publicadores</h3>
                <span class="stat-number"><%= publicadores.size() %></span>
            </div>
            <div class="stat-card">
                <h3>Pioneiros Regulares</h3>
                <span class="stat-number"><%= totalRegular %></span>
            </div>
            <div class="stat-card">
                <h3>Pioneiros Auxiliares</h3>
                <span class="stat-number"><%= totalAuxiliar %></span>
            </div>
            <div class="stat-card">
                <h3>Publicadores Normais</h3>
                <span class="stat-number"><%= totalNormal %></span>
            </div>
        </div>

        <!-- Tabela de Publicadores -->
        <div class="table-container">
            <% if (publicadores.isEmpty()) { %>
                <div class="empty-state">
                    <p>📝 Nenhum publicador cadastrado ainda.</p>
                    <a href="publicadores?action=novo" class="btn btn-primary">Cadastrar Primeiro Publicador</a>
                </div>
            <% } else { %>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Tipo</th>
                            <th>Horas/Mês</th>
                            <th>Estudos</th>
                            <th>Participou</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Publicador p : publicadores) { %>
                        <tr>
                            <td><%= p.getNome() %></td>
                            <td>
                                <span class="badge badge-<%= p.getTipoPublicador().name().toLowerCase() %>">
                                    <%= p.getTipoPublicador().name() %>
                                </span>
                            </td>
                            <td><%= p.getHorasMes() %></td>
                            <td><%= p.getEstudosBiblicos() %></td>
                            <td>
                                <% if (p.isParticipou()) { %>
                                    <span class="status-active">✅</span>
                                <% } else { %>
                                    <span class="status-inactive">❌</span>
                                <% } %>
                            </td>
                            <td class="actions">
                                <a href="publicadores?action=editar&id=<%= p.getId() %>" class="btn btn-edit">✏️ Editar</a>
                                <a href="publicadores?action=excluir&id=<%= p.getId() %>" 
                                   class="btn btn-delete" 
                                   onclick="return confirm('Tem certeza que deseja excluir <%= p.getNome() %>?')">🗑️ Excluir</a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } %>
        </div>

        <!-- Totais por Tipo -->
        <div class="totais-section">
            <h3>📊 Totais por Categoria</h3>
            <div class="totais-grid">
                <div class="total-card">
                    <h4>Pioneiros Auxiliares</h4>
                    <p>Horas Totais: <strong><%= totalHorasAuxiliar %></strong></p>
                    <p>Estudos Totais: <strong><%= totalEstudosAuxiliar %></strong></p>
                </div>
                <div class="total-card">
                    <h4>Pioneiros Regulares</h4>
                    <p>Horas Totais: <strong><%= totalHorasRegular %></strong></p>
                    <p>Estudos Totais: <strong><%= totalEstudosRegular %></strong></p>
                </div>
            </div>
        </div>
    </div>
    
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>