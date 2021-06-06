package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Mensaje;
import beans.Usuario;

public class UsuarioDB {

	public void registrarUsuario(Usuario usuario){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/usuarios?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
			
			String INSERT_USER_SQL = "INSERT INTO usuario" 
		            + "  (nombre, contrasena) VALUES "
					+ " (?, ?);";
			
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL);
			
			preparedStatement.setString(1, usuario.getNombre());
			preparedStatement.setString(2, usuario.getContrasena());
			
			preparedStatement.executeUpdate();
			
			connection.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean loginUsuario(Usuario usuario) {
		boolean res=false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/usuarios?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
			
			String VALIDATE_USER_SQL = "SELECT * "
					+ "FROM usuario "
					+ "WHERE nombre like ? and contrasena like ? ; ";
			PreparedStatement preparedStatement = connection.prepareStatement(VALIDATE_USER_SQL);
			
			preparedStatement.setString(1, usuario.getNombre());
			preparedStatement.setString(2, usuario.getContrasena());
			
			ResultSet rs=preparedStatement.executeQuery();
			
			if(rs.next()) {
				res= true;
			}
			else {
				res= false;
			}
			
			connection.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
		
	}
	
	public boolean existeUsuario(String usuario) {
		boolean res=false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/usuarios?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
			
			String VALIDATE_USER_SQL = "SELECT nombre "
					+ "FROM usuario "
					+ "WHERE nombre like ? ; ";
			PreparedStatement preparedStatement = connection.prepareStatement(VALIDATE_USER_SQL);
			
			preparedStatement.setString(1, usuario);
			
			ResultSet rs=preparedStatement.executeQuery();
			
			if(rs.next()) {
				res= true;
			}
			else {
				res= false;
			}
			
			connection.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public ArrayList<String> verChats(Usuario usuario){
		ArrayList<String> listaChats = new ArrayList<String>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection connection = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/usuarios?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
			
			String SELECT_USERS_SQL = "SELECT nombretransmisor from mensaje \r\n"
					+ "where nombretransmisor not like ? and nombredestinatario like ? \r\n"
					+ "group by nombretransmisor, nombredestinatario\r\n"
					+ "UNION\r\n"
					+ "SELECT nombredestinatario from mensaje \r\n"
					+ "where nombredestinatario not like ? and nombretransmisor like ? \r\n"
					+ "group by nombretransmisor, nombredestinatario;";
				
			
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_SQL);
			
			preparedStatement.setString(1, usuario.getNombre());
			preparedStatement.setString(2, usuario.getNombre());
			preparedStatement.setString(3, usuario.getNombre());
			preparedStatement.setString(4, usuario.getNombre());
			
			ResultSet rs =preparedStatement.executeQuery();
			
			while(rs.next()) {
				listaChats.add(rs.getString(1));
			}
			connection.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listaChats;
	}

}
