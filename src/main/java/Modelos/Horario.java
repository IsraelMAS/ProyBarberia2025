package Modelos;



public class Horario {
	
	private int idHorario;
    private String turno;   // MAÑANA, TARDE, NOCHE
    private String hora;      // 09:00, 10:00, 11:00...
    private int orden;
    
	public Horario() {
		
		// TODO Auto-generated constructor stub
	}

	public Horario(String turno, String hora, int orden) {
		
		this.turno = turno;
		this.hora = hora;
		this.orden = orden;
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

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

	public int getOrden() {
		return orden;
	}

	public void setOrden(int orden) {
		this.orden = orden;
	}
	
    
	
    
}
