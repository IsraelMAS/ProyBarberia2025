<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ModeloDAO.HorarioDAO"%>
<%@ page import="Modelos.Horario"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="ModeloDAO.BarberoDAO"%>
<%@ page import="Modelos.Barbero"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>BARBERSHOP — Barberos</title>
  <link rel="icon" href="IMG/ICONOS/BarberShop_ICO.ico">
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <link rel="stylesheet" href="CSS/Barberos.css">
  <link rel="stylesheet" href="CSS/app.css">
</head>

<body class="bg-dark text-white">

  <!-- Fondo (solo CSS) -->
  <div class="bg-wallpaper" aria-hidden="true"></div>

  <%@ include file="includes/navbar.jspf" %>

  <main class="container py-5">

    <!-- HERO -->
    <header class="text-center mb-4">
      <span class="badge badge-rwb px-3 py-2 mb-3">BARBERSHOP • EQUIPO</span>
      <h1 class="display-6 fw-bold titulo-rwb">💈 Elige a tu barbero 💈</h1>
      <p class="text-white-50 mb-0">
        Reserva con confianza: mira especialidades, experiencia, rating y horarios sugeridos.
      </p>
    </header>

    <!-- CONTROLES: SOLO FILTROS (sin barra de buscar) -->
    <section class="card bg-black bg-opacity-50 border border-secondary rounded-4 shadow-sm mb-4">
      <div class="card-body">
        <div class="row g-3 align-items-center">
          <div class="col-lg-6">
            <label class="form-label text-white-50">Filtrar por especialidad</label>
            <select id="selectEspecialidad" class="form-select bg-dark text-white border-secondary">
              <option value="todos">Todos</option>
              <option value="degradados">Degradados</option>
              <option value="barbas">Barbas</option>
              <option value="clasicos">Clásicos</option>
              <option value="disenos">Diseños</option>
              <option value="tinturas">Tinturas</option>
            </select>
          </div>

          <div class="col-lg-6">
            <label class="form-label text-white-50">Ordenar</label>
            <select id="selectOrden" class="form-select bg-dark text-white border-secondary">
              <option value="recomendado">Recomendado</option>
              <option value="experiencia">Más experiencia</option>
              <option value="rating">Mejor rating</option>
              <option value="nombre">Nombre (A-Z)</option>
            </select>
          </div>
        </div>
      </div>
    </section>

	   <!-- GRID DE BARBEROS -->
	<section id="gridBarberos" class="row g-4">
    <%
      // Usamos el DAO de barberos para traer la lista
      BarberoDAO bDao = new BarberoDAO();
      List<Barbero> listaB = bDao.listar();
      Iterator<Barbero> iterB = listaB.iterator();
      Barbero perB = null; 
      
      while (iterB.hasNext()) {
          perB = iterB.next();
    %>
      <div class="col-12 col-md-6 col-lg-3 barbero-item">
        <article class="card bg-secondary text-light h-100 shadow-sm border-0 barber-card">
          <div class="card-body text-center">
            <img src="<%= perB.getImagen() %>" class="avatar-barbero" alt="<%= perB.getNombre() %>" loading="lazy">
            <h5 class="card-title mt-3 mb-1 fw-bold"><%= perB.getNombre() %></h5>
    
            <div class="d-flex justify-content-center gap-2 mb-2 flex-wrap">
              <span class="badge bg-primary"><%= perB.getEspecialidad() %></span>
              <span class="badge bg-dark border border-light border-opacity-25"><%= perB.getExperiencia() %> años</span>
              <span class="badge bg-warning text-dark">★ <%= perB.getRating() %></span>
            </div>
    
            <p class="card-text text-white-50 mb-3"><%= perB.getDescripcion() %></p>
    
            <div class="d-grid gap-2">
              <a class="btn btn-danger btn-sm" 
                 href="Horarios.jsp?idBarbero=<%= perB.getIdBarbero() %>&nombreBarbero=<%= perB.getNombre() %>">
                 Reservar
              </a>
            </div>
          </div>
        </article>
      </div>
    <% 
      } // Fin del while 
    %>
</section>
	 
	
	
	    <!-- CTA FINAL -->
	    <section class="card bg-black bg-opacity-50 border border-secondary rounded-4 shadow-sm mt-5">
	      <div class="card-body p-4 d-flex flex-column flex-md-row align-items-center justify-content-between gap-3">
	        <div>
	          <h3 class="mb-1 fw-bold">¿Listo para tu próximo corte? ✂️</h3>
	          <p class="text-white-50 mb-0">Elige barbero, elige horario y quedas fino en 2 clicks.</p>
	        </div>
	        <div class="d-flex gap-2">
	          <a href="Horarios.jsp" class="btn btn-danger px-4">Ir a horarios</a>
	        </div>
	      </div>
	    </section>
	
	  </main>

 
  <%@ include file="includes/footer.jspf" %>

  <!-- Scripts: Bootstrap primero, luego tu JS (corregido el include) -->
  <script src="JS/bootstrap.bundle.min.js"></script>
  <script src="JS/Barberos.js"></script>
</body>
</html>
