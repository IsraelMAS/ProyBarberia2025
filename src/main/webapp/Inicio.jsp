<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>BARBERSHOP — Inicio</title>
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<body class="bg-dark text-white">

  <%@ include file="includes/navbar.jspf" %>
  <main>
  <br>
     <figure class="text-center">
  <img src="IMG/Banner_barberia.jpg"
       alt="Banner Barbería"
       class="img-fluid w-75">
</figure>

    <header class="text-center py-4">
      <h1 class="text-danger">Bienvenido a la Barbería Top #1 de Independencia</h1>
    </header>

    <section class="container text-center mb-5">
      <h2 class="text-primary">Sobre nosotros</h2>
      <p class="mt-2">Cortes con estilo, atención con buena vibra y resultados profesionales.</p>
    </section>
  </main>

  <%@ include file="includes/footer.jspf" %>
  <script src="JS/bootstrap.bundle.min.js"></script>
</body>
</html>
