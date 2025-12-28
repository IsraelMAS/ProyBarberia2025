package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import ModeloDAO.CitaDAO;
import Modelos.Cita;

/**
 * Servlet implementation class ControladorAdminCitas
 */
@WebServlet("/AdminCitas")
public class ControladorAdminCitas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    CitaDAO dao = new CitaDAO();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorAdminCitas() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	// 1. Lógica para procesar el cambio de estado (Botones Acciones)
        String accion = request.getParameter("accion");

        if (accion != null && accion.equalsIgnoreCase("cambiar")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String nuevoEstado = request.getParameter("estado");
                
                dao.cambiarEstado(id, nuevoEstado);
                
                // Redirigimos al nombre correcto de tu Servlet
                response.sendRedirect("AdminCitas"); 
                return; 
            } catch (Exception e) {
                System.err.println("Error al cambiar estado: " + e.getMessage());
            }
        }

        // 2. Listado normal de citas para la tabla
        List<Cita> lista = dao.listarTodas();
        request.setAttribute("listaCitas", lista);

        request.getRequestDispatcher("/Vistas/Admin/citas.jsp")
               .forward(request, response);
    
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
