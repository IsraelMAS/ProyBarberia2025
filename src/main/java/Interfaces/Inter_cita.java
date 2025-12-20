	package Interfaces;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import Modelos.Cita;

public interface Inter_cita {
	
	public boolean insertar(Cita c);

	public List<Cita> listarPorBarbero(int idBarbero);

	public boolean existeCita(int idBarbero, Date fecha, Time hora);
	
}
