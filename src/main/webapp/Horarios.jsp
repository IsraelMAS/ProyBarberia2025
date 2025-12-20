<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      <aside class="col-lg-6">
        <article class="bg-secondary p-3 rounded">
          <h3 class="text-danger">Horarios disponibles</h3>
          <table class="table table-dark table-striped table-bordered mb-0">
            <thead><tr><th>Turno</th><th>Horas</th></tr></thead>
            <tbody>
              <tr><td>Mañana</td><td>09:00 - 12:00</td></tr>
              <tr><td>Tarde</td><td>14:00 - 17:00</td></tr>
              <tr><td>Noche</td><td>18:00 - 20:00</td></tr>
            </tbody>
          </table>
          <small class="text-white-50">*Vista de demostración (sin backend).</small>
        </article>
      </aside>
	
      <article class="col-lg-6">
        <section class="bg-secondary p-3 rounded">
          <h3 class="text-primary">Reservar cita</h3>
          <form action="#" method="post">
          
            <label class="form-label">Nombre</label>
            <input type="text" class="form-control mb-2" required>

            <label class="form-label">Teléfono</label>
            <input type="tel" class="form-control mb-2" required>
            
            <input type="hidden" name="idBarbero" value="">
			<label class="form-label">Barbero</label>
			<div class="d-flex gap-2 align-items-start mb-3">
    		<input type="text" class="form-control" 
           		value="" readonly>
    			<a href="ControladorBarbero?accion=listar" 
       				class="btn btn-outline-light text-nowrap">Elegir barbero</a>
    		</div>
              
            <input type="hidden" name="idServicio" value="">
			<label class="form-label">Servicio</label>
			<div class="d-flex gap-2 align-items-start mb-3">
    		<input type="text" class="form-control" 
          		 value="${servicio.nombre}" readonly>
    		<a href="ControladorServicio?accion=listar" class="btn btn-outline-light text-nowrap">
       			Elegir servicio </a>
    		</div>
            
            <label class="form-label">Fecha</label>
            <input type="date" class="form-control mb-2" required>

            <label class="form-label">Hora</label>
            <select class="form-select mb-3" required>
              <option value="">Selecciona una hora</option>
              <option>09:00</option><option>10:00</option><option>11:00</option>
              <option>14:00</option><option>15:00</option><option>16:00</option>
              <option>18:00</option><option>19:00</option>
            </select>
            
            <label>Instrucciones para su barbero:</label>
            <div>
			<textarea rows="4" cols="50"></textarea>
			</div>
            <section class="d-flex gap-2">
              <button class="btn btn-danger">Reservar</button>
              <button type="reset" class="btn btn-primary">Limpiar</button>
            </section>
          </form>
        </section>
      </article>
      
      <aside class="col-lg-6">
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

      
    </section>
  </main>

  <%@ include file="includes/footer.jspf" %>
  <script src="JS/bootstrap.bundle.min.js"></script>
</body>
</html>
