package hotel.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import hotel.dbconnection.DbConnection;

import hotel.model.Inventory;

public class InventoryDao {

	

	// inventory
	private static final String INSERT_USERS_SQL = "INSERT INTO inventory"
			+ "  (inventoryname,suppliername,supllierid,supplierdate,quantity,price,filename,path,total) VALUES " + " (?, ?, ?,?,?,?,?,?,?);";

	private static final String SELECT_USER_BY_ID = "select id,inventoryname,suppliername,supllierid,supplierdate,quantity,price,total from inventory where id =?";
	private static final String SELECT_ALL_USERS = "select * from inventory";
	private static final String DELETE_USERS_SQL = "delete from inventory where id = ?;";
	private static final String UPDATE_USERS_SQL = "update inventory set  inventoryname = ?,suppliername = ?,supllierid = ?,supplierdate = ?,quantity = ?,price=?,total =? where id = ?;";

	public InventoryDao() {
	}
	DbConnection dbconnection = new DbConnection();
	

//insert inventory
	public void insertUser(Inventory user) throws SQLException {
		System.out.println(INSERT_USERS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getInventoryname());
			preparedStatement.setString(2, user.getSuppliername());
			preparedStatement.setString(4, user.getSupplierdate());
			preparedStatement.setInt(3, user.getSupllierid());
			preparedStatement.setInt(5, user.getQuantity());
			preparedStatement.setInt(6, user.getPrice());
			preparedStatement.setString(7, user.getFilename());
			preparedStatement.setString(8, user.getPath());
			preparedStatement.setInt(9, user.getTotal());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
	}

//select inventory item
	public Inventory selectUser(int id) {
		Inventory user = null;
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String inventoryname = rs.getString("inventoryname");
				String suppliername = rs.getString("suppliername");
				int supllierid = rs.getInt("supllierid");
				String supplierdate = rs.getString("supplierdate");
				int quantity = rs.getInt("quantity");
				int price = rs.getInt("price");
				int total = rs.getInt("total");
				user = new Inventory(id, inventoryname, suppliername, supllierid, supplierdate, quantity, price,total);
			}

		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return user;
	}

	//

	// select All Inventory items
	public List<Inventory> selectAllUsers() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Inventory> users = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String inventoryname = rs.getString("inventoryname");
				String suppliername = rs.getString("suppliername");
				int supllierid = rs.getInt("supllierid");
				String supplierdate = rs.getString("supplierdate");
				int quantity = rs.getInt("quantity");
				int price = rs.getInt("price");
				String filename = rs.getString("filename");
				String path = rs.getString("path");
				int total = rs.getInt("total");
				users.add(new Inventory(id, inventoryname, suppliername, supllierid, supplierdate, quantity, price,filename,path,total));
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return users;
	}

//Delete inventory
	public boolean deleteUser(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	

	// Update inventory
	public boolean updateUser(Inventory user) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
			statement.setString(1, user.getInventoryname());
			statement.setString(2, user.getSuppliername());
			statement.setString(4, user.getSupplierdate());
			statement.setInt(3, user.getSupllierid());
			statement.setInt(5, user.getQuantity());
			statement.setInt(6, user.getPrice());
			statement.setInt(7, user.getTotal());
			statement.setInt(8, user.getId());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}





}