<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>BARBERSHOP — Contacto</title>

  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <link rel="stylesheet" href="CSS/Contactos.css">
</head>

<body class="bg-dark text-white">

  <!-- Fondo wallpaper -->
  <div class="bg-wallpaper" aria-hidden="true"></div>

  <%@ include file="includes/navbar.jspf" %>

  <main class="container py-5">

    <!-- TÍTULO -->
    <header class="text-center mb-4">
      <h1 class="fw-bold titulo-rwb">¿Buscas saber más de nosotros...?</h1>
      <p class="text-white-50 mb-0">Escríbenos o visita una de nuestras sedes 💈</p>
    </header>

    <!-- BANNER ROTATIVO -->
    <section class="mb-5">
      <div class="card bg-black border-0 shadow-sm overflow-hidden banner-wrap">
        <img
          id="bannerContacto"
          src="IMG/CONTACTANOS/Contactos1.png"
          class="img-fluid banner-img"
          alt="Banner Contáctanos">
      </div>
    </section>

    <!-- 2 COLUMNAS -->
    <section class="row g-4 flex-column">

      <!-- MAPA -->
      <div class="col-12">
        <div class="card bg-secondary border-0 h-100 shadow-sm">
          <div class="card-body">
            <h3 class="text-danger fw-bold mb-3">¡Nuestra sede principal!</h3>

            <div class="ratio ratio-16x9 rounded overflow-hidden">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d975.6558067705249!2d-77.0548002180425!3d-12.00055188072266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105cf01b74742f7%3A0xceff321873004bcd!2sFabulosa&#39;s%20Barberia!5e0!3m2!1ses!2spe!4v1766205532872!5m2!1ses!2spe"
                style="border:0;"
                allowfullscreen
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
              </iframe>
            </div>

            <p class="text-white-50 small mt-3 mb-0">
              Tip: puedes poner aquí horarios, referencias o promo del día.
            </p>
          </div>
        </div>
      </div>

<!-- NUESTRAS SEDES -->
<section class="mt-4">
  <h3 class="text-primary fw-bold mb-3">¡Nuestras sedes!</h3>

  <div class="row g-4">
  <!-- Sede 2 -->
<div class="col-12 col-md-6">
  <a href="https://www.facebook.com/profile.php?id=100064898444989#"
     target="_blank"
     class="card bg-secondary text-white border-0 h-100 shadow-sm text-decoration-none">

    <div class="card-body">
      <h5 class="fw-bold">Sede N°2</h5>
      <p class="text-white-50 small">Cerca al mercado central</p>
      <img src="IMG/CONTACTANOS/Sede1.png" class="img-fluid rounded mb-3" alt="Sede 2">

      <!-- MAPA CENTRADO -->
      <div class="ratio ratio-16x9 rounded overflow-hidden">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d668.5107189983752!2d-77.06403550821317!3d-11.994423233020514!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105cfe765a7e049%3A0x6497a18ba7d4e90!2sGlobal%20Barber%20Supply!5e0!3m2!1ses!2spe!4v1766722560967!5m2!1ses!2spe"
          style="border:0;"
          allowfullscreen
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade">
        </iframe>
      </div>

    </div>
  </a>
</div>


    <!-- Sede 3 -->
<!-- Sede 3 -->
<div class="col-12 col-md-6">
  <a href="https://www.facebook.com/profile.php?id=100064898444989#"
     target="_blank"
     class="card bg-secondary text-white border-0 h-100 shadow-sm text-decoration-none">

    <div class="card-body">
      <h5 class="fw-bold">Sede N°3</h5>
      <p class="text-white-50 small">Cerca al mercado central</p>

      <img
        src="IMG/CONTACTANOS/Sede2.png"
        class="img-fluid rounded mb-3"
        alt="Sede 3">

      <!-- MAPA CENTRADO Y ENCAJADO -->
      <div class="ratio ratio-16x9 rounded overflow-hidden">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d916.1014848108839!2d-77.06311521162075!3d-11.99231140848259!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105ce56a5a86dad%3A0xd0e8889e72e3836f!2sChamaco%20Barber%20shop!5e0!3m2!1ses!2spe!4v1766722687324!5m2!1ses!2spe"
          style="border:0;"
          allowfullscreen
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade">
        </iframe>
      </div>

    </div>
  </a>
</div>


<!-- Sede 4 -->
<div class="col-12 col-md-6">
  <a href="https://www.facebook.com/profile.php?id=100064898444989#"
     target="_blank"
     class="card bg-secondary text-white border-0 h-100 shadow-sm text-decoration-none">

    <div class="card-body">
      <h5 class="fw-bold">Sede N°4</h5>
      <p class="text-white-50 small">Cerca al mercado central</p>

      <img
        src="IMG/CONTACTANOS/Sede3.png"
        class="img-fluid rounded mb-3"
        alt="Sede 4">

      <!-- MAPA CENTRADO Y RESPONSIVE -->
      <div class="ratio ratio-16x9 rounded overflow-hidden">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3902.767783110942!2d-77.06909936532105!3d-11.990563726198422!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105cf0e79402b77%3A0x185109bfc8887fce!2sRasato%20Barberia!5e0!3m2!1ses!2spe!4v1766723177119!5m2!1ses!2spe"
          style="border:0;"
          allowfullscreen
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade">
        </iframe>
      </div>

    </div>
  </a>
</div>


    <!-- Sede 5 -->
<div class="col-12 col-md-6">
  <a href="https://www.facebook.com/profile.php?id=100064898444989#"
     target="_blank"
     class="card bg-secondary text-white border-0 h-100 shadow-sm text-decoration-none">

    <div class="card-body">
      <h5 class="fw-bold">Sede N°5</h5>
      <p class="text-white-50 small">Cerca al mercado central</p>

      <img
        src="IMG/CONTACTANOS/Sede4.png"
        class="img-fluid rounded mb-3"
        alt="Sede 5">

      <!-- MAPA CENTRADO Y RESPONSIVE -->
      <div class="ratio ratio-16x9 rounded overflow-hidden">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3902.767783110942!2d-77.06909936532105!3d-11.990563726198422!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105ce50e8eb15b3%3A0x8657ad12530a7fbb!2sMontalvo%20For%20Men%20Izaguirre!5e0!3m2!1ses!2spe!4v1766723084484!5m2!1ses!2spe"
          style="border:0;"
          allowfullscreen
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade">
        </iframe>
      </div>

    </div>
  </a>
</div>

      </a>
    </div>
  </div>
</section>
  </main>

  <%@ include file="includes/footer.jspf" %>

  <script src="JS/bootstrap.bundle.min.js"></script>
  <script src="JS/Contactos.js"></script>

</body>
</html>
