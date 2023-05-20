package hotel.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import hotel.dbconnection.DbConnection;

import hotel.model.Restaurant;


public class FoodDao {

	// Food Reservation
	private static final String INSERT_Food_SQL = "INSERT INTO restaurant" + "  (user,juice,main,dessert) VALUES "
			+ " (?, ?, ?,?);";

	private static final String SELECT_Food_BY_ID = "select id,user,juice,main,dessert from restaurant where id =?";
	private static final String SELECT_ALL_Food = "select * from restaurant";
	private static final String SELECT_ALL_Foodbyuser = "select * from restaurant where user= ?";
	private static final String DELETE_Food_SQL = "delete from restaurant where id = ?;";
	private static final String UPDATE_Food_SQL = "update restaurant set  user = ?,juice = ?,main = ?,dessert = ?  where id = ?;";

	public FoodDao() {
	}

	DbConnection dbconnection = new DbConnection();

	// insert Restaurant
	public void insertRestaurant(Restaurant fd) throws SQLException {
		System.out.println(INSERT_Food_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_Food_SQL)) {
			preparedStatement.setString(1, fd.getUser());

			preparedStatement.setString(2, fd.getJuice());
			preparedStatement.setString(3, fd.getMain());
			preparedStatement.setString(4, fd.getDessert());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
	}

	// select Restaurant
	public Restaurant selectRestaurant(int id) {
		Restaurant fd = null;
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_Food_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String user = rs.getString("user");
				String juice = rs.getString("juice");
				String main = rs.getString("main");
				String dessert = rs.getString("dessert");

				fd = new Restaurant(id,user, juice, main, dessert);
			}

		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return fd;
	}
	// select All Restaurants By User
	public List<Restaurant> selectAllRestaurantsbyuser(String User) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Restaurant> fd = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_Foodbyuser);) {
			preparedStatement.setString(1, User);
			
			System.out.println(preparedStatement);
			
			
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String user = rs.getString("user");
				String juice = rs.getString("juice");
				String main = rs.getString("main");
				String dessert = rs.getString("dessert");

				fd.add(new Restaurant(id, user, juice, main, dessert));
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return fd;
	}
	// select All Restaurants
	public List<Restaurant> selectAllRestaurants() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Restaurant> fd = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_Food);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String user = rs.getString("user");
				String juice = rs.getString("juice");
				String main = rs.getString("main");
				String dessert = rs.getString("dessert");

				fd.add(new Restaurant(id, user, juice, main, dessert));
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return fd;
	}

	// Delete Restaurant
	public boolean deleteRestaurant(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_Food_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	// Update Restaurant
	public boolean updateRestaurant(Restaurant fd) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_Food_SQL);) {
			
			statement.setString(1, fd.getUser());
			statement.setString(2, fd.getJuice());
			statement.setString(3, fd.getMain());
			statement.setString(4, fd.getDessert());
			statement.setInt(5, fd.getId());

			rowUpdated = statement.executeUpdate() > 0;
			System.out.println("Update"+statement);
		}
		return rowUpdated;
	}

}