package hotel.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import hotel.dbconnection.DbConnection;
import hotel.model.Transport;

public class TransportDao {

	// transport
	private static final String INSERT_TransportSQL = "INSERT INTO transport"
			+ " (v_name,facilities,costperday,veichletype,filename,path) VALUES " + " (?, ?, ?,?,?,?);";

	private static final String SELECT_TransportBY_ID = "select id,v_name,facilities,costperday,veichletype,filename,path from transport where id =?";
	private static final String SELECT_ALL_Transport = "select * from transport";
	private static final String DELETE_TransportSQL = "delete from transport where id = ?;";
	private static final String UPDATE_TransportSQL = "update transport set v_name = ? ,facilities= ?,costperday= ?,veichletype =? where id = ?;";

	public TransportDao() {
	}

	DbConnection dbconnection = new DbConnection();

	// insert Transport
	public void insertTransport(Transport tr) throws SQLException, FileNotFoundException {
		System.out.println(INSERT_TransportSQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TransportSQL)) {

			preparedStatement.setString(1, tr.getName());
			preparedStatement.setString(2, tr.getFacilities());

			preparedStatement.setInt(3, tr.getCost());
			preparedStatement.setString(4, tr.getType());

			preparedStatement.setString(5, tr.getFilename());
			preparedStatement.setString(6, tr.getPath());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
	}

	// select Transport
	public Transport selectTransport(int id) {
		Transport tr = null;
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TransportBY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String vname = rs.getString("v_name");
				String facilities = rs.getString("facilities");
				int cost = rs.getInt("costperday");
				String type = rs.getString("veichletype");

				tr = new Transport(id, vname, facilities, cost, type);
			}

		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return tr;
	}

	// select All Transport
	public List<Transport> selectAllTransport() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Transport> tr = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_Transport);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				System.out.println("id" + id);
				String name = rs.getString("v_name");
				System.out.println("v_name " + name);
				String facilities = rs.getString("facilities");
				System.out.println("facilities " + facilities);
				int cost = rs.getInt("costperday");
				System.out.println("costperday " + cost);
				String type = rs.getString("veichletype");
				System.out.println("type " + type);
				String filename = rs.getString("filename");
				System.out.println("filename " + filename);
				String path = rs.getString("path");
				System.out.println("path " + path);
				tr.add(new Transport(id, name, facilities, cost, type, filename, path));
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return tr;
	}

	// Delete TRansport
	public boolean deleteTransport(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_TransportSQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	// Update Transport
	public boolean updateTransport(Transport tr) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_TransportSQL);) {
			statement.setString(1, tr.getName());

			statement.setString(2, tr.getFacilities());

			statement.setInt(3, tr.getCost());

			statement.setString(4, tr.getType());

			statement.setInt(5, tr.getId());

			System.out.println("Update " + statement);
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

}