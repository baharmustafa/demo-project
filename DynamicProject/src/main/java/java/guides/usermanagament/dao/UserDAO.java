package java.guides.usermanagament.dao;

import java.guides.usermanagament.model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// provides CRUD database operations for the table users in the db
public class UserDAO {
private String jdbcURL = "jdbc:h2:~/webDB";
private String jdbcUsername = "sa";
private String jdbcPassword = "";
	
	private static final String INSERT_USERS_SQL = "INSERT INTO users" + " (name, email, country) VALUES "	+ "(?, ?, ?);";
	
	private static final String SELECT_USER_BY_ID = "select id, name, email, country from users where id = ?";
	private static final String SELECT_ALL_USERS = "select * from users";
	private static final String DELETE_USERS_SQL = "delete from users where id = ?";
	private static final String UPDATE_USERS_SQL = "update users set name= ?, email= ?, country =? users where id = ?";
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("org.h2.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	
	// create or insert user
	
	public void insertUser(User user) throws SQLException{
		try(Connection connection = getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(INSERT_USERS_SQL)){
		prepareStatement.setString(0, user.getName());
		prepareStatement.setString(0, user.getEmail());
		prepareStatement.setString(0, user.getCountry());
		prepareStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// update user
	
	public boolean updateUser(User user) throws SQLException{
		boolean rowUpdated;
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);){
			statement.setString(1, user.getName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getCountry());
			statement.setInt(4, user.getId());
			
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	// select user by id
	
	public User selectUser(int id) throws SQLException {
		User user = null;
		
		//step 1: estabilishing a connection
		try(Connection connection = getConnection();
				//step 2: create a statement using connection subject
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);){
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			
			//step 3: execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();
			
			//step4: process the result set object
			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				user = new User (id, name, email, country);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	// select user
		public List <User> selectAllUser() {
			List <User> users = new ArrayList<>();
			
			//step 1: estabilishing a connection
			try(Connection connection = getConnection();
					//step 2: create a statement using connection subject
					PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);){
				System.out.println(preparedStatement);
				
				//step 3: execute the query or update query
				ResultSet rs = preparedStatement.executeQuery();
				
				//step4: process the result set object
				while (rs.next()) {
					int id = rs.getInt("id");
					String name = rs.getString("name");
					String email = rs.getString("email");
					String country = rs.getString("country");
					users.add(new User(id, name, email, country));
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return users;
		}
	// delete user
	public boolean deleteUser (int id) throws SQLException{
		boolean rowDeleted;
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);){
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
}
