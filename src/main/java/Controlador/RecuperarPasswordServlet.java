package Controlador;

import ModeloDAO.ClienteDAO;
import Modelos.Cliente;
import Servicios.EmailService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/RecuperarPassword")
public class RecuperarPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ClienteDAO clienteDAO = new ClienteDAO();
    private EmailService emailService = new EmailService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo");

        if (correo == null || correo.isBlank()) {
            request.setAttribute("error", "Debes ingresar un correo válido.");
            request.getRequestDispatcher("/RecuperarPassword.jsp")
                    .forward(request, response);
            return;
        }

        try {
            // 1️⃣ Verificar si el correo existe en BD
            Cliente cliente = clienteDAO.buscarPorCorreo(correo);

            if (cliente == null) {
                request.setAttribute("error", "El correo no está registrado.");
                request.getRequestDispatcher("/RecuperarPassword.jsp")
                        .forward(request, response);
                return;
            }

            // 2️⃣ Generar token único
            String token = UUID.randomUUID().toString();

            // 3️⃣ Guardar token en BD (con expiración)
            clienteDAO.guardarTokenRecuperacion(correo, token);

            // 4️⃣ Construir enlace de recuperación
            String baseUrl = request.getScheme() + "://"
                    + request.getServerName() + ":"
                    + request.getServerPort()
                    + request.getContextPath();

            String enlace = baseUrl + "/RestablecerPassword.jsp?token=" + token;


            // 5️⃣ Preparar mensaje
            String mensaje =
                    "Hola " + cliente.getNombre() + ",\n\n"
                    + "Has solicitado restablecer tu contraseña.\n\n"
                    + "Haz clic en el siguiente enlace:\n"
                    + enlace + "\n\n"
                    + "Este enlace caduca en 15 minutos.\n"
                    + "Si no solicitaste este cambio, ignora este correo.";

            // 6️⃣ Enviar correo (AQUÍ ES DONDE SE USA TU DEPENDENCIA)
            emailService.enviarCorreo(
                    correo,
                    "Restablecer contraseña - BARBERSHOP",
                    mensaje
            );

            // 7️⃣ Mensaje de éxito
            request.setAttribute("msg",
                    "Se ha enviado un enlace a tu correo para restablecer tu contraseña.");
            request.getRequestDispatcher("/RecuperarPassword.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(); // 🔴 MUY IMPORTANTE: mira la consola si falla

            request.setAttribute("error",
                    "Error al enviar el correo: " + e.getMessage());
            request.getRequestDispatcher("/RecuperarPassword.jsp")
                    .forward(request, response);
        }
    }
}
