<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="Modelos.Barbero" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Barberos</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
</head>
<body>

<%@ include file="/includes/navbar.jspf" %>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Lista de Barberos</h3>

        <a href="${pageContext.request.contextPath}/AdminClientes?accion=new"
           class="btn btn-primary">
            Nuevo Barbero
        </a>
    </div>

    <table class="table table-striped table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Especialidad</th>
                <th>Experiencia (años)</th>
                <th>Rating</th>
                <th>Descripción</th>
                <th>Imagen</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Barbero> lista = (List<Barbero>) request.getAttribute("lista");

            if (lista != null && !lista.isEmpty()) {
                for (Barbero b : lista) {
        %>
            <tr>
                <td><%= b.getIdBarbero() %></td>
                <td><%= b.getNombre() %></td>
                <td><%= b.getEspecialidad() %></td>
                <td><%= b.getExperiencia() %></td>
                <td><%= b.getRating() %></td>
                <td><%= b.getDescripcion() %></td>
                <td>
                    <img src="<%= b.getImagen() %>"
                         width="60" height="60"
                         class="rounded">
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="7" class="text-center">
                    No hay barberos registrados
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<%@ include file="/includes/footer.jspf" %>

</body>
</html>
