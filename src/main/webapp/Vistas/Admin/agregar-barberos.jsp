
<%@ page contentType="text/html; charset=UTF-8" %>

<html lang="es">
<head>
    <title>Agregar Barberos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
    <!-- Estilos propios -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/app.css">
</head>
<body>

    <%@ include file="/includes/navbar.jspf" %>	

    <main class="container py-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h2 class="h5 mb-0">Nuevo Barbero</h2>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/Barberos" method="post">

                            
                            <!-- Nombre -->
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre</label>
                                <input type="text" id="nombre" name="nombre" class="form-control" required>
                            </div>

                            <!-- Teléfono -->
                            <div class="mb-3">
                                <label for="telefono" class="form-label">Teléfono</label>
                                <input type="text" id="telefono" name="telefono" class="form-control" required>
                            </div>

                            <!-- Botón -->
                            <div class="d-grid">
                                <button href="ver-barberos.jsp" type="submit" class="btn btn-success">
                                    <i class="bi bi-save"></i> Guardar
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- (Opcional) Bootstrap JS -->
    <!-- <script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script> -->
    <!-- (Opcional) Bootstrap Icons -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"> -->
    <%@ include file="/includes/footer.jspf" %>	
</body>
</html>
``
