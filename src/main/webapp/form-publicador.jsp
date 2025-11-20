<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Publicador" %>
<%
    Publicador publicador = (Publicador) request.getAttribute("publicador");
    boolean isEdicao = publicador != null;
    String nome = isEdicao ? publicador.getNome() : "";
    String tipo = isEdicao ? publicador.getTipoPublicador().name() : "";
    int horas = isEdicao ? publicador.getHorasMes() : 0;
    int estudos = isEdicao ? publicador.getEstudosBiblicos() : 0;
    boolean participou = isEdicao ? publicador.isParticipou() : false;
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= isEdicao ? "Editar" : "Novo" %> Publicador</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="menu.jsp" />
    
    <div class="container">
        <div class="form-container">
            <h1><%= isEdicao ? "✏️ Editar Publicador" : "➕ Novo Publicador" %></h1>
            
            <form action="publicadores" method="post" class="publicador-form" id="publicadorForm">
                <% if (isEdicao) { %>
                    <input type="hidden" name="action" value="atualizar">
                    <input type="hidden" name="id" value="<%= publicador.getId() %>">
                <% } else { %>
                    <input type="hidden" name="action" value="adicionar">
                <% } %>
                
                <div class="form-group">
                    <label for="nome">Nome do Publicador:</label>
                    <input type="text" id="nome" name="nome" value="<%= nome %>" required 
                           placeholder="Digite o nome completo">
                </div>
                
                <div class="form-group">
                    <label for="tipo">Tipo de Publicador:</label>
                    <select id="tipo" name="tipo" required>
                        <option value="">Selecione o tipo</option>
                        <option value="NORMAL" <%= "NORMAL".equals(tipo) ? "selected" : "" %>>Normal</option>
                        <option value="AUXILIAR" <%= "AUXILIAR".equals(tipo) ? "selected" : "" %>>Pioneiro Auxiliar</option>
                        <option value="REGULAR" <%= "REGULAR".equals(tipo) ? "selected" : "" %>>Pioneiro Regular</option>
                        <option value="ESPECIAL" <%= "ESPECIAL".equals(tipo) ? "selected" : "" %>>Pioneiro Especial</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="horas">Horas no Mês:</label>
                    <input type="number" id="horas" name="horas" min="0" max="200" 
                           value="<%= horas %>" required>
                </div>
                
                <div class="form-group">
                    <label for="estudos">Estudos Bíblicos:</label>
                    <input type="number" id="estudos" name="estudos" min="0" max="50" 
                           value="<%= estudos %>" required>
                </div>
                
                <div class="form-group checkbox-group">
                    <input type="checkbox" id="participou" name="participou" 
                           <%= participou ? "checked" : "" %>>
                    <label for="participou">✅ Participou este mês</label>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        <%= isEdicao ? "💾 Atualizar" : "💾 Cadastrar" %>
                    </button>
                    <a href="publicadores" class="btn btn-secondary">↩️ Cancelar</a>
                </div>
            </form>
        </div>
    </div>
    
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>