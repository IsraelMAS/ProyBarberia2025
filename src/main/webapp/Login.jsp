<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>BARBERSHOP — Login</title>
  <link rel="icon" href="IMG/ICONOS/BarberShop_ICO.ico">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/bootstrap.min.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/app.css">
</head>

<body class="bg-dark text-white">

  <div id="bgRotativo" class="bg-rotativo bg-overlay"></div>

  <%@ include file="/includes/navbar.jspf" %>

  <main class="container py-5">
    <div class="row justify-content-center">
      <div class="col-12 col-sm-10 col-md-7 col-lg-5">

        <div class="text-center mb-4">
          <span class="badge bg-primary px-3 py-2">BARBERSHOP • LOGIN</span>
          <h1 class="mt-3 fw-bold">Iniciar sesión</h1>
          <p class="text-white-50 mb-0">Entra para reservar 💈</p>
        </div>

        <%
          String msg = request.getParameter("msg");
          if (msg != null && !msg.trim().isEmpty()) {
        %>
          <div class="alert alert-warning border-0 shadow-sm"><%= msg %></div>
        <% } %>

        <div class="card bg-secondary text-white border border-primary shadow-sm">
          <div class="card-body p-4">

            <form action="<%= request.getContextPath() %>/ControladorSesion" method="post" autocomplete="off">
              <input type="hidden" name="accion" value="login">

              <div class="mb-3">
                <label for="telefono" class="form-label text-white-50">Teléfono</label>
                <input type="text" id="telefono" name="telefono"
                       class="form-control bg-dark text-white border-0"
                       placeholder="Ej: 999888777"
                       inputmode="numeric" pattern="[0-9]{6,15}"
                       required>
              </div>

              <div class="mb-2">
                <label for="contrasena" class="form-label text-white-50">Contraseña</label>
                <div class="input-group">
                  <input type="password" id="contrasena" name="contrasena"
                         class="form-control bg-dark text-white border-0"
                         placeholder="••••••••" required>
                  <button class="btn btn-outline-light" type="button" id="btnVerPassLogin">Ver</button>
                </div>
              </div>

              <button type="submit" class="btn btn-danger w-100 mt-4 fw-semibold">
                Entrar
              </button>

              <div class="text-center mt-3">
                <span class="text-white-50 small">¿No tienes cuenta?</span>
                <a href="<%= request.getContextPath() %>/Registro.jsp" class="link-light fw-semibold text-decoration-none">
                  Regístrate
                </a>
              </div>
            </form>

          </div>
        </div>

      </div>
    </div>
  </main>

  <script src="<%= request.getContextPath() %>/JS/bootstrap.bundle.min.js"></script>

  <script>
    const b = document.getElementById("btnVerPassLogin");
    const p = document.getElementById("contrasena");
    if (b && p) {
      b.addEventListener("click", () => {
        const oculto = p.type === "password";
        p.type = oculto ? "text" : "password";
        b.textContent = oculto ? "Ocultar" : "Ver";
      });
    }
  </script>

  <script>window.APP_CTX = '<%= request.getContextPath() %>/';</script>
  <script src="<%= request.getContextPath() %>/JS/app.js"></script>

  <%@ include file="/includes/footer.jspf" %>
</body>
</html>
