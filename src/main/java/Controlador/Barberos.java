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
        String especialidad = request.getParameter("especialidad");
        int experiencia = Integer.parseInt(request.getParameter("experiencia"));
        double rating = Double.parseDouble(request.getParameter("rating"));
        String descripcion = request.getParameter("descripcion");

        Barbero b = new Barbero();
        b.setNombre(nombre);
        b.setEspecialidad(especialidad);
        b.setExperiencia(experiencia);
        b.setRating(rating);
        b.setDescripcion(descripcion);
        b.setActivo(true);

        // 🔥 AHORA SÍ SE GUARDA
        dao.insertar(b);

        // POST → REDIRECT → GET
        response.sendRedirect(request.getContextPath() + "/Barberos");
    }

}