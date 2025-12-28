package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
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
    private final String horarios = "Horarios.jsp";    
    private final CitaDAO dao = new CitaDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("accion");
        String acceso = horarios;
        Cita c = new Cita();
        
        // Obtener el cliente logueado de la sesión para filtrar citas
        HttpSession session = request.getSession();
        Cliente clienteSesion = (Cliente) session.getAttribute("clienteLogueado");
        int idLogueado = (clienteSesion != null) ? clienteSesion.getIdCliente() : 0;

        if (action != null) {
            if (action.equalsIgnoreCase("Agregar")) {
                capturarDatos(request, c);
                dao.insertar(c);
            }else if (action.equalsIgnoreCase("limpiar")) {
                session.removeAttribute("citaSeleccionada");
                session.removeAttribute("idBarbero");
                session.removeAttribute("nombreBarbero");
                session.removeAttribute("idServicio");
                session.removeAttribute("nombreServicio");
                
            }else if (action.equalsIgnoreCase("editar")) {
                int idCita = Integer.parseInt(request.getParameter("id"));
                Cita citaParaForm = dao.listarId(idCita);
                
                // Guardamos la cita completa
                session.setAttribute("citaSeleccionada", citaParaForm);
                
                // ACTUALIZACIÓN CLAVE: Sincronizamos los datos de la sesión con los de la cita recuperada
                if (citaParaForm.getBarbero() != null) {
                    session.setAttribute("idBarbero", String.valueOf(citaParaForm.getBarbero().getIdBarbero()));
                    session.setAttribute("nombreBarbero", citaParaForm.getBarbero().getNombre());
                }
                if (citaParaForm.getServicio() != null) {
                    session.setAttribute("idServicio", String.valueOf(citaParaForm.getServicio().getId()));
                    session.setAttribute("nombreServicio", citaParaForm.getServicio().getNombre());
                }
            }
            else if (action.equalsIgnoreCase("Actualizar")) {
                int idCita = Integer.parseInt(request.getParameter("txtIdCita"));
                capturarDatos(request, c); 
                c.setIdCita(idCita); 
                dao.editar(c); 
                session.removeAttribute("citaSeleccionada");
            } 
            else if (action.equalsIgnoreCase("eliminar")) {
                int idCita = Integer.parseInt(request.getParameter("id"));
                dao.CancelarCita(idCita);
            }
        }

        // CORRECCIÓN: Ahora listamos usando el ID del cliente que inició sesión
        List<Cita> lista = dao.listarPorCliente(idLogueado);
        request.setAttribute("misCitas", lista);

        request.getRequestDispatcher(acceso).forward(request, response);
    }

    private void capturarDatos(HttpServletRequest request, Cita cita) {
        try {
            HttpSession session = request.getSession();
            Cliente cliSesion = (Cliente) session.getAttribute("clienteLogueado");

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

            // CORRECCIÓN: Asegurar que el ID del cliente venga de la sesión
            Cliente cli = new Cliente();
            if (cliSesion != null) {
                cli.setIdCliente(cliSesion.getIdCliente());
            } else {
                // Fallback por si la sesión expiró pero el parámetro está
                cli.setIdCliente(Integer.parseInt(request.getParameter("txtIdCliente")));
            }
            cita.setCliente(cli);
            
        } catch (Exception e) {
            System.err.println("Error capturando datos en Controlador: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}