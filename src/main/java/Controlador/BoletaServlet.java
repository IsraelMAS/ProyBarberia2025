package Controlador;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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

@WebServlet("/BoletaServlet")
public class BoletaServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int idCita = Integer.parseInt(request.getParameter("id"));

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment; filename=boleta_cita_" + idCita + ".pdf");

		try {
			Document document = new Document();
			PdfWriter.getInstance(document, response.getOutputStream());
			document.open();

			// =====================
			// COLORES CORPORATIVOS
			// =====================
			BaseColor rojo = new BaseColor(180, 0, 0);
			BaseColor azul = new BaseColor(0, 51, 153);
			BaseColor grisClaro = new BaseColor(230, 230, 230);
			BaseColor blanco = BaseColor.WHITE;

			// =====================
			// FUENTES
			// =====================
			Font titulo = new Font(Font.FontFamily.HELVETICA, 22, Font.BOLD, rojo);
			Font subtitulo = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD, azul);
			Font texto = new Font(Font.FontFamily.HELVETICA, 11);
			Font headerTabla = new Font(Font.FontFamily.HELVETICA, 11, Font.BOLD, blanco);
			Font firmaFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);

			// =====================
			// LOGO
			// =====================
			String rutaLogo = getServletContext().getRealPath("/IMG/ICONOS/BarberShop_Boleta.png");
			Image logo = Image.getInstance(rutaLogo);
			logo.scaleToFit(100, 100);
			logo.setAlignment(Element.ALIGN_CENTER);
			document.add(logo);

			// =====================
			// DATOS
			// =====================
			CitaDAO dao = new CitaDAO();
			Cita c = dao.obtenerPorId(idCita);

			// =====================
			// NÚMERO DE BOLETA
			// =====================
			Paragraph nroBoleta = new Paragraph("BOLETA N° 000" + idCita, subtitulo);
			nroBoleta.setAlignment(Element.ALIGN_RIGHT);
			document.add(nroBoleta);

			// =====================
			// TÍTULO
			// =====================
			Paragraph pTitulo = new Paragraph("BARBERSHOP\n", titulo);
			pTitulo.setAlignment(Element.ALIGN_CENTER);
			document.add(pTitulo);

			Paragraph sub = new Paragraph("BOLETA DE SERVICIO\n", subtitulo);
			sub.setAlignment(Element.ALIGN_CENTER);
			document.add(sub);

			// =====================
			// FECHA Y HORA EXACTA
			// =====================
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
			String fechaHoraActual = LocalDateTime.now().format(formatter);

			Paragraph fecha = new Paragraph("Fecha y hora de emisión: " + fechaHoraActual, texto);
			fecha.setAlignment(Element.ALIGN_RIGHT);
			document.add(fecha);

			document.add(new Paragraph("\n"));

			// =====================
			// TABLA ESTILIZADA
			// =====================
			PdfPTable tabla = new PdfPTable(2);
			tabla.setWidthPercentage(100);
			tabla.setWidths(new float[] { 3, 5 });

			// Encabezados
			PdfPCell header1 = new PdfPCell(new Phrase("Detalle", headerTabla));
			PdfPCell header2 = new PdfPCell(new Phrase("Información", headerTabla));

			header1.setBackgroundColor(rojo);
			header2.setBackgroundColor(azul);
			header1.setHorizontalAlignment(Element.ALIGN_CENTER);
			header2.setHorizontalAlignment(Element.ALIGN_CENTER);

			tabla.addCell(header1);
			tabla.addCell(header2);

			// Filas alternadas
			PdfPCell celda1 = new PdfPCell(new Phrase("Cliente", texto));
			celda1.setBackgroundColor(grisClaro);
			tabla.addCell(celda1);
			tabla.addCell(new Phrase(c.getCliente().getNombre(), texto));

			tabla.addCell("Teléfono");
			tabla.addCell(c.getCliente().getTelefono());

			PdfPCell celda3 = new PdfPCell(new Phrase("Barbero", texto));
			celda3.setBackgroundColor(grisClaro);
			tabla.addCell(celda3);
			tabla.addCell(new Phrase(c.getBarbero().getNombre(), texto));

			tabla.addCell("Servicio");
			tabla.addCell(c.getServicio().getNombre());

			PdfPCell celda5 = new PdfPCell(new Phrase("Precio", texto));
			celda5.setBackgroundColor(grisClaro);
			tabla.addCell(celda5);
			tabla.addCell("S/ " + c.getServicio().getPrecio());

			tabla.addCell("Fecha");
			tabla.addCell(c.getFecha().toString());

			PdfPCell celda7 = new PdfPCell(new Phrase("Hora", texto));
			celda7.setBackgroundColor(grisClaro);
			tabla.addCell(celda7);
			tabla.addCell(c.getHora().toString());

			tabla.addCell("Estado");
			tabla.addCell(c.getEstado());

			document.add(tabla);
			// =====================
			// INSTRUCCIONES ESPECIALES
			// =====================
			document.add(new Paragraph("\n"));

			String instrucciones = c.getInstrucciones();

			if (instrucciones == null || instrucciones.trim().isEmpty()) {
			    instrucciones = "Sin instrucciones adicionales.";
			}

			Paragraph tituloInst = new Paragraph("INSTRUCCIONES ESPECIALES", 
			        new Font(Font.FontFamily.HELVETICA, 13, Font.BOLD, azul));
			tituloInst.setAlignment(Element.ALIGN_LEFT);
			document.add(tituloInst);

			document.add(new Paragraph("\n"));

			PdfPTable tablaInst = new PdfPTable(1);
			tablaInst.setWidthPercentage(100);

			PdfPCell celdaInst = new PdfPCell(new Phrase(instrucciones, texto));
			celdaInst.setPadding(10);
			celdaInst.setBackgroundColor(grisClaro);

			tablaInst.addCell(celdaInst);
			document.add(tablaInst);

			// =====================
			// TOTAL DESTACADO
			// =====================
			document.add(new Paragraph("\n"));
			Paragraph total = new Paragraph("TOTAL A PAGAR: S/ " + c.getServicio().getPrecio(),
					new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, rojo));
			total.setAlignment(Element.ALIGN_RIGHT);
			document.add(total);

			// =====================
			// FIRMA CORPORATIVA EMPRESA
			// =====================
			document.add(new Paragraph("\n\n"));

			// Ruta de la firma institucional
			String rutaFirma = getServletContext().getRealPath("/IMG/ICONOS/signature.png");
			Image firmaEmpresa = Image.getInstance(rutaFirma);
			firmaEmpresa.scaleToFit(170, 70);
			firmaEmpresa.setAlignment(Element.ALIGN_CENTER);
			document.add(firmaEmpresa);

			// Nombre de la empresa debajo
			Paragraph nombreEmpresa = new Paragraph(
			    "BarberShop Independencia S.A.C.\n" +
			    "Documento validado electrónicamente",
			    texto
			);
			nombreEmpresa.setAlignment(Element.ALIGN_CENTER);
			document.add(nombreEmpresa);
			
			// =====================
			// MENSAJE FINAL
			// =====================
			document.add(new Paragraph("\n"));
			Paragraph pie = new Paragraph(
					"Gracias por confiar en BARBERSHOP 💈\nTu imagen, nuestra pasión.\nLlegar 10 minutos antes de la hora reservada.",
					texto);
			pie.setAlignment(Element.ALIGN_CENTER);
			document.add(pie);

			document.close();

		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
