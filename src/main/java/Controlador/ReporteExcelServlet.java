package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import ModeloDAO.CitaDAO;
import Modelos.Cita;

@WebServlet("/ReporteExcelServlet")
public class ReporteExcelServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType(
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        );
        response.setHeader(
            "Content-Disposition",
            "attachment; filename=REPORTE_CITAS_ADMIN.xlsx"
        );

        try (Workbook workbook = new XSSFWorkbook()) {

            Sheet sheet = workbook.createSheet("Citas");

            // ===== ESTILO HEADER =====
            CellStyle headerStyle = workbook.createCellStyle();
            Font headerFont = workbook.createFont();
            headerFont.setBold(true);
            headerStyle.setFont(headerFont);

            // ===== HEADER =====
            String[] columnas = {
                "Cliente", "Teléfono", "Barbero",
                "Servicio", "Precio", "Fecha", "Hora", "Estado"
            };

            Row header = sheet.createRow(0);
            for (int i = 0; i < columnas.length; i++) {
                Cell cell = header.createCell(i);
                cell.setCellValue(columnas[i]);
                cell.setCellStyle(headerStyle);
            }

            // ===== DATOS =====
            CitaDAO dao = new CitaDAO();
            List<Cita> lista = dao.listarTodas();

            int fila = 1;
            for (Cita c : lista) {
                Row row = sheet.createRow(fila++);

                row.createCell(0).setCellValue(c.getCliente().getNombre());
                row.createCell(1).setCellValue(c.getCliente().getTelefono());
                row.createCell(2).setCellValue(c.getBarbero().getNombre());
                row.createCell(3).setCellValue(c.getServicio().getNombre());
                row.createCell(4).setCellValue(c.getServicio().getPrecio());
                row.createCell(5).setCellValue(c.getFecha().toString());
                row.createCell(6).setCellValue(c.getHora().toString());
                row.createCell(7).setCellValue(c.getEstado());
            }

            // ===== TOTAL AUTOMÁTICO =====
            Row totalRow = sheet.createRow(fila);
            totalRow.createCell(3).setCellValue("TOTAL");

            Cell totalCell = totalRow.createCell(4);
            totalCell.setCellFormula("SUM(E2:E" + fila + ")");

            // Ajustar columnas
            for (int i = 0; i < columnas.length; i++) {
                sheet.autoSizeColumn(i);
            }

            workbook.write(response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
