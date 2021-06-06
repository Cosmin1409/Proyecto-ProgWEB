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
			Class.forName("com.mysql.cj.jdbc.Driver");
			
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
	
	public ArrayList<Mensaje> getChat(Usuario usuario1, Usuario usuario2){
		ArrayList<Mensaje> listaMensajes = new ArrayList<Mensaje>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection connection = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/usuarios?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
			
			String SELECT_MESSAGE_SQL = "select nombretransmisor, contenido, fecha \r\n"
					+ "from mensaje \r\n"
					+ "where nombretransmisor like ? and nombredestinatario like ? \r\n"
					+ "or nombretransmisor like ? and nombredestinatario like ? \r\n"
					+ "order by fecha;";
				
			
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MESSAGE_SQL);
			
			preparedStatement.setString(1, usuario1.getNombre());
			preparedStatement.setString(2, usuario2.getNombre());
			preparedStatement.setString(3, usuario2.getNombre());
			preparedStatement.setString(4, usuario1.getNombre());
			
			ResultSet rs =preparedStatement.executeQuery();
			
			while(rs.next()) {
				Mensaje mensaje = new Mensaje();
				mensaje.setNombreTransmisor(rs.getString(1));
				mensaje.setContenido(rs.getString(2));
				mensaje.setFecha(rs.getString(3));
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
