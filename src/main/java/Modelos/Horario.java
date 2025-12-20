package Modelos;

import java.sql.Time;

public class Horario {
	
	private int idHorario;
    private String turno;   // MAÑANA, TARDE, NOCHE
    private Time hora;      // 09:00, 10:00, 11:00...
    
	public Horario() {
		
		
	}
	public Horario(String turno, Time hora) {
		
		this.turno = turno;
		this.hora = hora;
	}
	public int getIdHorario() {
		return idHorario;
	}
	public void setIdHorario(int idHorario) {
		this.idHorario = idHorario;
	}
	public String getTurno() {
		return turno;
	}
	public void setTurno(String turno) {
		this.turno = turno;
	}
	public Time getHora() {
		return hora;
	}
	public void setHora(Time hora) {
		this.hora = hora;
	}
    
    
}
