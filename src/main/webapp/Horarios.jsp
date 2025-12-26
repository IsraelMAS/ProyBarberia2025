<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ModeloDAO.HorarioDAO"%>
<%@ page import="Modelos.Horario"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="ModeloDAO.CitaDAO"%>
<%@ page import="Modelos.Cita"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>BARBERSHOP — Horarios</title>
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<body class="bg-dark text-white">

  <%@ include file="includes/navbar.jspf" %>

  <main class="container my-5">
    <h2 class="text-primary text-center mb-4">Horarios y Reserva</h2>

    <section class="row g-4">


      <div class="col-lg-6 d-flex flex-column gap-4">


        <aside>
          <article class="bg-secondary p-3 rounded">
            <h3 class="text-danger">Horarios disponibles</h3>
            <table class="table table-dark table-striped table-bordered mb-0">
              <thead>
                <tr><th>Turno</th><th>Horas</th></tr>
              </thead>
              <tbody>
        <%
          // Suponiendo que ya tienes un HorarioDAO similar a los anteriores
          HorarioDAO daoH = new HorarioDAO();
          List<Horario> listaH = daoH.listar();
          Iterator<Horario> iterH = listaH.iterator();
          Horario h = null;

          while (iterH.hasNext()) {
            h = iterH.next();
        %>
                <tr><td><%= h.getTurno() %></td><td><%= h.getHora() %></td></tr>
         <% 
          } 
        %>
              </tbody>
            </table>
            <small class="text-white-50">Horarios actualizados desde el sistema.</small>
          </article>
        </aside>
		

        <aside>
          <article class="bg-light p-3 rounded shadow-sm">
            <h3 class="text-primary">Citas Reservadas</h3>
            <table class="table table-bordered table-hover mb-0">
              <thead class="table-primary">
                <tr><th class="text-center">Barbero1</th></tr>
              </thead>
              <tbody>
                <tr><td></td></tr>
                <tr><td></td></tr>
                <tr><td></td></tr>
              </tbody>
            </table>
            <small class="text-muted">Llegar 10 minutos antes a lo acordado</small>
          </article>
        </aside>

      </div>

<article class="col-lg-6">
    <section class="bg-secondary p-3 rounded">
        <h3 class="text-primary">Reservar cita</h3>

        <%
    // 1. Buscamos la cita en la sesión
    Cita citaEdit = (Cita) session.getAttribute("citaSeleccionada");

    // 2. Variables de texto básicas
    String f = (citaEdit != null) ? citaEdit.getFecha().toString() : "";
    String ho = (citaEdit != null) ? citaEdit.getHora().toString() : "";
    String inst = (citaEdit != null) ? citaEdit.getInstrucciones() : "";
    int idC = (citaEdit != null) ? citaEdit.getIdCita() : 0;
    
    String nomCli = (citaEdit != null) ? citaEdit.getCliente().getNombre() : "Cliente 1";
    String telCli = (citaEdit != null) ? citaEdit.getCliente().getTelefono() : "999999999";

    // 3. Lógica para Barbero (Ajustada para evitar el borrado al editar)
    String idB = request.getParameter("idBarbero");
    String nomB = request.getParameter("nombreBarbero");
    
    // Si NO hemos seleccionado un barbero nuevo en el clic actual (es null o vacío)
    // y tenemos una cita en edición, recuperamos el barbero original.
    if ((idB == null || idB.isEmpty()) && citaEdit != null && citaEdit.getBarbero() != null) {
        idB = String.valueOf(citaEdit.getBarbero().getIdBarbero());
        nomB = citaEdit.getBarbero().getNombre();
    }
    if (nomB == null || nomB.isEmpty()) nomB = "No seleccionado";

 // 4. Lógica para Servicio
    String idS = request.getParameter("id"); // ID del servicio desde URL (si eliges uno nuevo)
    String nomS = request.getParameter("nombre"); // Nombre del servicio desde URL

    // REGLA DE ORO: Si no hay un nombre en la URL (porque diste clic en Editar),
    // vamos a buscarlo en el objeto que el Controlador guardó en la sesión.
    if (nomS == null || nomS.trim().isEmpty()) {
        if (citaEdit != null && citaEdit.getServicio() != null) {
            idS = String.valueOf(citaEdit.getServicio().getId());
            nomS = citaEdit.getServicio().getNombre();
        }
    }

    // Si después de buscar en la URL y en la Sesión sigue vacío, ponemos el aviso
    if (nomS == null || nomS.trim().isEmpty()) {
        nomS = "No seleccionado";
    }

    // 5. Configuración del Botón
    String miAccion = (citaEdit != null) ? "Actualizar" : "Agregar"; 
    String textoBoton = (citaEdit != null) ? "Actualizar cita" : "Reservar cita";
