<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

<!-- Fondo rotativo -->
<div id="bgRotativo" class="bg-rotativo bg-overlay"></div>

<%@ include file="/includes/navbar.jspf" %>

<main class="container py-5">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-10 col-md-7 col-lg-5">

            <!-- Título -->
            <div class="text-center mb-4">
                <span class="badge bg-primary px-3 py-2">BARBERSHOP • LOGIN</span>
                <h1 class="mt-3 fw-bold">Iniciar sesión</h1>
                <p class="text-white-50 mb-0">Accede para reservar tu cita 💈</p>
            </div>

            <!-- Error -->
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
                <div class="alert alert-danger border-0 shadow-sm">
                    <%= error %>
                </div>
            <%
                }
            %>

            <!-- Card -->
            <div class="card bg-secondary text-white border border-primary shadow-sm">
                <div class="card-body p-4">

                    <form action="<%= request.getContextPath() %>/Login" method="post" autocomplete="off">

                        <!-- Teléfono -->
                        <div class="mb-3">
                            <label class="form-label text-white-50">Teléfono</label>
                            <input type="text"
                                   name="telefono"
                                   class="form-control bg-dark text-white border-0"
                                   placeholder="Ej: 999888777"
                                   inputmode="numeric"
                                   pattern="[0-9]{6,15}"
                                   required>
                        </div>

                        <!-- Contraseña -->
                        <div class="mb-2">
                            <label class="form-label text-white-50">Contraseña</label>
                            <div class="input-group">
                                <input type="password"
                                       id="contrasena"
                                       name="contrasena"
                                       class="form-control bg-dark text-white border-0"
                                       placeholder="••••••••"
                                       required>
                                <button class="btn btn-outline-light"
                                        type="button"
                                        id="btnVerPassLogin">
                                    Ver
                                </button>
                            </div>
                        </div>

                        <!-- Botón -->
                        <button type="submit" class="btn btn-danger w-100 mt-4 fw-semibold">
                            Ingresar
                        </button>

                        <!-- Registro -->
                        <div class="text-center mt-3">
                            <span class="text-white-50 small">¿No tienes cuenta?</span>
                            <a href="<%= request.getContextPath() %>/Registro.jsp"
                               class="link-light fw-semibold text-decoration-none">
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
    // mostrar / ocultar contraseña
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
