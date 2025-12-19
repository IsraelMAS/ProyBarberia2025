package Modelos;

public class Barbero {
	
	private int idBarbero;
    private String nombre;
    private boolean activo;
    
	public Barbero() {
		
	}
	public Barbero(String nombre, boolean activo) {
		
		this.nombre = nombre;
		this.activo = activo;
	}
	public int getIdBarbero() {
		return idBarbero;
	}
	public void setIdBarbero(int idBarbero) {
		this.idBarbero = idBarbero;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public boolean isActivo() {
		return activo;
	}
	public void setActivo(boolean activo) {
		this.activo = activo;
	}
    
    
}

