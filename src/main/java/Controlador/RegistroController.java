package Controlador;

import ModeloDAO.ClienteDAO;
import Modelos.Cliente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/Registro")
public class RegistroController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ClienteDAO dao = new ClienteDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/Registro.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String contrasena = request.getParameter("contrasena");

        if (nombre.isBlank() || telefono.isBlank() || contrasena.isBlank()) {
            request.setAttribute("error", "Todos los campos son obligatorios");
            request.getRequestDispatcher("/Registro.jsp").forward(request, response);
            return;
        }

        // 🔎 verificar si ya existe
        if (dao.buscarPorTelefono(telefono) != null) {
            request.setAttribute("error", "⚠️ El teléfono ya está registrado, intenta con otro ⚠️");
            request.getRequestDispatcher("/Registro.jsp").forward(request, response);
            return;
        }

        Cliente c = new Cliente();
        c.setNombre(request.getParameter("nombre"));
        c.setTelefono(request.getParameter("telefono"));
        c.setContrasena(request.getParameter("contrasena"));

        ClienteDAO dao = new ClienteDAO();
        boolean registrado = dao.registrar(c);        
        
        if (registrado) {
            response.sendRedirect("Login.jsp");
        } else {
            request.setAttribute("error", "El número de celular ya está registrado");
            request.getRequestDispatcher("Registro.jsp").forward(request, response);
        }

        // luego de registrar → login
        response.sendRedirect(request.getContextPath() + "/Login");
    }
}