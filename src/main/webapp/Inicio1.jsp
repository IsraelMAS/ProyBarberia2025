<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String v = request.getParameter("v");
  if (v == null || v.isEmpty()) v = "inicio";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>BARBERSHOP</title>
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<body class="bg-dark text-white">

  <!-- NAVBAR -->
  <header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-black border-bottom border-primary">
      <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="?v=inicio">💈 BARBERSHOP</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
          <span class="navbar-toggler-icon"></span>
        </button>
        <section class="collapse navbar-collapse" id="menu">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="?v=inicio">Inicio</a></li>
            <li class="nav-item"><a class="nav-link" href="?v=servicios">Servicios</a></li> 
            <li class="nav-item"><a class="nav-link" href="?v=horarios">Horarios</a></li>
            <li class="nav-item"><a class="nav-link" href="?v=contacto">Contacto</a></li>
          </ul>
        </section>
      </div>
    </nav>
  </header>

  <!-- CONTENIDO SEGÚN v -->
  <main>

  <% if ("inicio".equals(v)) { %>
  
    <!-- INICIO (con banner) -->
      <%-- 
    <figure class="m-0">
  <img src="IMG/Banner_barberia.jpg"
       alt="Banner Barbería"
       class="img-fluid w-100 d-block mx-auto">
</figure>
    --%>
<br>
 <figure class="text-center">
  <img src="IMG/Banner_barberia.jpg"
       alt="Banner Barbería"
       class="img-fluid w-75">
</figure>

    <article class="text-center p-4">
      <h1 class="text-danger">Bienvenido a la Barbería Top #1 de Independencia</h1>
      <p class="text-primary mt-2">Cortes con estilo y buena vibra.</p>
    </article>

    <section class="container text-center mb-5">
      <h2 class="text-primary">Sobre nosotros</h2>
      <p>Experiencia, detalle y atención para (añadir info)......</p>
    </section>

  <% } else if ("servicios".equals(v)) { %>
    <!-- SERVICIOS -->
    <section class="container my-5 text-center">
      <h2 class="text-danger mb-4">Nuestros Servicios</h2>

      <section class="row g-3">
        <article class="col-md-4">
          <section class="card bg-secondary text-white border border-primary h-100">
            <header class="card-header fs-3 text-center">✂️</header>
            <section class="card-body">
              <h3 class="card-title text-danger">Corte Clásico</h3>
              <p>Estilo limpio y tradicional.</p>
            </section>
          </section>
        </article>

        <article class="col-md-4">
          <section class="card bg-secondary text-white border border-danger h-100">
            <header class="card-header fs-3 text-center">🧖</header>
            <section class="card-body">
              <h3 class="card-title text-primary">Afeitado con Toalla Caliente</h3>
              <p>Experiencia relajante y prolija.</p>
            </section>
          </section>
        </article>

        <article class="col-md-4">
          <section class="card bg-secondary text-white border border-primary h-100">
            <header class="card-header fs-3 text-center">🧔</header>
            <section class="card-body">
              <h3 class="card-title text-danger">Perfilado de Barba</h3>
              <p>Diseño y definición precisa.</p>
            </section>
          </section>
        </article>
      </section>
    </section>

  <% } else if ("horarios".equals(v)) { %>
    <!-- HORARIOS -->
    <section class="container my-5">
      <h2 class="text-primary text-center mb-4">Horarios y Reserva</h2>

      <section class="row g-4">
        <aside class="col-lg-6">
          <article class="bg-secondary p-3 rounded">
            <h3 class="text-danger">Horarios disponibles</h3>
            <table class="table table-dark table-striped table-bordered mb-0">
              <thead><tr><th>Turno</th><th>Horas</th></tr></thead>
              <tbody>
                <tr><td>Mañana</td><td>09:00 - 12:00</td></tr>
                <tr><td>Tarde</td><td>14:00 - 17:00</td></tr>
                <tr><td>Noche</td><td>18:00 - 20:00</td></tr>
              </tbody>
            </table>
            <small class="text-white-50">*Demostración sin backend.</small>
          </article>
        </aside>

        <article class="col-lg-6">
          <section class="bg-secondary p-3 rounded">
            <h3 class="text-primary">Reservar cita</h3>
            <form action="#" method="post">
              <label class="form-label">Nombre</label>
              <input type="text" class="form-control mb-2" required>

              <label class="form-label">Teléfono</label>
              <input type="tel" class="form-control mb-2" required>

              <label class="form-label">Fecha</label>
              <input type="date" class="form-control mb-2" required>

              <label class="form-label">Hora</label>
              <select class="form-select mb-3" required>
                <option value="">Selecciona una hora</option>
                <option>09:00</option><option>10:00</option><option>11:00</option>
                <option>14:00</option><option>15:00</option><option>16:00</option>
                <option>18:00</option><option>19:00</option>
              </select>

              <section class="d-flex gap-2">
                <button class="btn btn-danger">Reservar</button>
                <button type="reset" class="btn btn-primary">Limpiar</button>
              </section>
            </form>
          </section>
        </article>
      </section>
    </section>

  <% } else if ("contacto".equals(v)) { %>
    <!-- CONTACTO -->
    <section class="container my-5 text-center">
      <h2 class="text-danger mb-3">Contacto</h2>
      <address>
        <p>📍 Av. Ejemplo 123, Independencia</p>
        <p>📞 989 123 568</p>
        <p>✉️ barberia@ejemplo.com</p>
      </address>
    </section>
  <% } %>

  </main>

  <!-- FOOTER  -->
  <footer class="text-center py-3 border-top border-primary mt-4">
    <small class="text-white-50">© BARBERSHOP — Proyecto estudiantil</small>
  </footer>

  <script src="JS/bootstrap.bundle.min.js"></script>
</body>
</html>
