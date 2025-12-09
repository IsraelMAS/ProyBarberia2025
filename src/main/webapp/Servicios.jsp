<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>BARBERSHOP — Servicios</title>
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<body class="bg-dark text-white">

  <%@ include file="includes/navbar.jspf" %>

  <main class="container my-5 text-center">
    <h2 class="text-danger mb-4">Nuestros Servicios</h2>

    <section class="row g-3">
      <article class="col-md-4">
        <section class="card bg-secondary text-white border border-primary h-100">
          <header class="card-header fs-3 text-center">✂️</header>
          <div class="card-body">
            <h3 class="card-title text-danger">Corte Clásico</h3>
            <p>Estilo limpio y tradicional.</p>
          </div>
        </section>
      </article>

      <article class="col-md-4">
        <section class="card bg-secondary text-white border border-danger h-100">
          <header class="card-header fs-3 text-center">🧖</header>
          <div class="card-body">
            <h3 class="card-title text-primary">Afeitado con Toalla Caliente</h3>
            <p>Experiencia relajante y prolija.</p>
          </div>
        </section>
      </article>

      <article class="col-md-4">
        <section class="card bg-secondary text-white border border-primary h-100">
          <header class="card-header fs-3 text-center">🧔</header>
          <div class="card-body">
            <h3 class="card-title text-danger">Perfilado de Barba</h3>
            <p>Diseño y definición precisa.</p>
          </div>
        </section>
      </article>
    </section>
  </main>

  <%@ include file="includes/footer.jspf" %>
  <script src="JS/bootstrap.bundle.min.js"></script>
</body>
</html>
