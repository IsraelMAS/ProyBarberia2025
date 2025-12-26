<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ModeloDAO.ServicioDAO"%>
<%@ page import="Modelos.Servicio"%>
<%@ page import="Modelos.Paquete"%>
<%@ page import="Config.Conexion"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="ModeloDAO.PaqueteDAO"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>BARBERSHOP — Servicios</title>
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <link rel="stylesheet" href="CSS/app.css">
</head>
<body class="bg-dark text-white app-compact">

  <!-- Fondo global rotativo (JS lo llena) -->
  <div id="bgRotativo" class="bg-rotativo">
    <div class="bg-capa"></div>
  </div>

  <%@ include file="includes/navbar.jspf" %>

  <main>

    <!-- Título -->
    <section class="container text-center py-5">
      <h1 class="titulo-grande titulo-rwb fw-bold">💈Nuestros Servicios💈</h1>
      <p class="text-white-50 m-0">Cortes, barba y combos pensados para salir impecable.</p>
    </section>

    <!-- Anclas simples -->
    <section class="container text-center mb-3">
      <div class="d-inline-flex gap-2">
        <a href="#cortes"   class="btn btn-danger">Cortes</a>
        <a href="#paquetes" class="btn btn-primary">Paquetes</a>
      </div>
    </section>

    <!-- CORTES (6) -->
    <section id="cortes" class="container py-4">
      <div class="row row-cols-1 row-cols-md-3 g-4">
	<%
    // Capturamos el ID de la cita que viene en la URL para no perderlo
    String idCitaUrl = request.getParameter("txtIdCita");
    int idC = 0; // Valor por defecto
    
    if (idCitaUrl != null && !idCitaUrl.isEmpty()) {
        idC = Integer.parseInt(idCitaUrl);
    }
	%>
	<%
	  ServicioDAO dao = new ServicioDAO();
      List<Servicio> list = dao.listar();
      Iterator<Servicio> iter = list.iterator();
      Servicio per = null; 
      while (iter.hasNext()) {
        per = iter.next();
    %>
        <!-- 1 -->
        <article class="col">
          <div class="card bg-secondary text-white border border-primary h-100 card-eq zoomable" data-accent="primary">
            <div class="ratio ratio-4x3">
              <img data-fade
                   src="<%= per.getImagen() %>" 
           		   class="w-100 h-100 img-completa" 
                   alt="<%= per.getAlt() %>" loading="lazy">
            </div>
            <div class="card-body">
              <h5 class="card-title text-danger"><%= per.getNombre() %></h5>
              <p class="small text-white-50"><%= per.getDescripcion() %></p>
              <div class="d-flex gap-2 mb-2">
                <span class="badge bg-primary"><%= per.getDuracionMin() %> min</span>
                <span class="badge text-bg-dark border border-light"><%= per.getIncluye() %></span>
              </div>
              <div class="d-flex justify-content-between align-items-center">
                <span class="badge bg-danger fs-6">S/ <%= per.getPrecio() %></span>
                <a href="Horarios.jsp?id=<%= per.getId() %>&nombre=<%= per.getNombre() %>" 
   				class="btn btn-outline-light btn-sm">Seleccionar</a>
              </div>
            </div>
          </div>
        </article>
        
		<% 
     		} 
    	%>
      </div>
    </section>

    <!-- PAQUETES -->
    <section id="paquetes" class="container pb-5">
      <div class="row row-cols-1 row-cols-md-2 g-4">
      <%
      	PaqueteDAO daoP = new PaqueteDAO();
      	List<Paquete> listP = daoP.listar();
      	Iterator<Paquete> iterP = listP.iterator();
      	Paquete perP = null;

      	while (iterP.hasNext()) {
        perP = iterP.next();
      %>

        <article class="col">
          <div class="card bg-secondary text-white border border-primary h-100 p-3 zoomable" data-accent="primary">
            <h5 class="text-danger mb-2"><%= perP.getNombre() %></h5>
            <p class="mb-2"><%= perP.getDescripcion() %></p>
            <div class="small mb-3" style="white-space: pre-line;">
      			<%= perP.getDetalles() %>
    		</div>
            <div class="d-flex justify-content-between align-items-center">
              <span class="badge bg-light text-dark">S/ <%= perP.getPrecio() %></span>
              <a href="Horarios.jsp?id=<%= perP.getId() %>&nombre=<%= perP.getNombre() %>" class="btn btn-danger">Reservar</a>
            </div>
          </div>
        </article>

        
		<% } %>
      </div>
    </section>

    <!-- GALERÍA (carrusel compacto sin recorte) -->
    <section class="container my-5 galeria-compacta">
      <header class="text-center mb-3">
        <h2 class="titulo-rwb fw-bold">Galería de estilos</h2>
        <p class="text-white-50 mb-0">Un vistazo a algunos trabajos recientes.</p>
      </header>

      <div class="wrap">
        <div id="carruselGaleria" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2600">
          <div class="carousel-inner galeria-borde">

            <div class="carousel-item active">
              <div class="ratio ratio-16x9 bg-dark bg-opacity-50">
                <img src="IMG/CORTES Y BARBA/FadeCat.jpg" class="w-100 h-100 object-fit-contain" alt="Galería - Fade clean" loading="lazy">
              </div>
            </div>

            <div class="carousel-item">
              <div class="ratio ratio-16x9 bg-dark bg-opacity-50">
                <img src="IMG/CORTES Y BARBA/PompadourCat.jpg" class="w-100 h-100 object-fit-contain" alt="Galería - Pompadour" loading="lazy">
              </div>
            </div>

            <div class="carousel-item">
              <div class="ratio ratio-16x9 bg-dark bg-opacity-50">
                <img src="IMG/CORTES Y BARBA/PerfiladoBarbaCat.jpg" class="w-100 h-100 object-fit-contain" alt="Galería - Perfilado de barba" loading="lazy">
              </div>
            </div>

            <div class="carousel-item">
              <div class="ratio ratio-16x9 bg-dark bg-opacity-50">
                <img src="IMG/CORTES Y BARBA/BuzzCutCat.jpg" class="w-100 h-100 object-fit-contain" alt="Galería - Buzz Cut" loading="lazy">
              </div>
            </div>

            <div class="carousel-item">
              <div class="ratio ratio-16x9 bg-dark bg-opacity-50">
                <img src="IMG/CORTES Y BARBA/QuiffCat.jpg" class="w-100 h-100 object-fit-contain" alt="Galería - Quiff" loading="lazy">
              </div>
            </div>

          </div>

          <button class="carousel-control-prev" type="button" data-bs-target="#carruselGaleria" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Anterior</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carruselGaleria" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Siguiente</span>
          </button>

          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carruselGaleria" data-bs-slide-to="0" class="active" aria-current="true" aria-label="1"></button>
            <button type="button" data-bs-target="#carruselGaleria" data-bs-slide-to="1" aria-label="2"></button>
            <button type="button" data-bs-target="#carruselGaleria" data-bs-slide-to="2" aria-label="3"></button>
            <button type="button" data-bs-target="#carruselGaleria" data-bs-slide-to="3" aria-label="4"></button>
            <button type="button" data-bs-target="#carruselGaleria" data-bs-slide-to="4" aria-label="5"></button>
          </div>
        </div>
      </div>
    </section>

  </main>

  <%@ include file="includes/footer.jspf" %>

  <!-- Base para rutas en JS -->
  <script>window.APP_CTX = '<%= request.getContextPath() %>/';</script>
  <script src="<%= request.getContextPath() %>/JS/bootstrap.bundle.min.js"></script>
  <script src="<%= request.getContextPath() %>/JS/app.js"></script>
</body>
</html>
