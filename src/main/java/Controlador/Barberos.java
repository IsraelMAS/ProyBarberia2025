package Controlador;

import ModeloDAO.BarberoDAO;
import Modelos.Barbero;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/Barberos")
public class Barberos extends HttpServlet {
    private static final long serialVersionUID = 1L;

    BarberoDAO dao = new BarberoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Barbero> lista = dao.listar();
        request.setAttribute("lista", lista);

        // 👉 AQUÍ debe ir el JSP DE LA TABLA
        request.getRequestDispatcher("/Vistas/Admin/ver-barberos.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");

        // SOLO si tienes insertar en el DAO
        if (nombre != null && telefono != null) {
            Barbero b = new Barbero();
            b.setNombre(nombre);
        }

        // 🔥 ESTA LÍNEA ES LA CLAVE 🔥
        response.sendRedirect(request.getContextPath() + "/Barberos");
    }
}