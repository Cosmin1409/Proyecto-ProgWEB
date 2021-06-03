package beans;

import java.io.Serializable;

public class Mensaje implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String NombreTransmisor;
	private String NombreDestinatario;
	private String fecha;
	private String contenido;
	
	public String getNombreTransmisor() {
		return NombreTransmisor;
	}
	public void setNombreTransmisor(String nombreTransmisor) {
		this.NombreTransmisor = nombreTransmisor;
	}
	public String getNombreDestinatario() {
		return NombreDestinatario;
	}
	public void setNombreDestinatario(String nombreDestinatario) {
		this.NombreDestinatario = nombreDestinatario;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getContenido() {
		return contenido;
	}
	public void setContenido(String contenido) {
		this.contenido = contenido;
	}
	
	
}
