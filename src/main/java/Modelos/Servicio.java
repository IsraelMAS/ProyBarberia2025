package Modelos;

public class Servicio {
	

	private int id;
    private String nombre;
    private String descripcion;
    private int duracionMin;
    private String incluye;
    private double precio;
    private String imagen;
    private String alt;
    private int orden;

    
    
	public Servicio() {
			
	}


	public Servicio(String nombre, String descripcion, int duracionMin, String incluye, double precio, String imagen,
			String alt, int orden) {
		
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.duracionMin = duracionMin;
		this.incluye = incluye;
		this.precio = precio;
		this.imagen = imagen;
		this.alt = alt;
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


	public int getDuracionMin() {
		return duracionMin;
	}


	public void setDuracionMin(int duracionMin) {
		this.duracionMin = duracionMin;
	}


	public String getIncluye() {
		return incluye;
	}


	public void setIncluye(String incluye) {
		this.incluye = incluye;
	}


	public double getPrecio() {
		return precio;
	}


	public void setPrecio(double precio) {
		this.precio = precio;
	}


	public String getImagen() {
		return imagen;
	}


	public void setImagen(String imagen) {
		this.imagen = imagen;
	}


	public String getAlt() {
		return alt;
	}


	public void setAlt(String alt) {
		this.alt = alt;
	}


	public int getOrden() {
		return orden;
	}


	public void setOrden(int orden) {
		this.orden = orden;
	}
	
	

	
	

    
	
    
	
}