%>

        <form action="ControladorCita" method="GET">
            <input type="hidden" name="txtIdCita" value="<%= idC %>">
            
            <input type="hidden" name="txtIdCliente" value="1">

            <label class="form-label">Nombre</label>
            <input type="text"  value="<%= (nomCli.equals("")) ? "Cliente Predeterminado" : nomCli %>" class="form-control mb-2" readonly>

            <label class="form-label">Teléfono</label>
            <input type="tel" value="<%= (telCli.equals("")) ? "999-999-999" : telCli %>" class="form-control mb-2" readonly>

            <input type="hidden" name="idBarbero" value="<%= (idB != null) ? idB : "" %>">
            <label class="form-label">Barbero</label>
            <div class="d-flex gap-2 align-items-start mb-3">
                <input type="text" class="form-control" value="<%= nomB %>" readonly>
                <a href="Barberos.jsp" class="btn btn-outline-light text-nowrap">Elegir barbero</a>
            </div>

            
            <label class="form-label">Servicio</label>
            <div class="d-flex gap-2 align-items-start mb-3">
                <input type="text" class="form-control" value="<%= nomS %>" readonly>
                <input type="hidden" name="idServicio" value="<%= (idS != null) ? idS : "" %>">
                <a href="Servicios.jsp#cortes" class="btn btn-outline-light text-nowrap">Elegir servicio</a>
            </div>

            <label class="form-label">Fecha</label>
            <input type="date" name="txtFecha" value="<%= f %>" class="form-control mb-2" required>

            <label class="form-label">Hora</label>
            <select name="txtHora" class="form-select mb-3" required>
                <option value="">Selecciona una hora</option>
                <option value="09:00:00" <%= (ho.equals("09:00:00")) ? "selected" : "" %>>09:00</option>
                <option value="10:00:00" <%= (ho.equals("10:00:00")) ? "selected" : "" %>>10:00</option>
                <option value="11:00:00" <%= (ho.equals("11:00:00")) ? "selected" : "" %>>11:00</option>
                <option value="14:00:00" <%= (ho.equals("14:00:00")) ? "selected" : "" %>>14:00</option>
                <option value="15:00:00" <%= (ho.equals("15:00:00")) ? "selected" : "" %>>15:00</option>
                <option value="16:00:00" <%= (ho.equals("16:00:00")) ? "selected" : "" %>>16:00</option>
                <option value="18:00:00" <%= (ho.equals("18:00:00")) ? "selected" : "" %>>18:00</option>
                <option value="19:00:00" <%= (ho.equals("19:00:00")) ? "selected" : "" %>>19:00</option>
            </select>

            <label>Instrucciones para su barbero:</label>
            <textarea name="txtInstrucciones" class="form-control" rows="4"><%= inst %></textarea>

            <input type="hidden" name="txtEstado" value="RESERVADA">

            <section class="d-flex gap-2 mt-3">
                <button type="submit" name="accion" value="<%= miAccion %>" class="btn btn-danger">
                    <%= textoBoton %>
                </button>
                <a href="Horarios.jsp" class="btn btn-primary">Limpiar / Nuevo</a>
            </section>
        </form>
    </section>
</article>
        <aside>
  <article class="bg-light p-3 rounded shadow-sm">
    <h3 class="text-primary mb-3">Mis Citas Reservadas</h3>
    
    <div class="table-responsive">
      <table class="table table-bordered table-hover mb-0">
      
        <%
	        CitaDAO daoC = new CitaDAO();
            List<Cita> listaC = daoC.listarPorCliente(1);
            Iterator<Cita> iterC = listaC.iterator();
            Cita perC = null;
            
            while(iterC.hasNext()){
                perC = iterC.next();
        %>
        <thead class="table-primary">
          <tr>
            <th class="text-center">
                <%-- Aquí podrías mostrar el nombre del barbero si haces un Join, 
                     por ahora mostramos la fecha de la cita --%>
                Cita: <%= perC.getFecha() %>
            </th>
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
                    
                    <a href="ControladorCita?accion=editar&id=<%= perC.getIdCita() %>" 
                       class="btn btn-sm btn-warning">
                       <i class="bi bi-pencil"></i> Editar
                    </a>
                              
                    <a href="ControladorCita?accion=eliminar&id=<%= perC.getIdCita() %>" 
                       class="btn btn-sm btn-dark">
                       Cancelar
                    </a>
                </div>
            </td>
          </tr>
        </tbody>
        <% }  %>
      </table>
    </div>
    
    <div class="mt-3 text-center">
        <small class="text-muted">
            <i class="bi bi-info-circle"></i> Llegar 10 minutos antes a lo acordado
        </small>
    </div>
  </article>
</aside>
      </article>

    </section>
  </main>

  <%@ include file="includes/footer.jspf" %>
  <script src="JS/bootstrap.bundle.min.js"></script>
</body>
</html>
