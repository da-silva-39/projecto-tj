<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar">
    <div class="nav-container">
        <div class="nav-logo">
            <h2>📖 Sistema de Publicadores</h2>
        </div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">🏠 Home</a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/publicadores" class="nav-link">👥 Publicadores</a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/publicadores?action=novo" class="nav-link">➕ Novo Publicador</a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/publicadores?action=relatorios" class="nav-link">📊 Relatórios</a>
            </li>
        </ul>
    </div>
</nav>