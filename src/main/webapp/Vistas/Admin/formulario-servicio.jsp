<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="Modelos.Servicio" %>
<%
    Servicio s = (Servicio) request.getAttribute("servicio");
    String titulo = (s != null) ? "Editar Servicio" : "Nuevo Servicio";
    int id = (s != null) ? s.getId() : 0;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <title><%= titulo %></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
</head>
<body>
<%@ include file="/includes/navbar.jspf" %>

<main class="container py-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-primary text-white"><h2><%= titulo %></h2></div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/ServiciosController" method="post">
                        <input type="hidden" name="id_servicio" value="<%= (id > 0) ? id : "" %>">

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Nombre del Servicio</label>
                                <input type="text" name="nombre" class="form-control" value="<%= (s!=null)?s.getNombre():"" %>" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Precio (S/)</label>
                                <input type="number" step="0.01" name="precio" class="form-control" value="<%= (s!=null)?s.getPrecio():"" %>" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Descripción Corta</label>
                            <textarea name="descripcion" class="form-control" rows="2"><%= (s!=null)?s.getDescripcion():"" %></textarea>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Duración (minutos)</label>
                                <input type="number" name="duracion" class="form-control" value="<%= (s!=null)?s.getDuracionMin():"" %>" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Orden de Visualización</label>
                                <input type="number" name="orden" class="form-control" value="<%= (s!=null)?s.getOrden():"0" %>">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">¿Qué incluye? (Separa con comas)</label>
                            <input type="text" name="incluye" class="form-control" value="<%= (s!=null)?s.getIncluye():"" %>">
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Ruta Imagen</label>
                                <input type="text" name="imagen" class="form-control" value="<%= (s!=null)?s.getImagen():"IMG/SERVICIOS/corte.jpg" %>">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Texto Alt (SEO)</label>
                                <input type="text" name="alt" class="form-control" value="<%= (s!=null)?s.getAlt():"" %>">
                            </div>
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="${pageContext.request.contextPath}/ServiciosController" class="btn btn-secondary">Cancelar</a>
                            <button type="submit" class="btn btn-success">Guardar Cambios</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>