package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import ModeloDAO.ClienteDAO;
import Modelos.Cliente;

/**
 * Servlet implementation class CambiarPassword
 */
@WebServlet("/CambiarPassword")
public class CambiarPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    String token = req.getParameter("token");
	    String nueva = req.getParameter("nuevaContrasena");
	    String confirmar = req.getParameter("confirmarContrasena");

	    if (token == null || token.isBlank()) {
	        req.setAttribute("error", "Enlace inválido o inexistente.");
	        req.getRequestDispatcher("/RestablecerPassword.jsp").forward(req, resp);
	        return;
	    }

	    if (!nueva.equals(confirmar)) {
	        req.setAttribute("error", "Las contraseñas no coinciden.");
	        req.getRequestDispatcher("/RestablecerPassword.jsp?token=" + token)
	           .forward(req, resp);
	        return;
	    }

	    try {
	        ClienteDAO clienteDAO = new ClienteDAO();

	        // 1️⃣ Buscar cliente por token
	        Cliente cliente = clienteDAO.buscarPorToken(token);
	        if (cliente == null) {
	            req.setAttribute("error", "Enlace inválido o expirado.");
	            req.getRequestDispatcher("/RestablecerPassword.jsp").forward(req, resp);
	            return;
	        }

	        // 2️⃣ Actualizar contraseña
	        clienteDAO.actualizarContrasena(cliente.getIdCliente(), nueva);

	        // 3️⃣ Limpiar token (muy importante por seguridad)
	        clienteDAO.limpiarToken(cliente.getIdCliente());

	        req.setAttribute("msg", "Contraseña actualizada correctamente.");
	        req.getRequestDispatcher("/Login.jsp").forward(req, resp);

	    } catch (Exception e) {
	        e.printStackTrace();
	        req.setAttribute("error", "Error al actualizar la contraseña: " + e.getMessage());
	        req.getRequestDispatcher("/RestablecerPassword.jsp?token=" + token)
	           .forward(req, resp);
	    }
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    String token = req.getParameter("token");

	    if (token == null || token.isBlank()) {
	        req.setAttribute("error", "Enlace inválido.");
	        req.getRequestDispatcher("/RecuperarPassword.jsp")
	           .forward(req, resp);
	        return;
	    }

	    ClienteDAO clienteDAO = new ClienteDAO();
	    Cliente cliente = clienteDAO.buscarPorToken(token);

	    if (cliente == null) {
	        req.setAttribute("error", "Enlace inválido o expirado.");
	        req.getRequestDispatcher("/RecuperarPassword.jsp")
	           .forward(req, resp);
	        return;
	    }

	    // Si el token es válido, sí mostramos la página para cambiar contraseña
	    req.getRequestDispatcher("/RestablecerPassword.jsp")
	       .forward(req, resp);
	}


}

