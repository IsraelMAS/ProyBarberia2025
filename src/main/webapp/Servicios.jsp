<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        <!-- 1 -->
        <article class="col">
          <div class="card bg-secondary text-white border border-primary h-100 card-eq zoomable" data-accent="primary">
            <div class="ratio ratio-4x3">
              <img data-fade
                   src="IMG/CORTES Y BARBA/CorteFade.jpg"
                   class="w-100 h-100 img-completa" 
                   alt="Corte Fade degradado limpio" loading="lazy">
            </div>
            <div class="card-body">
              <h5 class="card-title text-danger">Corte Fade</h5>
              <p class="small text-white-50">Transición limpia en laterales y nuca. Acabado nítido.</p>
              <div class="d-flex gap-2 mb-2">
                <span class="badge bg-primary">30–40 min</span>
                <span class="badge text-bg-dark border border-light">Incluye peinado</span>
              </div>
              <div class="d-flex justify-content-between align-items-center">
                <span class="badge bg-danger fs-6">S/ 25</span>
                <a href="Horarios.jsp" class="btn btn-outline-light btn-sm">Reservar</a>
              </div>
            </div>
          </div>
        </article>

        <!-- 2 -->
        <article class="col">
          <div class="card bg-secondary text-white border border-primary h-100 card-eq zoomable" data-accent="danger">
            <div class="ratio ratio-4x3">
              <img data-fade
                   src="IMG/CORTES Y BARBA/CorteClasico.jpg"
                   class="w-100 h-100 img-completa" 
                   alt="Corte clásico masculino" loading="lazy">
            </div>
            <div class="card-body">
              <h5 class="card-title text-primary">Corte Clásico</h5>
              <p class="small text-white-50">Tradicional y prolijo. Perfecto para oficina o estudio.</p>
              <div class="d-flex gap-2 mb-2">
                <span class="badge bg-primary">25–35 min</span>
                <span class="badge text-bg-dark border border-light">Corte a tijera</span>
              </div>
              <div class="d-flex justify-content-between align-items-center">
                <span class="badge bg-danger fs-6">S/ 22</span>
                <a href="Horarios.jsp" class="btn btn-outline-light btn-sm">Reservar</a>
              </div>
            </div>
          </div>
        </article>

        <!-- 3 -->
        <article class="col">
          <div class="card bg-secondary text-white border border-primary h-100 card-eq zoomable" data-accent="primary">
            <div class="ratio ratio-4x3">
              <img data-fade
                   src="IMG/CORTES Y BARBA/Pompadour.jpg"
                   class="w-100 h-100 img-completa" 
                   alt="Corte Pompadour volumen" loading="lazy">
            </div>
            <div class="card-body">
              <h5 class="card-title text-danger">Pompadour</h5>
              <p class="small text-white-50">Volumen arriba con laterales prolijos. Look llamativo.</p>
              <div class="d-flex gap-2 mb-2">
                <span class="badge bg-primary">35–45 min</span>
                <span class="badge text-bg-dark border border-light">Secado y styling</span>
              </div>
              <div class="d-flex justify-content-between align-items-center">
                <span class="badge bg-danger fs-6">S/ 28</span>
                <a href="Horarios.jsp" class="btn btn-outline-light btn-sm">Reservar</a>
              </div>
            </div>
          </div>
        </article>

        <!-- 4 -->
        <article class="col">
          <div class="card bg-secondary text-white border border-primary h-100 card-eq zoomable" data-accent="danger">
            <div class="ratio ratio-4x3">
              <img data-fade
                   src="IMG/CORTES Y BARBA/PerfiladoBarba.jpg"
                   class="w-100 h-100 img-completa" 
                   alt="Perfilado de barba recto y preciso" loading="lazy">
            </div>
            <div class="card-body">
              <h5 class="card-title text-danger">Perfilado de Barba</h5>
              <p class="small text-white-50">Definición con línea precisa y longitud a medida.</p>
              <div class="d-flex gap-2 mb-2">
                <span class="badge bg-primary">20–30 min</span>
                <span class="badge text-bg-dark border border-light">Aceite/baume</span>
              </div>
              <div class="d-flex justify-content-between align-items-center">
                <span class="badge bg-danger fs-6">S/ 18</span>
                <a href="Horarios.jsp" class="btn btn-outline-light btn-sm">Reservar</a>
              </div>
            </div>
          </div>
        </article>

        <!-- 5 -->
        <article class="col">
          <div class="card bg-secondary text-white border border-primary h-100 card-eq zoomable" data-accent="primary">
            <div class="ratio ratio-4x3">
              <img data-fade
                   src="IMG/CORTES Y BARBA/CorteBarbaTradicional.jpg"
                   class="w-100 h-100 img-completa" 
                   alt="Afeitado con toalla caliente" loading="lazy">
            </div>
            <div class="card-body">
              <h5 class="card-title text-primary">Afeitado con Toalla Caliente</h5>
              <p class="small text-white-50">Relajante y con acabado al ras.</p>
              <div class="d-flex gap-2 mb-2">
                <span class="badge bg-primary">25–35 min</span>
                <span class="badge text-bg-dark border border-light">After shave</span>
              </div>
              <div class="d-flex justify-content-between align-items-center">
                <span class="badge bg-danger fs-6">S/ 20</span>
                <a href="Horarios.jsp" class="btn btn-outline-light btn-sm">Reservar</a>
              </div>
            </div>
          </div>
        </article>

        <!-- 6 -->
        <article class="col">
          <div class="card bg-secondary text-white border border-primary h-100 card-eq zoomable" data-accent="danger">
            <div class="ratio ratio-4x3">
              <img data-fade
                   src="IMG/CORTES Y BARBA/BuzzCut.jpg"
                   class="w-100 h-100 img-completa" 
                   alt="Buzz cut máquina a una medida" loading="lazy">
            </div>
            <div class="card-body">
              <h5 class="card-title text-danger">Buzz Cut</h5>
              <p class="small text-white-50">Rápido, parejo y fresco. Ideal para bajo mantenimiento.</p>
              <div class="d-flex gap-2 mb-2">
                <span class="badge bg-primary">15–20 min</span>
                <span class="badge text-bg-dark border border-light">Máquina n° fija</span>
              </div>
              <div class="d-flex justify-content-between align-items-center">
                <span class="badge bg-danger fs-6">S/ 15</span>
                <a href="Horarios.jsp" class="btn btn-outline-light btn-sm">Reservar</a>
              </div>
            </div>
          </div>
        </article>

      </div>
    </section>

    <!-- PAQUETES -->
    <section id="paquetes" class="container pb-5">
      <div class="row row-cols-1 row-cols-md-2 g-4">

        <article class="col">
          <div class="card bg-secondary text-white border border-primary h-100 p-3 zoomable" data-accent="primary">
            <h5 class="text-danger mb-2">Combo Corte + Barba</h5>
            <p class="mb-2">Corte a elección + perfilado de barba. Renueva tu look completo.</p>
            <ul class="mb-3">
              <li>Lavado rápido</li>
              <li>Peinado y acabado</li>
            </ul>
            <div class="d-flex justify-content-between align-items-center">
              <span class="badge bg-light text-dark">S/ 38</span>
              <a href="Horarios.jsp" class="btn btn-danger">Reservar</a>
            </div>
          </div>
        </article>

        <article class="col">
          <div class="card bg-secondary text-white border border-danger h-100 p-3 zoomable" data-accent="danger">
            <h5 class="text-primary mb-2">Combo Ejecutivo</h5>
            <p class="mb-2">Corte clásico + afeitado con toalla caliente. Imagen formal.</p>
            <ul class="mb-3">
              <li>Toalla caliente</li>
              <li>After shave</li>
            </ul>
            <div class="d-flex justify-content-between align-items-center">
              <span class="badge bg-light text-dark">S/ 42</span>
              <a href="Horarios.jsp" class="btn btn-primary">Reservar</a>
            </div>
          </div>
        </article>

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
