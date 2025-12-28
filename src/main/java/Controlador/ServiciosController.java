package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import ModeloDAO.ServicioDAO;
import Modelos.Servicio;

/**
 * Servlet implementation class ServiciosController
 */
@WebServlet("/ServiciosController")
public class ServiciosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServicioDAO dao = new ServicioDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiciosController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String accion = request.getParameter("accion");
        
        // Si la acción es editar, buscamos el servicio y vamos al formulario
        if ("editar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Servicio s = dao.buscarPorId(id);
            request.setAttribute("servicio", s);
            request.getRequestDispatcher("/Vistas/Admin/formulario-servicio.jsp").forward(request, response);
            return;
        }
        
        // Por defecto: Listar
        List<Servicio> lista = dao.listar();
        request.setAttribute("listaServicios", lista);
        request.getRequestDispatcher("/Vistas/Admin/ver-servicios.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if ("eliminar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
        } else {
            // Captura de datos para Insertar o Actualizar
            Servicio s = new Servicio();
            String idStr = request.getParameter("id_servicio");
            
            s.setNombre(request.getParameter("nombre"));
            s.setDescripcion(request.getParameter("descripcion"));
            s.setDuracionMin(Integer.parseInt(request.getParameter("duracion")));
            s.setIncluye(request.getParameter("incluye"));
            s.setPrecio(Double.parseDouble(request.getParameter("precio")));
            s.setImagen(request.getParameter("imagen"));
            s.setAlt(request.getParameter("alt"));
            s.setOrden(Integer.parseInt(request.getParameter("orden")));

            if (idStr == null || idStr.isEmpty()) {
                dao.insertar(s);
            } else {
                s.setId(Integer.parseInt(idStr));
                dao.actualizar(s);
            }
        }
        response.sendRedirect(request.getContextPath() + "/ServiciosController");
	}

}
