<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ModeloDAO.HorarioDAO"%>
<%@ page import="Modelos.Horario"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
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

          <form action="#" method="post">

            <label class="form-label">Nombre</label>
            <input type="text" class="form-control mb-2" required>

            <label class="form-label">Teléfono</label>
            <input type="tel" class="form-control mb-2" required>
            
            <%
   			
            	String idBarbero = request.getParameter("idBarbero");
            	String nombreBarbero = request.getParameter("nombreBarbero");
            	if (nombreBarbero == null) nombreBarbero = "No seleccionado";

            	String idServ = request.getParameter("id"); 
            	String nomServ = request.getParameter("nombre"); 
            	if (nomServ == null) nomServ = "No seleccionado";
    
			%>

            <input type="hidden" name="idBarbero" value="<%= (idBarbero != null) ? idBarbero : "" %>">
            <label class="form-label">Barbero</label>
            <div class="d-flex gap-2 align-items-start mb-3">
              <input type="text" class="form-control" value="<%= nombreBarbero %>" readonly>
              <a href="Barberos.jsp"
                 class="btn btn-outline-light text-nowrap">Elegir barbero</a>
            </div>
            <input type="hidden" name="idServicio" value="<%= (idServ != null) ? idServ : "" %>">
            <label class="form-label">Servicio</label>
            <div class="d-flex gap-2 align-items-start mb-3">
              <input type="text" class="form-control"
                     value="<%= nomServ %>" readonly>
              <a href="Servicios.jsp#cortes"
                 class="btn btn-outline-light text-nowrap">Elegir servicio</a>
            </div>

            <label class="form-label">Fecha</label>
            <input type="date" name="txtFecha" class="form-control mb-2" required>

            <label class="form-label">Hora</label>
            <select name="txtHora" class="form-select mb-3" required>
              <option value="">Selecciona una hora</option>
        	  <option value="09:00:00">09:00</option>
              <option value="10:00:00">10:00</option>
              <option value="11:00:00">11:00</option>
              <option value="14:00:00">14:00</option>
              <option value="15:00:00">15:00</option>
              <option value="16:00:00">16:00</option>
              <option value="18:00:00">18:00</option>
              <option value="19:00:00">19:00</option>
            </select>

            <label>Instrucciones para su barbero:</label>
            <div>
              <textarea name="txtInstrucciones" class="form-control" rows="4" ></textarea>
            </div>
			<input type="hidden" name="txtEstado" value="RESERVADA">
			
            <section class="d-flex gap-2 mt-3">
              <button type="submit" name="accion" value="GuardarCita" class="btn btn-danger">Reservar</button>
              <button type="reset" class="btn btn-primary">Limpiar</button>
            </section>

          </form>
        </section>
      </article>

    </section>
  </main>

  <%@ include file="includes/footer.jspf" %>
  <script src="JS/bootstrap.bundle.min.js"></script>
</body>
</html>
