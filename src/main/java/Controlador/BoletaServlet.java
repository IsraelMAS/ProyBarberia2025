package Controlador;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import ModeloDAO.CitaDAO;
import Modelos.Cita;

@WebServlet("/BoletaServlet")
public class BoletaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idCita = Integer.parseInt(request.getParameter("id"));

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", 
                "attachment; filename=boleta_cita_" + idCita + ".pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // ===== FUENTES =====
            Font titulo = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
            Font subtitulo = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
            Font texto = new Font(Font.FontFamily.HELVETICA, 11);
            Font headerTabla = new Font(Font.FontFamily.HELVETICA, 11, Font.BOLD, BaseColor.WHITE);

            // ===== DATOS =====
            CitaDAO dao = new CitaDAO();
            Cita c = dao.obtenerPorId(idCita);

            // ===== TITULO =====
            Paragraph pTitulo = new Paragraph("BARBERSHOP - BOLETA DE SERVICIO\n\n", titulo);
            pTitulo.setAlignment(Element.ALIGN_CENTER);
            document.add(pTitulo);

            Paragraph fecha = new Paragraph("Fecha de emisión: " + java.time.LocalDate.now(), texto);
            fecha.setAlignment(Element.ALIGN_RIGHT);
            document.add(fecha);

            document.add(new Paragraph("\n"));

            // ===== TABLA =====
            PdfPTable tabla = new PdfPTable(2);
            tabla.setWidthPercentage(100);
            tabla.setWidths(new float[]{3, 5});

            PdfPCell header1 = new PdfPCell(new Phrase("Detalle", headerTabla));
            PdfPCell header2 = new PdfPCell(new Phrase("Información", headerTabla));

            header1.setBackgroundColor(BaseColor.DARK_GRAY);
            header2.setBackgroundColor(BaseColor.DARK_GRAY);
            header1.setHorizontalAlignment(Element.ALIGN_CENTER);
            header2.setHorizontalAlignment(Element.ALIGN_CENTER);

            tabla.addCell(header1);
            tabla.addCell(header2);

            tabla.addCell("Cliente");
            tabla.addCell(c.getCliente().getNombre());

            tabla.addCell("Teléfono");
            tabla.addCell(c.getCliente().getTelefono());

            tabla.addCell("Barbero");
            tabla.addCell(c.getBarbero().getNombre());

            tabla.addCell("Servicio");
            tabla.addCell(c.getServicio().getNombre());

            tabla.addCell("Precio");
            tabla.addCell("S/ " + c.getServicio().getPrecio());

            tabla.addCell("Fecha");
            tabla.addCell(c.getFecha().toString());

            tabla.addCell("Hora");
            tabla.addCell(c.getHora().toString());

            tabla.addCell("Estado");
            tabla.addCell(c.getEstado());

            document.add(tabla);

            // ===== TOTAL =====
            document.add(new Paragraph("\n"));
            Paragraph total = new Paragraph(
                    "TOTAL A PAGAR: S/ " + c.getServicio().getPrecio(),
                    subtitulo
            );
            total.setAlignment(Element.ALIGN_RIGHT);
            document.add(total);

            // ===== PIE =====
            document.add(new Paragraph("\n"));
            Paragraph pie = new Paragraph(
                    "Gracias por confiar en BARBERSHOP 💈\nLlegar 10 minutos antes de la hora reservada.",
                    texto
            );
            pie.setAlignment(Element.ALIGN_CENTER);
            document.add(pie);

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
