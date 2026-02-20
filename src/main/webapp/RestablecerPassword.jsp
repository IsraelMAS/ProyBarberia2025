<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BARBERSHOP — Cambiar Contraseña</title>

    <link rel="icon" href="IMG/ICONOS/BarberShop_ICO.ico">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/app.css">
</head>

<body class="bg-dark text-white">

<div id="bgRotativo" class="bg-rotativo bg-overlay"></div>

<%@ include file="includes/navbar.jspf" %>

<main class="container py-5">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-10 col-md-7 col-lg-5">

            <!-- Título -->
            <div class="text-center mb-4">
                <span class="badge bg-primary px-3 py-2">BARBERSHOP • SEGURIDAD</span>
                <h1 class="mt-3 fw-bold">Cambiar contraseña</h1>
            </div>

            <!-- Mensaje de error o éxito -->
            <%
                String error = (String) request.getAttribute("error");
                String msg = (String) request.getAttribute("msg");
                if (error != null) {
            %>
                <div class="alert alert-danger border-0 shadow-sm">
                    <%= error %>
                </div>
            <%
                }
                if (msg != null) {
            %>
                <div class="alert alert-info border-0 shadow-sm">
                    <%= msg %>
                </div>
            <%
                }
            %>

            <!-- Card -->
            <div class="card bg-secondary text-white border border-primary shadow-sm">
                <div class="card-body p-4">

						  <form action="<%=request.getContextPath()%>/CambiarPassword"
                          method="post">

                        <input type="hidden" name="token" value="${param.token}">

                        <!-- Nueva contraseña -->
                        <div class="mb-4">
                            <div class="d-flex justify-content-between align-items-center">
                                <label class="form-label fw-semibold mb-0">
                                    Nueva contraseña
                                </label>

                                <i class="fa fa-eye toggle-icon"
                                   onclick="togglePassword('nuevaContrasena', this)">
                                </i>
                            </div>

                            <input type="password"
                                   id="nuevaContrasena"
                                   name="nuevaContrasena"
                                   class="form-control custom-input"
                                   placeholder="********"
                                   required>
                        </div>

                        <!-- Confirmar contraseña -->
                        <div class="mb-4">
                            <div class="d-flex justify-content-between align-items-center">
                                <label class="form-label fw-semibold mb-0">
                                    Confirmar contraseña
                                </label>

                                <i class="fa fa-eye toggle-icon"
                                   onclick="togglePassword('confirmarContrasena', this)">
                                </i>
                            </div>

                            <input type="password"
                                   id="confirmarContrasena"
                                   name="confirmarContrasena"
                                   class="form-control custom-input"
                                   placeholder="********"
                                   required>
                        </div>

                        <!-- Botón -->
                        <button type="submit"
                                class="btn btn-primary w-100 fw-bold py-2">
                            Cambiar contraseña
                        </button>

                        <!-- Volver -->
                        <div class="text-center mt-3">
                            <a href="<%=request.getContextPath()%>/Login"
                               class="link-light text-decoration-none">
                                Volver al inicio de sesión
                            </a>
                        </div>

                    </form>



					</div>
            </div>

        </div>
    </div>
</main>

<script src="<%= request.getContextPath() %>/JS/bootstrap.bundle.min.js"></script>


<script>window.APP_CTX = '<%= request.getContextPath() %>/';</script>
<script src="<%= request.getContextPath() %>/JS/app.js"></script>
<script src="<%= request.getContextPath() %>/JS/OlvidarContraseña.js"></script>

<%@ include file="/includes/footer.jspf" %>
</body>
</html>
