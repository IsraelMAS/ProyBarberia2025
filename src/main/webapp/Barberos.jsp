<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>BARBERSHOP — Barberos</title>

  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <link rel="stylesheet" href="CSS/Barberos.css">
</head>

<body class="bg-dark text-white">

  <!-- Fondo (opcional pero queda brutal) -->
  <div class="bg-wallpaper" aria-hidden="true"></div>

  <%@ include file="includes/navbar.jspf" %>

  <main class="container py-5">

    <!-- HERO -->
    <header class="text-center mb-4 anim-entrada">
      <span class="badge badge-rwb px-3 py-2 mb-3">BARBERSHOP • EQUIPO</span>
      <h1 class="display-6 fw-bold titulo-rwb">💈 Elige a tu barbero 💈</h1>
      <p class="text-white-50 mb-0">
        Reserva con confianza: mira especialidades, experiencia, rating y horarios sugeridos.
      </p>
    </header>

    <!-- CONTROLES: Buscador + filtros -->
    <section class="card bg-black bg-opacity-50 border border-secondary rounded-4 shadow-sm mb-4 anim-entrada">
      <div class="card-body">
        <div class="row g-3 align-items-center">
          <div class="col-lg-6">
            <label class="form-label text-white-50">Buscar barbero o especialidad</label>
            <div class="input-group">
              <span class="input-group-text bg-dark text-white border-secondary">🔎</span>
              <input id="inputBuscar" type="text" class="form-control bg-dark text-white border-secondary"
                     placeholder="Ej: degradado, barba, clásico, diseño...">
              <button id="btnLimpiar" class="btn btn-outline-light border-secondary" type="button">Limpiar</button>
            </div>
            <small class="text-white-50">Tip: escribe “barba” o “degradado” para filtrar rápido.</small>
          </div>

          <div class="col-lg-3">
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

          <div class="col-lg-3">
            <label class="form-label text-white-50">Ordenar</label>
            <select id="selectOrden" class="form-select bg-dark text-white border-secondary">
              <option value="recomendado">Recomendado</option>
              <option value="experiencia">Más experiencia</option>
              <option value="rating">Mejor rating</option>
              <option value="nombre">Nombre (A-Z)</option>
            </select>
          </div>
        </div>

        <div class="d-flex justify-content-between align-items-center mt-3">
          <small id="textoContador" class="text-white-50">Mostrando 0 barberos</small>
          <small class="text-white-50">✨ Tip pro: toca una card para ver detalles</small>
        </div>
      </div>
    </section>

    <!-- GRID DE BARBEROS -->
    <section id="gridBarberos" class="row g-4">
      <!-- Barbero 1 -->
      <div class="col-12 col-md-6 col-lg-3 barbero-item"
           data-nombre="Barbero 1"
           data-especialidad="degradados"
           data-rating="4.8"
           data-experiencia="6"
           data-resumen="Degradados perfectos y cortes modernos."
           data-detalle="Especialista en fades altos/medios/bajos, asesoría de estilo según forma de rostro."
           data-horario="Lun a Sáb • 10:00 - 20:00"
           data-precio="S/ 25 - S/ 45"
           data-img="IMG/barbero1.jpg">
        <article class="card bg-secondary text-light h-100 shadow-sm border-0 barber-card anim-item">
          <div class="card-body text-center">
            <img src="IMG/barbero1.jpg" class="avatar-barbero" alt="Barbero 1" loading="lazy">
            <h5 class="card-title mt-3 mb-1 fw-bold">Barbero 1</h5>

            <div class="d-flex justify-content-center gap-2 mb-2 flex-wrap">
              <span class="badge bg-primary">Degradados</span>
              <span class="badge bg-dark border border-light border-opacity-25">6 años</span>
              <span class="badge bg-warning text-dark">★ 4.8</span>
            </div>

            <p class="card-text text-white-50 mb-3">Degradados perfectos y cortes modernos.</p>

            <div class="d-grid gap-2">
              <button class="btn btn-outline-light btn-sm btnVerMas" type="button">Ver más</button>
              <a class="btn btn-danger btn-sm" href="Horarios.jsp">Reservar</a>
            </div>
          </div>
        </article>
      </div>

      <!-- Barbero 2 -->
      <div class="col-12 col-md-6 col-lg-3 barbero-item"
           data-nombre="Barbero 2"
           data-especialidad="barbas"
           data-rating="4.9"
           data-experiencia="7"
           data-resumen="Barbas limpias, simétricas y con estilo."
           data-detalle="Perfilado con navaja, hidratación, asesoría para crecimiento, y líneas ultra limpias."
           data-horario="Mar a Dom • 11:00 - 21:00"
           data-precio="S/ 20 - S/ 40"
           data-img="IMG/barbero2.jpg">
        <article class="card bg-secondary text-light h-100 shadow-sm border-0 barber-card anim-item">
          <div class="card-body text-center">
            <img src="IMG/barbero2.jpg" class="avatar-barbero" alt="Barbero 2" loading="lazy">
            <h5 class="card-title mt-3 mb-1 fw-bold">Barbero 2</h5>

            <div class="d-flex justify-content-center gap-2 mb-2 flex-wrap">
              <span class="badge bg-danger">Barbas</span>
              <span class="badge bg-dark border border-light border-opacity-25">7 años</span>
              <span class="badge bg-warning text-dark">★ 4.9</span>
            </div>

            <p class="card-text text-white-50 mb-3">Barbas limpias, simétricas y con estilo.</p>

            <div class="d-grid gap-2">
              <button class="btn btn-outline-light btn-sm btnVerMas" type="button">Ver más</button>
              <a class="btn btn-danger btn-sm" href="Horarios.jsp">Reservar</a>
            </div>
          </div>
        </article>
      </div>

      <!-- Barbero 3 -->
      <div class="col-12 col-md-6 col-lg-3 barbero-item"
           data-nombre="Barbero 3"
           data-especialidad="clasicos"
           data-rating="4.7"
           data-experiencia="10"
           data-resumen="Cortes clásicos y elegantes."
           data-detalle="Tijera y peine, cortes formales, estilos tradicionales con acabado premium."
           data-horario="Lun a Vie • 09:00 - 18:00"
           data-precio="S/ 22 - S/ 42"
           data-img="IMG/barbero3.jpg">
        <article class="card bg-secondary text-light h-100 shadow-sm border-0 barber-card anim-item">
          <div class="card-body text-center">
            <img src="IMG/barbero3.jpg" class="avatar-barbero" alt="Barbero 3" loading="lazy">
            <h5 class="card-title mt-3 mb-1 fw-bold">Barbero 3</h5>

            <div class="d-flex justify-content-center gap-2 mb-2 flex-wrap">
              <span class="badge bg-primary">Clásicos</span>
              <span class="badge bg-dark border border-light border-opacity-25">10 años</span>
              <span class="badge bg-warning text-dark">★ 4.7</span>
            </div>

            <p class="card-text text-white-50 mb-3">Cortes clásicos y elegantes.</p>

            <div class="d-grid gap-2">
              <button class="btn btn-outline-light btn-sm btnVerMas" type="button">Ver más</button>
              <a class="btn btn-danger btn-sm" href="Horarios.jsp">Reservar</a>
            </div>
          </div>
        </article>
      </div>

      <!-- Barbero 4 -->
      <div class="col-12 col-md-6 col-lg-3 barbero-item"
           data-nombre="Barbero 4"
           data-especialidad="disenos"
           data-rating="4.6"
           data-experiencia="5"
           data-resumen="Diseños creativos y cortes modernos."
           data-detalle="Diseños con máquina, líneas artísticas, cambios de look, y estilo personalizado."
           data-horario="Jue a Dom • 12:00 - 22:00"
           data-precio="S/ 28 - S/ 55"
           data-img="IMG/barbero4.jpg">
        <article class="card bg-secondary text-light h-100 shadow-sm border-0 barber-card anim-item">
          <div class="card-body text-center">
            <img src="IMG/barbero4.jpg" class="avatar-barbero" alt="Barbero 4" loading="lazy">
            <h5 class="card-title mt-3 mb-1 fw-bold">Barbero 4</h5>

            <div class="d-flex justify-content-center gap-2 mb-2 flex-wrap">
              <span class="badge bg-danger">Diseños</span>
              <span class="badge bg-dark border border-light border-opacity-25">5 años</span>
              <span class="badge bg-warning text-dark">★ 4.6</span>
            </div>

            <p class="card-text text-white-50 mb-3">Diseños creativos y cortes modernos.</p>

            <div class="d-grid gap-2">
              <button class="btn btn-outline-light btn-sm btnVerMas" type="button">Ver más</button>
              <a class="btn btn-danger btn-sm" href="Horarios.jsp">Reservar</a>
            </div>
          </div>
        </article>
      </div>
    </section>

    <!-- CTA FINAL -->
    <section class="card bg-black bg-opacity-50 border border-secondary rounded-4 shadow-sm mt-5 anim-entrada">
      <div class="card-body p-4 d-flex flex-column flex-md-row align-items-center justify-content-between gap-3">
        <div>
          <h3 class="mb-1 fw-bold">¿Listo para tu próximo corte? ✂️</h3>
          <p class="text-white-50 mb-0">Elige barbero, elige horario y quedas fino en 2 clicks.</p>
        </div>
        <div class="d-flex gap-2">
          <a href="Horarios.jsp" class="btn btn-danger px-4">Ir a horarios</a>
          <button id="btnScrollArriba" class="btn btn-outline-light px-4" type="button">Subir</button>
        </div>
      </div>
    </section>

  </main>

  <!-- MODAL DETALLES -->
  <div class="modal fade" id="modalBarbero" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content bg-dark text-white border border-secondary rounded-4">
        <div class="modal-header border-secondary">
          <h5 class="modal-title fw-bold" id="modalTitulo">Barbero</h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>

        <div class="modal-body">
          <div class="text-center mb-3">
            <img id="modalImg" class="avatar-modal" src="" alt="Foto barbero">
          </div>

          <div class="d-flex justify-content-center gap-2 flex-wrap mb-3">
            <span id="modalEspecialidad" class="badge bg-primary">Especialidad</span>
            <span id="modalExperiencia" class="badge bg-dark border border-light border-opacity-25">0 años</span>
            <span id="modalRating" class="badge bg-warning text-dark">★ 0.0</span>
          </div>

          <p id="modalResumen" class="text-white-50 mb-2"></p>
          <p id="modalDetalle" class="mb-3"></p>

          <div class="small text-white-50">
            <div>🕒 <span id="modalHorario"></span></div>
            <div>💵 <span id="modalPrecio"></span></div>
          </div>
        </div>

        <div class="modal-footer border-secondary">
          <button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cerrar</button>
          <a href="Horarios.jsp" class="btn btn-danger">Reservar</a>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="includes/footer.jspf" %>

  <script src="JS/bootstrap.bundle.min.js"></script>
  <script src="JS/Barberos.js"></script>
</body>
</html>
