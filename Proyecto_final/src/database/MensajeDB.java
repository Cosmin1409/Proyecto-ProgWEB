package database;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Mensaje;
import beans.Usuario;

public class MensajeDB {
	
	public void mandarMensaje(Mensaje mensaje) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection connection = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/usuarios?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
			
			String INSERT_MESSAGE_SQL = "INSERT INTO mensaje" 
		            + "  (nombretransmisor, nombredestinatario, contenido) VALUES "
					+ " (?, ?, ?);";
			
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MESSAGE_SQL);
			
			preparedStatement.setString(1, mensaje.getNombreTransmisor());
			preparedStatement.setString(2, mensaje.getNombreDestinatario());
			preparedStatement.setString(3, mensaje.getContenido());
			
			preparedStatement.executeUpdate();
			
			connection.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Mensaje> mensajesMandados(Usuario usuario) {
		ArrayList<Mensaje> listaMensajes = new ArrayList<Mensaje>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection connection = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/usuarios?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
			
			String SELECT_MESSAGE_SQL = "SELECT contenido, fecha, nombredestinatario" 
		            + " FROM mensaje where nombretransmisor like ? ;";
				
			
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MESSAGE_SQL);
			
			preparedStatement.setString(1, usuario.getNombre());
			
			ResultSet rs =preparedStatement.executeQuery();
			
			while(rs.next()) {
				Mensaje mensaje = new Mensaje();
				mensaje.setContenido(rs.getString(1));
				mensaje.setFecha(rs.getString(2));
				mensaje.setNombreDestinatario(rs.getString(3));
				listaMensajes.add(mensaje);
			}
			connection.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listaMensajes;
	}
	
	public ArrayList<Mensaje> mensajesRecibidos(Usuario usuario){
		ArrayList<Mensaje> listaMensajes = new ArrayList<Mensaje>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection connection = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/usuarios?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
			
			String SELECT_MESSAGE_SQL = "SELECT contenido, fecha, nombretransmisor" 
		            + " FROM mensaje where nombredestinatario like ? ;";
				
			
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MESSAGE_SQL);
			
			preparedStatement.setString(1, usuario.getNombre());
			
			ResultSet rs =preparedStatement.executeQuery();
			
			while(rs.next()) {
				Mensaje mensaje = new Mensaje();
				mensaje.setContenido(rs.getString(1));
				mensaje.setFecha(rs.getString(2));
				mensaje.setNombreTransmisor(rs.getString(3));
				listaMensajes.add(mensaje);
			}
			connection.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listaMensajes;
		
	}
	
}
