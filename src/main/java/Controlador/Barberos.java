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

    	// 1. Obtener los datos frescos de la BD
        List<Barbero> lista = dao.listar();
        
        // 2. Guardarlos en el "saquito" (request) para que el JSP los vea
        request.setAttribute("lista", lista);
        
        // 3. ENVIAR al JSP (El Dispatcher es el que 'infla' el JSP con los datos)
        request.getRequestDispatcher("/Vistas/Admin/ver-barberos.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");

        if ("eliminar".equals(accion)) {

            int id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);

            response.sendRedirect(request.getContextPath() + "/Barberos");
            return;
        }

        // 👉 INSERTAR (lo que ya tenías)
        String nombre = request.getParameter("nombre");
        String especialidad = request.getParameter("especialidad");
        int experiencia = Integer.parseInt(request.getParameter("experiencia"));
        double rating = Double.parseDouble(request.getParameter("rating"));
        String descripcion = request.getParameter("descripcion");
        String imagen = request.getParameter("imagen");

        Barbero b = new Barbero();
        b.setNombre(nombre);
        b.setEspecialidad(especialidad);
        b.setExperiencia(experiencia);
        b.setRating(rating);
        b.setDescripcion(descripcion);
        b.setImagen(imagen);
        b.setActivo(true);

        dao.insertar(b);

        response.sendRedirect(request.getContextPath() + "/Barberos");
    }

}