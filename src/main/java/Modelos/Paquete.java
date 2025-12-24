package Modelos;

public class Paquete {

	private int id;
    private String nombre;
    private String descripcion;
    private String detalles; 
    private double precio;
    private int orden;
	public Paquete() {

		// TODO Auto-generated constructor stub
	}
	public Paquete(String nombre, String descripcion, String detalles, double precio, int orden) {

		this.nombre = nombre;
		this.descripcion = descripcion;
		this.detalles = detalles;
		this.precio = precio;
		this.orden = orden;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getDetalles() {
		return detalles;
	}
	public void setDetalles(String detalles) {
		this.detalles = detalles;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public int getOrden() {
		return orden;
	}
	public void setOrden(int orden) {
		this.orden = orden;
	}
    
    
}
