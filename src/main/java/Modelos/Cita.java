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
    
    
    
}
