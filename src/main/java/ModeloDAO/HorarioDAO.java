package ModeloDAO;

import java.util.ArrayList;
import java.util.List;

import Interfaces.Inter_horario;
import Modelos.Horario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Config.Conexion;

public class HorarioDAO implements Inter_horario{

	Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

	
	@Override
	public List<Horario> listar() {
		ArrayList<Horario> list = new ArrayList<>();
        String sql = "SELECT * FROM horario ORDER BY orden ASC";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Horario h = new Horario();
                h.setIdHorario(rs.getInt("id"));
                h.setTurno(rs.getString("turno"));
                h.setHora(rs.getString("hora"));	
                list.add(h);
            }

        } catch (Exception e) {
            System.err.println("Error listar horarios: " + e.getMessage());
        }
        return list;
	}

	@Override
	public List<Horario> listarPorTurno(String turno) {
		ArrayList<Horario> list = new ArrayList<>();
        /*String sql = "SELECT * FROM horario WHERE turno='" + turno + "' ORDER BY hora";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Horario h = new Horario();
                h.setIdHorario(rs.getInt("id_horario"));
                h.setTurno(rs.getString("turno"));
                h.setHora(rs.getTime("hora"));
                list.add(h);
            }

        } catch (Exception e) {
            System.err.println("Error listar horario por turno: " + e.getMessage());
        }*/
        return list;
	}

}
