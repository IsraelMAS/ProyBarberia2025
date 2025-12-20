package ModeloDAO;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import Interfaces.Inter_cita;
import Modelos.Cita;
import Modelos.Servicio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Config.Conexion;


public class CitaDAO implements Inter_cita{

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

	@Override
	public boolean insertar(Cita c) {
		String sql = "INSERT INTO cita (id_cliente, id_barbero, id_servicio, fecha, hora, instrucciones) "
                + "VALUES (" + c.getCliente().getIdCliente() + ", "
                + c.getBarbero().getIdBarbero() + ", "
                + c.getServicio().getIdServicio() + ", '"
                + c.getFecha() + "', '"
                + c.getHora() + "', '"
                + c.getInstrucciones() + "')";

     try {
         con = cn.getConnection();
         ps = con.prepareStatement(sql);
         ps.execute();
         return true;

     } catch (Exception e) {
         System.err.println("Error insertar cita: " + e.getMessage());
     }
     return false;
	}

	@Override
	public List<Cita> listarPorBarbero(int idBarbero) {
		ArrayList<Cita> list = new ArrayList<>();

        String sql = "SELECT c.id_cita, c.fecha, c.hora, s.nombre AS servicio "
                   + "FROM cita c "
                   + "INNER JOIN servicio s ON c.id_servicio = s.id_servicio "
                   + "WHERE c.id_barbero=" + idBarbero
                   + " AND c.estado='RESERVADA'"
                   + " ORDER BY c.fecha, c.hora";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                Cita cita = new Cita();
                Servicio serv = new Servicio();

                cita.setIdCita(rs.getInt("id_cita"));
                cita.setFecha(rs.getDate("fecha"));
                cita.setHora(rs.getTime("hora"));

                serv.setNombre(rs.getString("servicio"));
                cita.setServicio(serv);

                list.add(cita);
            }

        } catch (Exception e) {
            System.err.println("Error listar citas por barbero: " + e.getMessage());
        }
        return list;
	}

	@Override
	public boolean existeCita(int idBarbero, Date fecha, Time hora) {
		String sql = "SELECT * FROM cita "
                + "WHERE id_barbero=" + idBarbero
                + " AND fecha='" + fecha + "'"
                + " AND hora='" + hora + "'"
                + " AND estado='RESERVADA'";

     try {
         con = cn.getConnection();
         ps = con.prepareStatement(sql);
         rs = ps.executeQuery();

         if (rs.next()) {
             return true; // ya existe cita
         }

     } catch (Exception e) {
         System.err.println("Error validar cita: " + e.getMessage());
     }
     return false;
	}

}
