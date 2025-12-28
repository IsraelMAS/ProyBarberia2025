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

        // Validar campos vacíos
        if (nombre == null || nombre.isBlank() || telefono == null || telefono.isBlank() || contrasena == null || contrasena.isBlank()) {
            request.setAttribute("error", "Todos los campos son obligatorios");
            request.getRequestDispatcher("/Registro.jsp").forward(request, response);
            return; 
        }

        // Verificar si ya existe
        if (dao.buscarPorTelefono(telefono) != null) {
            request.setAttribute("error", "⚠️ El teléfono ya está registrado, intenta con otro ⚠️");
            request.getRequestDispatcher("/Registro.jsp").forward(request, response);
            return;
        }

        Cliente c = new Cliente();
        c.setNombre(nombre);
        c.setTelefono(telefono);
        c.setContrasena(contrasena);

        boolean registrado = dao.registrar(c);        
        
        if (registrado) {
            // Redirigir al Servlet de Login para que el usuario entre
            response.sendRedirect(request.getContextPath() + "/Login");
            return; // Detiene la ejecución aquí
        } else {
            request.setAttribute("error", "No se pudo completar el registro. Intente de nuevo.");
            request.getRequestDispatcher("/Registro.jsp").forward(request, response);
            return;
        }
    }
}