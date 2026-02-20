package Servicios;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService {

    private final String correoRemitente = "israel.angulo.salas4@gmail.com";
    private final String claveAplicacion = "mvhmrplbccnbmbtg";

    public void enviarCorreo(String destinatario, String asunto, String contenido) throws Exception {

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com"); // ← CLAVE
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.debug", "true");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(correoRemitente, claveAplicacion);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(correoRemitente));
        message.setRecipients(
                Message.RecipientType.TO,
                InternetAddress.parse(destinatario)
        );
        message.setSubject(asunto);
        message.setText(contenido);

        Transport.send(message);
    }

}
