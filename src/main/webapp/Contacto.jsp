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
        <!-- Arranca con la 1era imagen real -->
        <img id="bannerContacto"
	     src="IMG/CONTACTANOS/Contactos1.png"
	     class="img-fluid banner-img"
	     alt="Banner Contáctanos">
      </div>
    </section>

    <!-- 2 COLUMNAS -->
    <section class="row g-4 align-items-stretch">

      <!-- MAPA -->
      <div class="col-lg-6">
        <div class="card bg-secondary border-0 h-100 shadow-sm">
          <div class="card-body">
            <h3 class="text-danger fw-bold mb-3">¡Nuestra sede principal!</h3>

            <div class="ratio ratio-16x9 rounded overflow-hidden">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d975.6558067705249!2d-77.0548002180425!3d-12.00055188072266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105cf01b74742f7%3A0xceff321873004bcd!2sFabulosa&#39;s%20Barberia!5e0!3m2!1ses!2spe!4v1766205532872!5m2!1ses!2spe"
                style="border:0;"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>

            <p class="text-white-50 small mt-3 mb-0">
              Tip: puedes poner aquí horarios, referencias o promo del día.
            </p>
          </div>
        </div>
      </div>

      <!-- SEDES + CONTACTO -->
      <div class="col-lg-6">
        <div class="card bg-secondary border-0 h-100 shadow-sm">
          <div class="card-body">
            <h3 class="text-primary fw-bold mb-3">¡Nuestras sedes!</h3>

            <div class="list-group">
              <a class="list-group-item list-group-item-action bg-dark text-white border-secondary"
                 href="https://www.facebook.com/profile.php?id=100064898444989#"
                 target="_blank" rel="noopener noreferrer">
                <div class="d-flex justify-content-between align-items-center">
                  <span class="fw-bold">Sede N°2</span>
                  <span class="badge bg-primary">Ver</span>
                </div>
                <small class="text-white-50">Ubicación: Cerca al mercado central</small>
               <img class="img-fluid banner-img" src="IMG/CONTACTANOS/Sede1.png" alt="">

                
              </a>

              <a class="list-group-item list-group-item-action bg-dark text-white border-secondary"
                 href="https://www.facebook.com/profile.php?id=100064898444989#"
                 target="_blank" rel="noopener noreferrer">
                <div class="d-flex justify-content-between align-items-center">
                  <span class="fw-bold">Sede N°3</span>
                  <span class="badge bg-primary">Ver</span>
                </div>
                <small class="text-white-50">Ubicación: Cerca al mercado central</small>
                <img class="img-fluid banner-img" src="IMG/CONTACTANOS/Sede2.png" alt="">
              </a>

              <a class="list-group-item list-group-item-action bg-dark text-white border-secondary"
                 href="https://www.facebook.com/profile.php?id=100064898444989#"
                 target="_blank" rel="noopener noreferrer">
                <div class="d-flex justify-content-between align-items-center">
                  <span class="fw-bold">Sede N°4</span>
                  <span class="badge bg-primary">Ver</span>
                </div>
                <small class="text-white-50">Ubicación: Cerca al mercado central</small>
                <img class="img-fluid banner-img" src="IMG/CONTACTANOS/Sede3.png" alt="">
              </a>

              <a class="list-group-item list-group-item-action bg-dark text-white border-secondary"
                 href="https://www.facebook.com/profile.php?id=100064898444989#"
                 target="_blank" rel="noopener noreferrer">
                <div class="d-flex justify-content-between align-items-center">
                  <span class="fw-bold">Sede N°5</span>
                  <span class="badge bg-primary">Ver</span>
                </div>
                <small class="text-white-50">Ubicación: Cerca al mercado central</small>
                <img class="img-fluid banner-img" src="IMG/CONTACTANOS/Sede4.png" alt="">
              	<br>
              	<br>
              	<br>              	
              </a>
            </div>
            <hr class="border-light opacity-25 my-4">

            <h4 class="titulo-rwb fw-bold mb-2">Contacto</h4>
            <div class="text-white-50">
              <div>📍 Av. Ejemplo 123, Independencia</div>
              <div>📞 998-414-111</div>
              <div>✉️ <a class="text-white" href="mailto:jkdiazdahua@gmail.com">jkdiazdahua@gmail.com</a></div>
            </div>

          </div>
        </div>
      </div>

    </section>
  </main>

  <%@ include file="includes/footer.jspf" %>

  <script src="JS/bootstrap.bundle.min.js"></script>
  <script src="JS/Contactos.js"></script>
</body>
</html>
