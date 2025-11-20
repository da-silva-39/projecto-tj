<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/login.css">
</head>

<body>

<div class="login-box">

    <h2>Bem-vindo Joao Anibal da Silva</h2>
    <p>Entre para acessar o sistema</p>

    <form action="login" method="post">

        <label>Password</label>
<input type="password" id="password" name="password" required>


<div class="show-box">
    <label for="showPass">Mostrar password</label>
    <input type="checkbox" id="showPass" onclick="togglePass()">
   
</div>


        <button type="submit">Entrar</button>

        <p class="error">${error}</p>

    </form>
</div>

<script>
function togglePass() {
    let field = document.getElementById("password");
    field.type = field.type === "password" ? "text" : "password";
}
</script>

</body>
</html>
