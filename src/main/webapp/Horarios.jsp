<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ModeloDAO.HorarioDAO"%>
<%@ page import="Modelos.Horario"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="ModeloDAO.CitaDAO"%>
<%@ page import="Modelos.Cita"%>
<%@ page import ="ModeloDAO.ClienteDAO" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>BARBERSHOP — Horarios</title>

  <link rel="icon" href="IMG/ICONOS/BarberShop_ICO.ico">

  <!-- Bootstrap + estilos -->
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <link rel="stylesheet" href="CSS/app.css">
  <link rel="stylesheet" href="CSS/Horario.css">
</head>

<body class="bg-dark text-white page-horarios">

  <%@ include file="includes/navbar.jspf" %>

  <!-- Fondo dinámico (NO afecta tu HTML interno) -->
  <div class="horario-bg" aria-hidden="true"></div>
  <div class="horario-ov" aria-hidden="true"></div>

  <main class="container my-5">

    <h2 class="text-primary text-center mb-4">Horarios y Reserva</h2>

    <section class="row g-4">

      <!-- ================= HORARIOS ================= -->
      <div class="col-lg-6 d-flex flex-column gap-4">

        <aside>
          <article class="bg-secondary p-3 rounded">
            <h3 class="text-danger">Horarios disponibles</h3>

            <table class="table table-dark table-striped table-bordered mb-0">
              <thead>
                <tr>
                  <th>Turno</th>
                  <th>Horas</th>
                </tr>
              </thead>
              <tbody>
                <%
                  HorarioDAO daoH = new HorarioDAO();
                  List<Horario> listaH = daoH.listar();
                  for (Horario h : listaH) {
                %>
                <tr>
                  <td><%= h.getTurno() %></td>
                  <td><%= h.getHora() %></td>
                </tr>
                <% } %>
              </tbody>
            </table>

            <small class="text-white-50">Horarios actualizados desde el sistema.</small>
          </article>
        </aside>



        <aside>
		  <article class="p-3 rounded shadow-sm"
		           style="background: rgba(0,0,0,.65); border: 1px solid rgba(255,255,255,.12);">
		    <h3 class="mb-3" style="color:#0d6efd;">¡Nuestro Local!</h3>
		
		    <!-- Video insertado -->
		    <div class="ratio ratio-16x9 rounded overflow-hidden"
		         style="border: 1px solid rgba(255,255,255,.12);">
		      <video class="w-100 h-100"
		             autoplay
		             muted
		             loop
		             playsinline
		             controls
		             preload="metadata">
		        <source src="IMG/VideoBarberia.mp4" type="video/mp4">
		      </video>
		    </div>
		
		    <small class="d-block mt-2" style="color: rgba(255,255,255,.65);">
		      Llegar 10 minutos antes a lo acordado
		    </small>
		  </article>
		</aside>


      </div>

      <!-- ================= FORMULARIO ================= -->
      <article class="col-lg-6">
        <section class="bg-secondary p-3 rounded">
          <h3 class="text-primary">Reservar cita</h3>

          <%
            /* ================= CITA EN EDICIÓN ================= */
            Cita citaEdit = (Cita) session.getAttribute("citaSeleccionada");

            String f    = (citaEdit != null) ? citaEdit.getFecha().toString() : "";
            String ho   = (citaEdit != null) ? citaEdit.getHora().toString() : "";
            String inst = (citaEdit != null) ? citaEdit.getInstrucciones() : "";
            int idCita  = (citaEdit != null) ? citaEdit.getIdCita() : 0;

            String nomCli = (citaEdit != null) ? citaEdit.getCliente().getNombre() : "Cliente 1";
            String telCli = (citaEdit != null) ? citaEdit.getCliente().getTelefono() : "999999999";

            /* ================= BARBERO ================= */
            String idB  = request.getParameter("idBarbero");
            String nomB = request.getParameter("nombreBarbero");

            if (idB != null && nomB != null) {
              session.setAttribute("idBarbero", idB);
              session.setAttribute("nombreBarbero", nomB);
            }

            if (nomB == null || nomB.isBlank()) {
              idB  = (String) session.getAttribute("idBarbero");
              nomB = (String) session.getAttribute("nombreBarbero");
            }

            if (nomB == null || nomB.isBlank()) {
              nomB = "No seleccionado";
            }

            /* ================= SERVICIO ================= */
            String idS  = request.getParameter("id");
            String nomS = request.getParameter("nombre");

            if (idS != null && nomS != null) {
              session.setAttribute("idServicio", idS);
              session.setAttribute("nombreServicio", nomS);
            }

            if (nomS == null || nomS.isBlank()) {
              idS  = (String) session.getAttribute("idServicio");
              nomS = (String) session.getAttribute("nombreServicio");
            }

            if (nomS == null || nomS.isBlank()) {
              nomS = "No seleccionado";
            }

            String accion = (citaEdit != null) ? "Actualizar" : "Agregar";
            String texto  = (citaEdit != null) ? "Actualizar cita" : "Reservar cita";
          %>

          <form action="ControladorCita" method="GET">

            <input type="hidden" name="txtIdCita" value="<%= idCita %>">
            <input type="hidden" name="txtIdCliente" value="1">

            <label>Nombre</label>
            <input type="text" class="form-control mb-2" value="<%= clienteLogueado.getNombre() %>" readonly>

            <label>Teléfono</label>
            <input type="text" class="form-control mb-2" value="<%= clienteLogueado.getTelefono() %>" readonly>

            <label>Barbero</label>
            <div class="d-flex gap-2 mb-3">
              <input type="text" class="form-control" value="<%= nomB %>" readonly>
              <a href="Barberos.jsp" class="btn btn-outline-light">Elegir</a>
            </div>
            <input type="hidden" name="idBarbero" value="<%= (idB != null) ? idB : "0" %>">

            <label>Servicio</label>
            <div class="d-flex gap-2 mb-3">
              <input type="text" class="form-control" value="<%= nomS %>" readonly>
              <a href="Servicios.jsp#cortes" class="btn btn-outline-light">Elegir</a>
            </div>
            <input type="hidden" name="idServicio" value="<%= (idS != null) ? idS : "" %>">

            <label>Fecha</label>
            <input type="date" name="txtFecha" value="<%= f %>" class="form-control mb-2" required>

            <label>Hora</label>
            <select name="txtHora" class="form-select mb-3" required>
              <option value="">Seleccione</option>
              <option value="09:00:00" <%= ho.equals("09:00:00") ? "selected" : "" %>>09:00</option>
              <option value="10:00:00" <%= ho.equals("10:00:00") ? "selected" : "" %>>10:00</option>
              <option value="11:00:00" <%= ho.equals("11:00:00") ? "selected" : "" %>>11:00</option>
              <option value="14:00:00" <%= ho.equals("14:00:00") ? "selected" : "" %>>14:00</option>
              <option value="15:00:00" <%= ho.equals("15:00:00") ? "selected" : "" %>>15:00</option>
              <option value="16:00:00" <%= ho.equals("16:00:00") ? "selected" : "" %>>16:00</option>
              <option value="18:00:00" <%= ho.equals("18:00:00") ? "selected" : "" %>>18:00</option>
              <option value="19:00:00" <%= ho.equals("19:00:00") ? "selected" : "" %>>19:00</option>
            </select>

            <label>Instrucciones</label>
            <textarea name="txtInstrucciones" class="form-control mb-3"><%= inst %></textarea>

            <input type="hidden" name="txtEstado" value="RESERVADA">

            <button type="submit" name="accion" value="<%= accion %>" class="btn btn-danger">
              <%= texto %>
            </button>

            <a href="Horarios.jsp" class="btn btn-primary ms-2">Limpiar</a>
          </form>

        </section>
      </article>

      <!-- ================= MIS CITAS ================= -->
      <aside class="col-12">
        <article class="bg-light p-3 rounded shadow-sm">
          <h3 class="text-primary mb-3">Mis Citas Reservadas</h3>

          <div class="table-responsive">
            <table class="table table-bordered table-hover mb-0">
              <%
                CitaDAO daoC = new CitaDAO();
                List<Cita> listaC = daoC.listarPorCliente(1);
                Iterator<Cita> iterC = listaC.iterator();
                Cita perC = null;

                while (iterC.hasNext()) {
                  perC = iterC.next();
              %>
              <thead class="table-primary">
                <tr>
                  <th class="text-center">Cita: <%= perC.getFecha() %></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="text-center">
                    <div class="fw-bold"><%= perC.getHora() %></div>

                    <div class="badge <%= perC.getEstado().equals("CANCELADA") ? "bg-danger" : "bg-success" %> mb-2">
                      <%= perC.getEstado() %>
                    </div>

                    <div class="d-flex gap-2 justify-content-center">
                      <a href="ControladorCita?accion=editar&id=<%= perC.getIdCita() %>" class="btn btn-sm btn-warning">
                        Editar
                      </a>
                      <a href="ControladorCita?accion=eliminar&id=<%= perC.getIdCita() %>" class="btn btn-sm btn-dark">
                        Cancelar
                      </a>
                    </div>
                  </td>
                </tr>
              </tbody>
              <% } %>
            </table>
          </div>

          <div class="mt-3 text-center">
            <small class="text-muted">Llegar 10 minutos antes a lo acordado</small>
          </div>
        </article>
      </aside>

    </section>
  </main>

  <%@ include file="includes/footer.jspf" %>

  <!-- JS -->
  <script src="JS/bootstrap.bundle.min.js"></script>
  <script>window.APP_CTX = '<%= request.getContextPath() %>/';</script>
  <script src="JS/Horario.js"></script>

</body>
</html>
	