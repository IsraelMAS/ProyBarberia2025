package Controlador;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//PDF TEXT.* - TIPOGRAFIA y COLOR PARA ACOMODAR EL PDF DE LAS COLUMNAS DE CITAS AGENDADAS

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

            // ===== FUENTES =====
            Font tituloFont = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
            Font headerFont = new Font(Font.FontFamily.HELVETICA, 10, Font.BOLD, BaseColor.WHITE);
            Font cellFont   = new Font(Font.FontFamily.HELVETICA, 9);
            Font totalFont  = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);

            // ===== TITULO =====
            Paragraph titulo = new Paragraph("REPORTE GENERAL DE CITAS", tituloFont);
            titulo.setAlignment(Element.ALIGN_CENTER);
            document.add(titulo);
            document.add(new Paragraph(" "));

            // ===== TABLA =====
            PdfPTable tabla = new PdfPTable(7);
            tabla.setWidthPercentage(100);

            String[] headers = {
                "Cliente", "Barbero", "Servicio",
                "Precio (S/)", "Fecha", "Hora", "Estado"
            };

            for (String h : headers) {
                PdfPCell cell = new PdfPCell(new Phrase(h, headerFont));
                cell.setBackgroundColor(BaseColor.DARK_GRAY);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                tabla.addCell(cell);
            }

            // ===== DATOS =====
            CitaDAO dao = new CitaDAO();
            List<Cita> lista = dao.listarTodas();

            SimpleDateFormat sdfFecha = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdfHora  = new SimpleDateFormat("HH:mm");

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

            // ===== TOTAL =====
            document.add(new Paragraph(" "));
            Paragraph total = new Paragraph(
                "TOTAL GENERAL: S/ " + String.format("%.2f", totalGeneral),
                totalFont
            );
            total.setAlignment(Element.ALIGN_RIGHT);
            document.add(total);

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
