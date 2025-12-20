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

    <!-- HEADER: Banner / Hero -->
    <header id="hero" class="container-fluid px-0">
      <div id="banner"
           class="carousel slide carousel-fade"
           data-bs-ride="carousel"
           data-bs-interval="3000"
           data-bs-pause="false">

        <div class="carousel-inner">
          <!-- Slide 1 -->
          <div class="carousel-item active">
            <div class="ratio ratio-21x9">
              <img src="IMG/INICIO/BannerBarberia1.png"
                   class="w-100 h-100 object-fit-cover"
                   alt="Banner Barberia - experiencia premium">
            </div>
          </div>

          <!-- Slide 2 -->
          <div class="carousel-item">
            <div class="ratio ratio-21x9">
              <img src="IMG/INICIO/BannerBarberia2.png"
                   class="w-100 h-100 object-fit-cover"
                   alt="Barberos expertos y ambiente top">
            </div>
          </div>

          <!-- Slide 3 -->
          <div class="carousel-item">
            <div class="ratio ratio-21x9">
              <img src="IMG/INICIO/BannerBarberia3.png"
                   class="w-100 h-100 object-fit-cover"
                   alt="Reservas rápidas y horarios flexibles">
            </div>
          </div>
        </div>

        <!-- Controles -->
        <button class="carousel-control-prev" type="button" data-bs-target="#banner" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Anterior</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#banner" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Siguiente</span>
        </button>

        <!-- Indicadores -->
        <div class="carousel-indicators mb-0 pb-2">
          <button type="button" data-bs-target="#banner" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#banner" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#banner" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
      </div>
    </header>

    <!-- SECTION: Franja/CTA debajo del banner -->
    <section class="container my-3" aria-label="Franja de bienvenida">
      <article class="row justify-content-center">
        <div class="col-12 col-lg-10">
          <div class="d-flex flex-column flex-md-row align-items-center justify-content-between gap-3
                      bg-black bg-opacity-75 bg-gradient border border-2 border-light shadow rounded-4
                      px-4 px-md-5 py-4">
            <header class="text-center text-md-start">
              <h2 class="h3 h2-md fw-bold text-danger mb-1">Cortes con estilo, sin tanta vuelta</h2>
              <p class="mb-0 text-white-50">Profesionales, detallistas y al toque. Reserva cuando te quede mejor.</p>
            </header>
            <aside class="text-center text-md-end">
              <a href="Horarios.jsp"  class="btn btn-primary bg-gradient btn-lg me-2">Reservar ahora</a>
              <a href="Servicios.jsp" class="btn btn-danger  bg-gradient btn-lg">Ver servicios</a>
            </aside>
          </div>
        </div>
      </article>
    </section>

    <!-- HEADER: Título principal -->
    <header class="text-center py-4">
      <h1 class="text-danger">Bienvenido a la Barbería Top #1 de Independencia</h1>
      <p class="text-white-50 m-0">Ubicación céntrica, atención precisa y resultados que hablan por ti.</p>
    </header>

    <!-- SECTION: Sobre nosotros -->
    <section class="container mb-5" aria-label="Sobre nosotros">
      <div class="row g-4 align-items-center">
        <article class="col-md-7">
          <h2 class="text-primary mb-3">Sobre nosotros</h2>
          <p class="lead">Cortes con estilo, buena vibra y resultados profesionales. Nos enfocamos en que salgas
            con un look que encaje contigo y un servicio que quieras repetir.</p>
          <ul class="small text-white-50 mb-4">
            <li>Especialistas en <span class="text-primary">fade</span>, <span class="text-danger">perfilado de barba</span> y estilos modernos.</li>
            <li>Productos de calidad y protocolos de higiene estrictos.</li>
            <li>Reservas online y horarios flexibles.</li>
          </ul>
          <a href="Servicios.jsp" class="btn btn-primary bg-gradient me-2">Ver servicios</a>
          <a href="Horarios.jsp"  class="btn btn-danger  bg-gradient">Reservar ahora</a>
        </article>

        <aside class="col-md-5">
          <div class="card bg-secondary text-white border border-primary h-100">
            <div class="card-body">
              <h5 class="card-title">¿Por qué elegirnos?</h5>
              <p class="mb-2">Detalle, puntualidad y asesoramiento honesto para que te veas bien todos los días.</p>
              <div class="d-flex flex-wrap gap-2">
                <span class="badge text-bg-dark border border-light">Atención pro</span>
                <span class="badge bg-primary">Estilos a medida</span>
                <span class="badge bg-danger">Ambiente chill</span>
                <span class="badge text-bg-dark border border-light">Precios justos</span>
              </div>
            </div>
          </div>
        </aside>
      </div>
    </section>

    <!-- SECTION: Lo que nos define (con fade-in) -->
    <section class="container mb-5" aria-label="Lo que nos define">
      <header class="mb-3">
        <h2 class="text-primary">Lo que nos define</h2>
      </header>
      <div class="row g-3">
        <article class="col-md-4">
          <div class="p-4 bg-secondary text-white rounded-3 border border-primary fade js-reveal">
            <h5 class="mb-2">💈 Calidad real</h5>
            <p class="text-white-50 mb-0">Herramientas higienizadas, productos pro y técnica pulida en cada corte.</p>
          </div>
        </article>
        <article class="col-md-4">
          <div class="p-4 bg-secondary text-white rounded-3 border border-danger fade js-reveal">
            <h5 class="mb-2">⏱️ Puntualidad</h5>
            <p class="text-white-50 mb-0">Respetamos tu tiempo: citas claras y atención sin rodeos.</p>
          </div>
        </article>
        <article class="col-md-4">
          <div class="p-4 bg-secondary text-white rounded-3 border border-primary fade js-reveal">
            <h5 class="mb-2">🧭 Asesoría honesta</h5>
            <p class="text-white-50 mb-0">Te recomendamos lo que de verdad te queda y cómo mantenerlo.</p>
          </div>
        </article>
      </div>
    </section>

    <!-- SECTION: Métricas rápidas (contadores simples) -->
    <section class="container mb-5" aria-label="Métricas">
      <div class="row text-center g-3">
        <aside class="col-6 col-md-4">
          <div class="h2 text-danger mb-0"><span data-count="250">0</span>+</div>
          <div class="text-white-50">Clientes felices</div>
        </aside>
        <aside class="col-6 col-md-4">
          <div class="h2 text-primary mb-0"><span data-count="40">0</span>+</div>
          <div class="text-white-50">Estilos dominados</div>
        </aside>
        <aside class="col-12 col-md-4">
          <div class="h2 text-light mb-0"><span data-count="180">0</span>+</div>
          <div class="text-white-50">Reseñas 5★</div>
        </aside>
      </div>
    </section>

    <!-- SECTION: Cómo reservar (pasos con fade-in) -->
    <section class="container mb-5" aria-label="Cómo reservar">
      <header class="mb-3">
        <h2 class="text-primary">Cómo reservar</h2>
      </header>
      <div class="row g-3">
        <article class="col-md-4">
          <div class="p-3 bg-secondary text-white rounded-3 border border-primary fade js-reveal">
            <h6 class="mb-1">1) Elige servicio</h6>
            <p class="small text-white-50 mb-0">Corte, barba o combo. Mira detalles y duración.</p>
          </div>
        </article>
        <article class="col-md-4">
          <div class="p-3 bg-secondary text-white rounded-3 border border-danger fade js-reveal">
            <h6 class="mb-1">2) Selecciona horario</h6>
            <p class="small text-white-50 mb-0">Elige el día y la hora que te acomode.</p>
          </div>
        </article>
        <article class="col-md-4">
          <div class="p-3 bg-secondary text-white rounded-3 border border-primary fade js-reveal">
            <h6 class="mb-1">3) Confirma</h6>
            <p class="small text-white-50 mb-0">Te esperamos. Llegas, te atendemos y sales fresh.</p>
          </div>
        </article>
      </div>
    </section>

  </main>

<script src="JS/bootstrap.bundle.min.js"></script>
<script src="JS/app.js"></script>
</body>
</html>
