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
<%
    Horario h = (Horario) request.getAttribute("horarioEdit");
    String titulo = (h != null) ? "Editar Horario" : "Nuevo Horario";
%>
<div class="card">
    <div class="card-header bg-primary text-white"><h2><%= titulo %></h2></div>
    <div class="card-body">
        <form action="${pageContext.request.contextPath}/HorariosController" method="post">
            <input type="hidden" name="id_horario" value="<%= (h != null) ? h.getIdHorario() : "" %>">
            
            <label>Turno (Mañana/Tarde/Noche)</label>
            <input type="text" name="turno" class="form-control mb-3" value="<%= (h!=null)?h.getTurno():"" %>" required>

            <label>Hora (Ej: 09:00 - 12:00)</label>
            <input type="text" name="hora" class="form-control mb-3" value="<%= (h!=null)?h.getHora():"" %>" required>

            <label>Orden de visualización</label>
            <input type="number" name="orden" class="form-control mb-3" value="<%= (h!=null)?h.getOrden():"0" %>">

            <button type="submit" class="btn btn-success">Guardar</button>
            <a href="${pageContext.request.contextPath}/HorariosController" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
</div>
</body>
</html>