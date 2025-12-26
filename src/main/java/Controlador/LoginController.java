package Controlador;

import ModeloDAO.ClienteDAO;
import Modelos.Cliente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/Login")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final ClienteDAO clienteDAO = new ClienteDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Mostrar formulario de login
        request.getRequestDispatcher("/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String telefono = request.getParameter("telefono");
        String contrasena = request.getParameter("contrasena");

        if (telefono == null || contrasena == null ||
            telefono.isBlank() || contrasena.isBlank()) {

            request.setAttribute("error", "Complete todos los campos");
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
            return;
        }

        Cliente cliente = clienteDAO.login(telefono, contrasena);

        if (cliente != null) {
            // ✅ LOGIN OK → guardar en sesión
            HttpSession session = request.getSession();
            session.setAttribute("clienteLogueado", cliente);

            // redirigir al flujo principal
            response.sendRedirect(request.getContextPath() + "/Inicio.jsp");

        } else {
            // ❌ LOGIN FAIL
            request.setAttribute("error", "Teléfono o contraseña incorrectos");
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
    }
}
