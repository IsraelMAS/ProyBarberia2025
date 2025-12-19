package Modelos;

public class Servicio {
	
    private int idServicio;
    private String nombre;
    private String tipo; // CORTE, BARBA, COMBO
    private double precio;
    private int duracionMinutos;
    
	public Servicio() {
		
	}
	public Servicio(String nombre, String tipo, double precio, int duracionMinutos) {
		
		this.nombre = nombre;
		this.tipo = tipo;
		this.precio = precio;
		this.duracionMinutos = duracionMinutos;
	}
	public int getIdServicio() {
		return idServicio;
	}
	public void setIdServicio(int idServicio) {
		this.idServicio = idServicio;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public int getDuracionMinutos() {
		return duracionMinutos;
	}
	public void setDuracionMinutos(int duracionMinutos) {
		this.duracionMinutos = duracionMinutos;
	}

    
	
}
