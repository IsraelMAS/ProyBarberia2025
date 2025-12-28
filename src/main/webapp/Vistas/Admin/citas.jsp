<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="Modelos.Cita" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ver Citas</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
</head>

<body class="bg-dark text-white">

<%@ include file="/includes/navbar.jspf" %>

<main class="container mt-5">

    <h2 class="text-primary text-center mb-4">
        Citas Reservadas
    </h2>

    <div class="table-responsive">
        <table class="table table-dark table-bordered table-hover align-middle">

            <thead class="table-primary text-dark text-center">
                <tr>
                    <th>Cliente</th>
                    <th>Teléfono</th>
                    <th>Barbero</th>
                    <th>Servicio</th>
                    <th>Monto (S/)</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Estado</th>
                    <th>Acciones</th> 
                </tr>
            </thead>

            <tbody>
            <%
                List<Cita> lista = (List<Cita>) request.getAttribute("listaCitas");
                SimpleDateFormat sdfFecha = new SimpleDateFormat("dd/MM/yyyy");
                java.text.SimpleDateFormat sdfHora = new java.text.SimpleDateFormat("HH:mm");
                if (lista != null && !lista.isEmpty()) {
                    for (Cita c : lista) {
            %>
                <tr class="text-center">
                    <td><%=(c.getCliente() != null) ? c.getCliente().getNombre() : "-"%></td>
                    <td><%=(c.getCliente() != null) ? c.getCliente().getTelefono() : "-"%></td>
                    <td><%=(c.getBarbero() != null) ? c.getBarbero().getNombre() : "-"%></td>
                    <td><%=(c.getServicio() != null) ? c.getServicio().getNombre() : "-"%></td>
                    <td><%=(c.getServicio() != null) ? String.format("%.2f", c.getServicio().getPrecio()) : "-"%></td>
                    <td><%=(c.getFecha() != null) ? sdfFecha.format(c.getFecha()) : "-" %></td>
					<td><%=(c.getHora() != null) ? sdfHora.format(c.getHora()) : "-" %></td>
                    <td><%=(c.getEstado() != null) ? c.getEstado() : "-" %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="8" class="text-center text-warning">
                        No hay citas registradas
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>

        </table>
    </div>

</main>

<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
</body>
</html>
s