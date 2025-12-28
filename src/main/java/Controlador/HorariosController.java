package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import ModeloDAO.HorarioDAO;
import Modelos.Horario;

/**
 * Servlet implementation class HorarioController
 */
@WebServlet("/HorariosController")
public class HorariosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HorarioDAO dao = new HorarioDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HorariosController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");

        if ("editar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Horario h = dao.buscarPorId(id);
            request.setAttribute("horarioEdit", h);
            request.getRequestDispatcher("/Vistas/Admin/formulario-horario.jsp").forward(request, response);
        } else {
            List<Horario> lista = dao.listar();
            request.setAttribute("listaHorarios", lista);
            request.getRequestDispatcher("/Vistas/Admin/ver-horarios.jsp").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String accion = request.getParameter("accion");
        
        if ("eliminar".equals(accion)) {
            dao.eliminar(Integer.parseInt(request.getParameter("id")));
        } else {
            Horario h = new Horario();
            String idStr = request.getParameter("id_horario");
            h.setTurno(request.getParameter("turno"));
            h.setHora(request.getParameter("hora"));
            h.setOrden(Integer.parseInt(request.getParameter("orden")));

            if (idStr == null || idStr.isEmpty()) {
                dao.insertar(h);
            } else {
                h.setIdHorario(Integer.parseInt(idStr));
                dao.actualizar(h);
            }
        }
        response.sendRedirect(request.getContextPath() + "/HorariosController");
    }

}
