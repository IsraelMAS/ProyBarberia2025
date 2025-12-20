package Modelos;

import java.sql.Date;
import java.sql.Time;

public class Cita {
	private int idCita;
    private Cliente cliente;
    private Barbero barbero;
    private Servicio servicio;
    private Date fecha;
    private Time hora;
    private String instrucciones;
    private String estado; // RESERVADA, CANCELADA
    
    
	public Cita() {
		
		// TODO Auto-generated constructor stub
	}
	public Cita(Cliente cliente, Barbero barbero, Servicio servicio, Date fecha, Time hora, String instrucciones,
			String estado) {
	
		this.cliente = cliente;
		this.barbero = barbero;
		this.servicio = servicio;
		this.fecha = fecha;
		this.hora = hora;
		this.instrucciones = instrucciones;
		this.estado = estado;
	}
	public int getIdCita() {
		return idCita;
	}
	public void setIdCita(int idCita) {
		this.idCita = idCita;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Barbero getBarbero() {
		return barbero;
	}
	public void setBarbero(Barbero barbero) {
		this.barbero = barbero;
	}
	public Servicio getServicio() {
		return servicio;
	}
	public void setServicio(Servicio servicio) {
		this.servicio = servicio;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public Time getHora() {
		return hora;
	}
	public void setHora(Time hora) {
		this.hora = hora;
	}
	public String getInstrucciones() {
		return instrucciones;
	}
	public void setInstrucciones(String instrucciones) {
		this.instrucciones = instrucciones;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
    
    
    
}
