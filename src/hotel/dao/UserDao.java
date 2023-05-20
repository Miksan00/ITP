package hotel.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hotel.dbconnection.DbConnection;
import hotel.model.User;



public class UserDao {

	static final String INSERT_user_SQL = "INSERT INTO user"
			+ "  (fullname,username,mobile,address,mail,password) VALUES " + " (?, ?, ?,?,?,?);";

	private static final String SELECT_User_BY_ID = "select id,fullname,username,mobile,address,mail,password from user where id =?";
	private static final String SELECT_ALL_users = "select * from user";
	private static final String DELETE_User_SQL = "delete from user where id = ?;";
	private static final String UPDATE_User_SQL = "update user set fullname = ?,username = ?,mobile = ?,address = ?,mail = ?,password=? where id = ?;";

	public UserDao() {
	}

	DbConnection dbconnection = new DbConnection();

	public boolean validate(User user) throws ClassNotFoundException {
		boolean status = false;

		// try-with-resource statement will auto close the connection.
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from user where username = ? and password = ? ")) {
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return status;
	}

	public void insertUser(User user) throws SQLException {
		System.out.println(INSERT_user_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_user_SQL)) {
			preparedStatement.setString(1, user.getFullname());
			preparedStatement.setString(2, user.getUsername());
			preparedStatement.setInt(3, user.getMobile());
			preparedStatement.setString(4, user.getAddress());
			preparedStatement.setString(5, user.getMail());
			preparedStatement.setString(6, user.getPassword());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
	}

	public User selectUser(int id) {
		User user = null;
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_User_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String fullname = rs.getString("fullname");
				String username = rs.getString("username");
				int mobile = rs.getInt("mobile");
				String address = rs.getString("address");
				String mail = rs.getString("mail");
				String password = rs.getString("password");
				;
				user = new User(id, fullname, username, mobile, address, mail, password);
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return user;
	}

	public List<User> selectAllUsers() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<User> user = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_users);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String fullname = rs.getString("fullname");
				String username = rs.getString("username");
				int mobile = rs.getInt("mobile");
				String address = rs.getString("address");
				String mail = rs.getString("mail");
				String password = rs.getString("password");
				user.add(new User(id, fullname, username, mobile, address, mail, password));
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return user;
	}

	public boolean deleteUser(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_User_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateUser(User user) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_User_SQL);) {

			statement.setString(1, user.getFullname());
			statement.setString(2, user.getUsername());
			statement.setInt(3, user.getMobile());
			statement.setString(4, user.getAddress());
			statement.setString(5, user.getMail());
			statement.setString(6, user.getPassword());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

}
