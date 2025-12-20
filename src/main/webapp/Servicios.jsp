<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List"%>
<%@ page import="Modelos.Servicio"%>
<%@ page import="ModeloDAO.ServicioDAO"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>BARBERSHOP — Servicios</title>
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<style>
  /* alto consistente + imagen recortada parejo */
  .card-eq { display:flex; flex-direction:column; height:100%; }
  .card-eq .ratio > img { width:100%; height:100%; object-fit:cover; }

  /* micro-zoom y sombra suave */
  .zoomable { transition: transform .25s ease, box-shadow .25s ease, border-color .25s ease; }
  .zoomable:hover { transform: translateY(-4px) scale(1.02); box-shadow: 0 .5rem 1rem rgba(0,0,0,.35); }
  .zoomable:active { transform: scale(1.04); }

  /* pinta el borde al hover en rojo/azul alternado (usa data-accent) */
  .zoomable[data-accent="danger"]:hover { border-color:#dc3545 !important; }
  .zoomable[data-accent="primary"]:hover { border-color:#0d6efd !important; }

  /* pills grandes, blancas y con “glow” */
  .pill-xl .nav-link { color:#fff; font-weight:600; font-size:1.05rem; padding:.6rem 1rem; }
  .pill-xl .nav-link:hover { filter: brightness(1.12); }
</style>



<body class="bg-dark text-white">

  <%@ include file="includes/navbar.jspf" %>

  <!-- SERVICIOS -->
    <section class="container my-5">

  <header class="text-center mb-4">
    <h2 class="text-danger mb-1">Nuestros Servicios</h2>
    <p class="text-white-50 mb-0">Cortes y cuidado de barba con enfoque profesional.</p>
  </header>

  <!-- Pills grandes -->
  <ul class="nav nav-pills justify-content-center gap-3 pill-xl mb-4">
    <li class="nav-item"><a class="nav-link bg-danger"  href="#cortes">Cortes</a></li>
    <li class="nav-item"><a class="nav-link bg-primary" href="#barba">Barba</a></li>
    <li class="nav-item"><a class="nav-link bg-secondary" href="#paquetes">Paquetes</a></li>
  </ul>
	
  <!-- GRID CORTES (3 columnas parejitas) -->
  <section id="cortes" class="row row-cols-1 row-cols-md-3 g-4">
		
		<%
            ServicioDAO dao = new ServicioDAO();
            List<Servicio> lista = dao.listar();
            for (Servicio s : lista) {
        %>
    <!-- Corte Fade -->
    <article class="col">
      <div class="card card-eq bg-secondary text-white border border-2 border-primary zoomable" data-accent="primary">
        <div class="ratio ratio-4x3">
          <img src="IMG/CORTES Y BARBA/CorteFade.jpg"
               alt="Corte fade (degradado alto) en barberia; laterales desvanecidos y acabado nitido">
        </div>
        <div class="card-body d-flex flex-column">
          <h5 class="card-title text-danger mb-1">Corte Fade</h5>
          <p class="card-text mb-3">Transicion limpia en laterales y nuca. Acabado nitido.</p>
          <ul class="list-inline small mb-3">
            <li class="list-inline-item badge bg-primary">30-40 min</li>
            <li class="list-inline-item badge bg-danger">Incluye peinado</li>
          </ul>
          <div class="mt-auto d-flex justify-content-between align-items-center">
            <span class="badge bg-light text-dark">S/ 25</span>
            <a class="btn btn-danger btn-sm" href="ControladorCita?accion=formulario&idServicio=<%=s.getIdServicio()%>&nombreServicio=<%=s.getNombre()%>">Reservar</a>
          </div>
        </div>
      </div>
    </article>

    <!-- Corte Clasico -->
    <article class="col">
      <div class="card card-eq bg-secondary text-white border border-2 border-danger zoomable" data-accent="danger">
        <div class="ratio ratio-4x3">
          <img src="IMG/CORTES Y BARBA/CorteClasico.jpg"
               alt="Corte clasico masculino, estilo formal a tijera con raya lateral">
        </div>
        <div class="card-body d-flex flex-column">
          <h5 class="card-title text-primary mb-1">Corte Clasico</h5>
          <p class="card-text mb-3">Estilo tradicional y formal, perfecto para oficina o estudio.</p>
          <ul class="list-inline small mb-3">
            <li class="list-inline-item badge bg-primary">25-35 min</li>
            <li class="list-inline-item badge bg-danger">Corte a tijera</li>
          </ul>
          <div class="mt-auto d-flex justify-content-between align-items-center">
            <span class="badge bg-light text-dark">S/ 22</span>
            <a class="btn btn-primary btn-sm" href="Horarios.jsp">Reservar</a>
          </div>
        </div>
      </div>
    </article>

    <!-- Pompadour -->
    <article class="col">
      <div class="card card-eq bg-secondary text-white border border-2 border-primary zoomable" data-accent="primary">
        <div class="ratio ratio-4x3">
          <img src="IMG/CORTES Y BARBA/Pompadour.jpg"
               alt="Peinado pompadour con volumen frontal y laterales prolijos">
        </div>
        <div class="card-body d-flex flex-column">
          <h5 class="card-title text-danger mb-1">Pompadour</h5>
          <p class="card-text mb-3">Volumen arriba con laterales prolijos. Look llamativo.</p>
          <ul class="list-inline small mb-3">
            <li class="list-inline-item badge bg-primary">35-45 min</li>
            <li class="list-inline-item badge bg-danger">Secado y styling</li>
          </ul>
          <div class="mt-auto d-flex justify-content-between align-items-center">
            <span class="badge bg-light text-dark">S/ 28</span>
            <a class="btn btn-danger btn-sm" href="Horarios.jsp">Reservar</a>
          </div>
        </div>
      </div>
    </article>
<% } %>
  </section>
 

  <!-- GRID BARBA -->
  <section id="barba" class="row row-cols-1 row-cols-md-3 g-4 mt-4">

    <article class="col">
      <div class="card card-eq bg-secondary text-white border border-2 border-primary zoomable" data-accent="primary">
        <div class="ratio ratio-4x3">
          <img src="IMG/CORTES Y BARBA/PerfiladoBarba.jpg"
               alt="Perfilado de barba con lineas definidas y contorno preciso">
        </div>
        <div class="card-body d-flex flex-column">
          <h5 class="card-title text-danger mb-1">Perfilado de Barba</h5>
          <p class="card-text mb-3">Definicion con linea precisa y longitud a medida.</p>
          <ul class="list-inline small mb-3">
            <li class="list-inline-item badge bg-primary">20-30 min</li>
            <li class="list-inline-item badge bg-danger">Aceite/baume</li>
          </ul>
          <div class="mt-auto d-flex justify-content-between align-items-center">
            <span class="badge bg-light text-dark">S/ 18</span>
            <a class="btn btn-danger btn-sm" href="Horarios.jsp">Reservar</a>
          </div>
        </div>
      </div>
    </article>

    <article class="col">
      <div class="card card-eq bg-secondary text-white border border-2 border-danger zoomable" data-accent="danger">
        <div class="ratio ratio-4x3">
          <img src="IMG/CORTES Y BARBA/CorteBarbaTradicional.jpg"
               alt="Afeitado tradicional con toalla caliente y navaja barbera">
        </div>
        <div class="card-body d-flex flex-column">
          <h5 class="card-title text-primary mb-1">Afeitado con Toalla Caliente</h5>
          <p class="card-text mb-3">Experiencia relajante con acabado al ras.</p>
          <ul class="list-inline small mb-3">
            <li class="list-inline-item badge bg-primary">25-35 min</li>
            <li class="list-inline-item badge bg-danger">After shave</li>
          </ul>
          <div class="mt-auto d-flex justify-content-between align-items-center">
            <span class="badge bg-light text-dark">S/ 20</span>
            <a class="btn btn-primary btn-sm" href="Horarios.jsp">Reservar</a>
          </div>
        </div>
      </div>
    </article>

    <article class="col">
      <div class="card card-eq bg-secondary text-white border border-2 border-primary zoomable" data-accent="primary">
        <div class="ratio ratio-4x3">
          <img src="IMG/CORTES Y BARBA/BuzzCut.jpg"
               alt="Buzz cut corto y parejo con maquina; look de bajo mantenimiento">
        </div>
        <div class="card-body d-flex flex-column">
          <h5 class="card-title text-danger mb-1">Buzz Cut</h5>
          <p class="card-text mb-3">Rapido, parejo y fresco. Ideal para bajo mantenimiento.</p>
          <ul class="list-inline small mb-3">
            <li class="list-inline-item badge bg-primary">15-20 min</li>
            <li class="list-inline-item badge bg-danger">Maquina n&ordm; fija</li>
          </ul>
          <div class="mt-auto d-flex justify-content-between align-items-center">
            <span class="badge bg-light text-dark">S/ 15</span>
            <a class="btn btn-danger btn-sm" href="Horarios.jsp">Reservar</a>
          </div>
        </div>
      </div>
    </article>

  </section>

  <!-- PAQUETES -->
  <section id="paquetes" class="row row-cols-1 row-cols-md-2 g-4 mt-4">
    <article class="col">
      <div class="card card-eq bg-secondary text-white border border-2 border-primary zoomable" data-accent="primary">
        <div class="card-body d-flex flex-column">
          <h5 class="card-title text-danger">Combo Corte + Barba</h5>
          <p class="card-text">Corte a eleccion + perfilado de barba. Renueva tu look completo.</p>
          <ul class="small mb-3">
            <li>Lavado rapido</li>
            <li>Peinado y acabado</li>
          </ul>
          <div class="mt-auto d-flex justify-content-between align-items-center">
            <span class="badge bg-light text-dark">S/ 38</span>
            <a class="btn btn-danger btn-sm" href="Horarios.jsp">Reservar</a>
          </div>
        </div>
      </div>
    </article>

    <article class="col">
      <div class="card card-eq bg-secondary text-white border border-2 border-danger zoomable" data-accent="danger">
        <div class="card-body d-flex flex-column">
          <h5 class="card-title text-primary">Combo Ejecutivo</h5>
          <p class="card-text">Corte clasico + afeitado con toalla caliente. Imagen formal.</p>
          <ul class="small mb-3">
            <li>Toalla caliente</li>
            <li>After shave</li>
          </ul>
          <div class="mt-auto d-flex justify-content-between align-items-center">
            <span class="badge bg-light text-dark">S/ 42</span>
            <a class="btn btn-primary btn-sm" href="Horarios.jsp">Reservar</a>
          </div>
        </div>
      </div>
    </article>
  </section>

   
  <!-- GALERIA (ya te queda alineada usando ratio si quieres) -->
  <section class="mt-5">
    <h3 class="text-center text-danger mb-3">Galeria de Estilos</h3>
    <div class="row row-cols-1 row-cols-md-3 g-3">
      <figure class="col m-0">
        <div class="ratio ratio-4x3">
          <img class="img-fluid rounded border border-primary"
               src="IMG/CORTES Y BARBA/FadeCat.jpg"
               alt="Degradado fade limpio en laterales y nuca">
        </div>
        <figcaption class="small text-center mt-1 text-white-50">Fade</figcaption>
      </figure>
      <figure class="col m-0">
        <div class="ratio ratio-4x3">
          <img class="img-fluid rounded border border-danger"
               src="IMG/CORTES Y BARBA/PompadourCat.jpg"
               alt="Pompadour con alto volumen y brillo">
        </div>
        <figcaption class="small text-center mt-1 text-white-50">Pompadour</figcaption>
      </figure>
      <figure class="col m-0">
        <div class="ratio ratio-4x3">
          <img class="img-fluid rounded border border-primary"
               src="IMG/CORTES Y BARBA/QuiffCat.jpg"
               alt="Quiff peinado hacia arriba con textura">
        </div>
        <figcaption class="small text-center mt-1 text-white-50">Quiff</figcaption>
      </figure>
      <figure class="col m-0">
        <div class="ratio ratio-4x3">
          <img class="img-fluid rounded border border-danger"
               src="IMG/CORTES Y BARBA/BuzzCutCat.jpg"
               alt="Corte al ras uniforme con maquina">
        </div>
        <figcaption class="small text-center mt-1 text-white-50">Buzz cut</figcaption>
      </figure>
      <figure class="col m-0">
        <div class="ratio ratio-4x3">
          <img class="img-fluid rounded border border-primary"
               src="IMG/CORTES Y BARBA/PerfiladoBarbaCat.jpg"
               alt="Barba recortada y alineada con acabado definido">
        </div>
        <figcaption class="small text-center mt-1 text-white-50">Perfilado de barba</figcaption>
      </figure>
    </div>
    <p class="small text-center text-white-50 mt-2">*Imagenes locales de demostracion.</p>
  </section>

</section>

  <%-- footer --%>
  <%@ include file="includes/footer.jspf" %>
  
  <script src="JS/bootstrap.bundle.min.js"></script>
</body>
</html>
