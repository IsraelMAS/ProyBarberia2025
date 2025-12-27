package Controlador;

import ModeloDAO.AdminDAO;
import ModeloDAO.ClienteDAO;
import Modelos.Admin;
import Modelos.Cliente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private final ClienteDAO clienteDAO = new ClienteDAO();
    private final AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("login").trim();
        String contrasena = request.getParameter("contrasena").trim();

        System.out.println("LOGIN: [" + login + "]");
        System.out.println("PASSWORD: [" + contrasena + "]");
        
        // 1️⃣ INTENTAR ADMIN
        Admin admin = adminDAO.login(login, contrasena);
        if (admin != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("adminLogueado", admin);

            response.sendRedirect(request.getContextPath() + "/AdminClientes");
            return;
        }

        // 2️⃣ INTENTAR CLIENTE
        Cliente cliente = clienteDAO.login(login, contrasena);
        if (cliente != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("clienteLogueado", cliente);

            response.sendRedirect(request.getContextPath() + "/Inicio.jsp");
            return;
        }

        // 3️⃣ ERROR
        request.setAttribute("error", "Credenciales incorrectas");
        request.getRequestDispatcher("/Login.jsp").forward(request, response);
    }
}
