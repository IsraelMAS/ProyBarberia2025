package Controlador;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import ModeloDAO.CitaDAO;
import Modelos.Cita;

@WebServlet("/ReporteGeneralServlet")
public class ReportePDFServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/pdf");
        response.setHeader(
            "Content-Disposition",
            "attachment; filename=REPORTE_GENERAL_CITAS_ADMIN.pdf"
        );

        try {

            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // =====================
            // COLORES INSTITUCIONALES
            // =====================
            BaseColor rojo = new BaseColor(180, 0, 0);
            BaseColor azul = new BaseColor(0, 51, 153);
            BaseColor blanco = BaseColor.WHITE;

            // =====================
            // FUENTES
            // =====================
            Font tituloFont = new Font(Font.FontFamily.HELVETICA, 20, Font.BOLD, azul);
            Font subFont = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
            Font headerFont = new Font(Font.FontFamily.HELVETICA, 10, Font.BOLD, blanco);
            Font cellFont = new Font(Font.FontFamily.HELVETICA, 9);
            Font totalFont = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD, rojo);

            // =====================
            // LOGO
            // =====================
            String rutaLogo = getServletContext().getRealPath("/IMG/ICONOS/BarberShop_Boleta.png");
            Image logo = Image.getInstance(rutaLogo);
            logo.scaleToFit(90, 90);
            logo.setAlignment(Element.ALIGN_LEFT);
            document.add(logo);

            // =====================
            // TITULO
            // =====================
            Paragraph titulo = new Paragraph("BARBERSHOP\nREPORTE GENERAL DE CITAS\n\n", tituloFont);
            titulo.setAlignment(Element.ALIGN_CENTER);
            document.add(titulo);

            // =====================
            // FECHA EMISIÓN
            // =====================
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            String fechaActual = LocalDateTime.now().format(formatter);

            Paragraph fecha = new Paragraph("Fecha de generación: " + fechaActual, subFont);
            fecha.setAlignment(Element.ALIGN_RIGHT);
            document.add(fecha);
            document.add(new Paragraph("\n"));

            // =====================
            // TABLA
            // =====================
            PdfPTable tabla = new PdfPTable(7);
            tabla.setWidthPercentage(100);
            tabla.setSpacingBefore(10);

            float[] columnas = {2, 2, 2, 1.5f, 1.5f, 1.5f, 1.5f};
            tabla.setWidths(columnas);

            String[] headers = {
                "Cliente", "Barbero", "Servicio",
                "Precio", "Fecha", "Hora", "Estado"
            };

            for (int i = 0; i < headers.length; i++) {
                PdfPCell header = new PdfPCell(new Phrase(headers[i], headerFont));
                header.setHorizontalAlignment(Element.ALIGN_CENTER);
                header.setBackgroundColor(i % 2 == 0 ? rojo : azul);
                header.setPadding(5);
                tabla.addCell(header);
            }

            // =====================
            // DATOS
            // =====================
            CitaDAO dao = new CitaDAO();
            List<Cita> lista = dao.listarTodas();

            SimpleDateFormat sdfFecha = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");

            double totalGeneral = 0.0;

            for (Cita c : lista) {

                double precio = c.getServicio() != null ? c.getServicio().getPrecio() : 0;
                totalGeneral += precio;

                tabla.addCell(new Phrase(c.getCliente().getNombre(), cellFont));
                tabla.addCell(new Phrase(c.getBarbero().getNombre(), cellFont));
                tabla.addCell(new Phrase(c.getServicio().getNombre(), cellFont));
                tabla.addCell(new Phrase("S/ " + String.format("%.2f", precio), cellFont));
                tabla.addCell(new Phrase(sdfFecha.format(c.getFecha()), cellFont));
                tabla.addCell(new Phrase(sdfHora.format(c.getHora()), cellFont));
                tabla.addCell(new Phrase(c.getEstado(), cellFont));
            }

            document.add(tabla);

            // =====================
            // TOTAL GENERAL
            // =====================
            document.add(new Paragraph("\n"));

            Paragraph total = new Paragraph(
                "TOTAL GENERAL RECAUDADO: S/ " + String.format("%.2f", totalGeneral),
                totalFont
            );
            total.setAlignment(Element.ALIGN_RIGHT);
            document.add(total);

            // =====================
            // PIE PROFESIONAL
            // =====================
            document.add(new Paragraph("\n"));
            Paragraph pie = new Paragraph(
                "Documento generado automáticamente por el Sistema BARBERSHOP.\n" +
                "Uso exclusivo para control administrativo.",
                subFont
            );
            pie.setAlignment(Element.ALIGN_CENTER);
            document.add(pie);

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
