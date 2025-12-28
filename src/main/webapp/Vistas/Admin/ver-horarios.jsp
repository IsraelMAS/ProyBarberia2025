<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="Modelos.Horario" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de horarios</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
    <link rel="icon" href="IMG/ICONOS/BarberShop_ICO.ico">
</head>
<body>
<%@ include file="/includes/navbar.jspf" %>
<div class="container mt-4">
    <h3>Gestión de Horarios</h3>
    <a href="${pageContext.request.contextPath}/Vistas/Admin/formulario-horario.jsp" class="btn btn-primary mb-3">Nuevo Horario</a>

    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Turno</th>
                <th>Rango de Horas</th>
                <th>Orden</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Horario> lista = (List<Horario>) request.getAttribute("listaHorarios");
            if (lista != null) {
                for (Horario h : lista) {
        %>
            <tr>
                <td><%= h.getTurno() %></td>
                <td><%= h.getHora() %></td>
                <td><%= h.getOrden() %></td>
                <td>
                    <a href="${pageContext.request.contextPath}/HorariosController?accion=editar&id=<%= h.getIdHorario() %>" class="btn btn-warning btn-sm">Editar</a>
                    <form action="${pageContext.request.contextPath}/HorariosController" method="post" style="display:inline;">
                        <input type="hidden" name="accion" value="eliminar">
                        <input type="hidden" name="id" value="<%= h.getIdHorario() %>">
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('¿Eliminar?')">Borrar</button>
                    </form>
                </td>
            </tr>
        <% } } %>
        </tbody>
    </table>
</div>
</body>
</html>