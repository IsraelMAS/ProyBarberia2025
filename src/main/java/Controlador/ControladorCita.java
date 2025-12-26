package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

import ModeloDAO.CitaDAO;
import Modelos.Barbero;
import Modelos.Cita;
import Modelos.Cliente;
import Modelos.Servicio;


@WebServlet("/ControladorCita")
public class ControladorCita extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ControladorCita() {
        super();
    }
    String horarios = "Horarios.jsp";    
   
    CitaDAO dao = new CitaDAO();

    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("accion");
        String acceso = "";
        Cita c = new Cita();

        if (action == null || action.isEmpty()) {
            acceso = horarios;
        } 
        else if (action.equalsIgnoreCase("Agregar")) {
            capturarDatos(request, c);
            dao.insertar(c);
            acceso = horarios;
        } 
        else if (action.equalsIgnoreCase("editar")) {
            int idCita = Integer.parseInt(request.getParameter("id"));
            Cita citaParaForm = dao.listarId(idCita);
            
            // GUARDAR EN SESIÓN: Aquí está el truco. La cita se queda en la "memoria"
            request.getSession().setAttribute("citaSeleccionada", citaParaForm);
            acceso = horarios;
        } 
        else if (action.equalsIgnoreCase("Actualizar")) {
            int idCita = Integer.parseInt(request.getParameter("txtIdCita"));
            capturarDatos(request, c); 
            c.setIdCita(idCita); 
            dao.editar(c); 
            
            // LIMPIAR SESIÓN: Al terminar, borramos la mochila para que el form quede vacío
            request.getSession().removeAttribute("citaSeleccionada");
            acceso = horarios;
        } 
        else if (action.equalsIgnoreCase("eliminar")) {
            int idCita = Integer.parseInt(request.getParameter("id"));
            dao.CancelarCita(idCita);
            acceso = horarios;
        }

        // Listado normal para la tabla lateral
        List<Cita> lista = dao.listarPorCliente(1);
        request.setAttribute("misCitas", lista);

        request.getRequestDispatcher(acceso).forward(request, response);
    }
	private void capturarDatos(HttpServletRequest request, Cita cita ) {
		
		try {
            cita.setFecha(Date.valueOf(request.getParameter("txtFecha")));
            cita.setHora(Time.valueOf(request.getParameter("txtHora")));
            cita.setInstrucciones(request.getParameter("txtInstrucciones"));
            cita.setEstado("RESERVADA");

            // Barbero
            Barbero bar = new Barbero();
            bar.setIdBarbero(Integer.parseInt(request.getParameter("idBarbero")));
            cita.setBarbero(bar);

            // Servicio
            Servicio ser = new Servicio();
            ser.setId(Integer.parseInt(request.getParameter("idServicio")));
            cita.setServicio(ser);

            // Cliente (ID 1 estático según tu formulario)
            Cliente cli = new Cliente();
            cli.setIdCliente(Integer.parseInt(request.getParameter("txtIdCliente")));
            cita.setCliente(cli);
            
        } catch (Exception e) {
            System.err.println("Error capturando datos: " + e.getMessage());
        }
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
