package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import ModeloDAO.ClienteDAO;
import Modelos.Cliente;

@WebServlet("/ControladorSesion")
public class ControladorSesion extends HttpServlet {
  private static final long serialVersionUID = 1L;

  private ClienteDAO clienteDAO = new ClienteDAO();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    String accion = request.getParameter("accion");
    if (accion == null) accion = "";

    switch (accion) {
      case "registrar": registrar(request, response); break;
      case "login":     login(request, response); break;
      case "logout":    logout(request, response); break;
      default:          response.sendRedirect("Inicio.jsp"); break;
    }
  }

  private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String nombre   = request.getParameter("nombre");
    String telefono = request.getParameter("telefono");
    String contraseña = request.getParameter("contraseña");

    Cliente c = new Cliente();
    c.setNombre(nombre);
    c.setTelefono(telefono);
    c.setContraseña(contraseña);

    boolean ok = clienteDAO.registrar(c);

    if (ok) {
      response.sendRedirect("Login.jsp?msg=Registro%20correcto.%20Ahora%20inicia%20sesion.");
    } else {
      response.sendRedirect("Registro.jsp?msg=No%20se%20pudo%20registrar.%20Telefono%20ya%20existe%20o%20error.");
    }
  }

  private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String telefono = request.getParameter("telefono");
    String contraseña = request.getParameter("contraseña");

    Cliente cli = clienteDAO.validarLogin(telefono, contraseña);

    if (cli != null) {
      HttpSession session = request.getSession(true);
      session.setAttribute("cliente", cli);
      response.sendRedirect("Inicio.jsp?msg=Bienvenido%20" + url(cli.getNombre()));
    } else {
      response.sendRedirect("Login.jsp?msg=Telefono%20o%20contrasena%20incorrectos.");
    }
  }

  private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
    HttpSession sesion = request.getSession(false);
    if (sesion != null) sesion.invalidate();
    response.sendRedirect("Inicio.jsp?msg=Sesion%20cerrada.");
  }

  private String url(String s){
    if(s == null) return "";
    return s.replace(" ", "%20");
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request, response);
  }
}