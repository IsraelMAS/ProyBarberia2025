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
