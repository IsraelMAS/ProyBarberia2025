package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Controlador
 */
@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Controlador() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String q = request.getParameter("q");
		String esp = request.getParameter("esp");
		String orden = request.getParameter("orden");

		if (esp == null || esp.isBlank()) esp = "todos";
		if (orden == null || orden.isBlank()) orden = "recomendado";

		request.setAttribute("q", q);
		request.setAttribute("esp", esp);
		request.setAttribute("orden", orden);

		// aquí filtras/ordenas tu lista y la pones en request
		// request.setAttribute("barberos", listaFiltrada);

		request.getRequestDispatcher("/Barberos.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

}
