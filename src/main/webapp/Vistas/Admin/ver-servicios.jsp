<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="Modelos.Servicio" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Servicios</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
    <link rel="icon" href="IMG/ICONOS/BarberShop_ICO.ico">
</head>
<body>
<%@ include file="/includes/navbar.jspf" %>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Lista de Servicios</h3>
        <a href="${pageContext.request.contextPath}/Vistas/Admin/formulario-servicio.jsp" class="btn btn-primary">Nuevo Servicio</a>
    </div>

    <table class="table table-striped table-bordered table-hover">
        <thead class="table-dark text-center">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Duración</th>
                <th>Imagen</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Servicio> lista = (List<Servicio>) request.getAttribute("listaServicios");
            if (lista != null && !lista.isEmpty()) {
                for (Servicio s : lista) {
        %>
            <tr>
                <td><%= s.getId() %></td>
                <td><strong><%= s.getNombre() %></strong></td>
                <td>S/ <%= s.getPrecio() %></td>
                <td><%= s.getDuracionMin() %> min</td>
                <td class="text-center"><img src="<%= s.getImagen() %>" width="50" class="rounded"></td>
                <td class="text-center">
                    <a href="${pageContext.request.contextPath}/ServiciosAdmin?accion=editar&id=<%= s.getId() %>" 
                       class="btn btn-warning btn-sm">✏️ Editar</a>

                    <form action="${pageContext.request.contextPath}/ServiciosController" method="post" style="display:inline;">
                        <input type="hidden" name="accion" value="eliminar">
                        <input type="hidden" name="id" value="<%= s.getId() %>">
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('¿Eliminar servicio?');">🗑 Eliminar</button>
                    </form>
                </td>
            </tr>
        <% } } else { %>
            <tr><td colspan="6" class="text-center">No hay servicios</td></tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>