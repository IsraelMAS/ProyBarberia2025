package Controlador;

import ModeloDAO.ClienteDAO;
import Modelos.Cliente;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminClientes")
public class AdminClientes extends HttpServlet {
	private static final long serialVersionUID = 1L;

    ClienteDAO dao = new ClienteDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");

        if (accion == null || accion.equals("list")) {
            listar(req, resp);
            return;
        }

        if (accion.equals("new")) {
            req.getRequestDispatcher("/Vistas/Admin/agregar-clientes.jsp")
               .forward(req, resp);
        } else {
            listar(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String nombre = req.getParameter("nombre");
        String telefono = req.getParameter("telefono");
        String contrasena = req.getParameter("contrasena");

        if (nombre != null && !nombre.isBlank()
                && telefono != null && !telefono.isBlank()) {

            Cliente c = new Cliente(nombre, telefono, contrasena);
            dao.insertar(c);
        }

        // POST → REDIRECT → GET
        resp.sendRedirect(req.getContextPath() + "/AdminClientes");
    }

    private void listar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	
    	List<Cliente> lista = dao.listar();
    	req.setAttribute("lista", lista);
    	req.getRequestDispatcher("/Vistas/Admin/ver-clientes.jsp")
    	       .forward(req, resp);
    }
}
