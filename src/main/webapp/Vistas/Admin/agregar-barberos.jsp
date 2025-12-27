<%@ page contentType="text/html; charset=UTF-8" %>

<html lang="es">
<head>
    <title>Agregar Barbero</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
    <!-- Estilos propios -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/app.css">
    <link rel="icon" href="IMG/ICONOS/BarberShop_ICO.ico">
</head>
<body>

<%@ include file="/includes/navbar.jspf" %>

<main class="container py-4">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h2 class="h5 mb-0">Nuevo Barbero</h2>
                </div>

                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/Barberos" method="post">

                        <!-- Nombre -->
                        <div class="mb-3">
                            <label class="form-label">Nombre</label>
                            <input type="text" name="nombre" class="form-control" required>
                        </div>

                        <!-- Especialidad -->
                        <div class="mb-3">
                            <label class="form-label">Especialidad</label>
                            <input type="text" name="especialidad" class="form-control" required>
                        </div>

                        <!-- Años de experiencia -->
                        <div class="mb-3">
                            <label class="form-label">Años de experiencia</label>
                            <input type="number" name="experiencia" class="form-control" min="0" required>
                        </div>

                        <!-- Rating -->
                        <div class="mb-3">
                            <label class="form-label">Rating</label>
                            <input type="number" name="rating" step="0.1" min="0" max="5" class="form-control" required>
                        </div>

                        <!-- Descripción -->
                        <div class="mb-3">
                            <label class="form-label">Descripción</label>
                            <textarea name="descripcion" class="form-control" rows="3" required></textarea>
                        </div>

                        <!-- Botón -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">
                                <i class="bi bi-save"></i> Guardar
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="/includes/footer.jspf" %>

</body>
</html>
