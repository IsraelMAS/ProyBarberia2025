
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="Modelos.Cliente" %>

<html lang="es">
<head>
    <title>Clientes</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
    <!-- Estilos propios -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/app.css">

    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

    <%@ include file="/includes/navbar.jspf" %>

    <main class="container py-4">
        <!-- Encabezado y acción -->
        <div class="d-flex align-items-center justify-content-between mb-3">
            <h2 class="h4 mb-0">Lista de Clientes</h2>
            <a href="${pageContext.request.contextPath}/Barbero?accion=new"
   class="btn btn-primary">
   Nuevo Barbero
</a>

        </div>

        <!-- Tarjeta contenedora -->
        <div class="card shadow-sm">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Teléfono</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Cliente> lista = (List<Cliente>) request.getAttribute("lista");
                                if (lista != null && !lista.isEmpty()) {
                                    for (Cliente c : lista) {
                            %>
                            <tr>
                                <td><%= c.getIdCliente() %></td>
                                <td><%= c.getNombre() %></td>
                                <td><%= c.getTelefono() %></td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="3" class="text-center py-4">
                                    <div class="alert alert-info mb-0" role="alert">
                                        No hay clientes registrados aún.
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="/includes/footer.jspf" %>

    <!-- (Opcional) Bootstrap JS si lo necesitas para componentes interactivos -->
    <!-- <script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script> -->
    <!-- (Opcional) Bootstrap Icons si quieres usar el ícono del botón -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"> -->

</body>
</html>
