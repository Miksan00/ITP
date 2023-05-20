package hotel.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import hotel.dbconnection.DbConnection;
import hotel.model.Banq;


public class BanquetDao {
	DbConnection dbconnection  = new DbConnection();

	// Banquett Hall
	private static final String INSERT_Banquet_SQL = "INSERT INTO banquet"
			+ "  (guest,mobile,additional,decoration,Date) VALUES " + " (?, ?, ?,?,?);";

	private static final String SELECT_Banquet_BY_ID = "select id,guest,mobile,additional,decoration,Date from banquet where id =?";
	private static final String SELECT_ALL_Banquet = "select * from banquet";
	private static final String SELECT_ALL_Banquetbyuser = "select * from banquet where guest = ?";
	private static final String DELETE_Banquet_SQL = "delete from banquet where id = ?;";
	private static final String UPDATE_BAnquet_SQL = "update banquet set  guest=?,mobile=?,additional=?,decoration=?,Date=? where id = ?;";

	public BanquetDao() {
	}

	// Delete Banquet
	public boolean deleteBanq(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_Banquet_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	// insert Banquet
	public void insertBanquet(Banq ba) throws SQLException {
		System.out.println(INSERT_Banquet_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_Banquet_SQL)) {
			preparedStatement.setString(1, ba.getGuest());
			preparedStatement.setInt(2, ba.getMobile());
			preparedStatement.setString(3, ba.getAdditional());
			preparedStatement.setString(4, ba.getDecoration());
			preparedStatement.setString(5, ba.getDate());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
	}

	// select Banquet
	public Banq selectBanquet(int id) {
		Banq bt = null;
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_Banquet_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String guest = rs.getString("guest");

				int mobile = rs.getInt("mobile");
				String additional = rs.getString("additional");
				String decoration = rs.getString("decoration");
				String date = rs.getString("date");

				bt = new Banq(id, guest, mobile, additional, decoration, date);
			}

		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return bt;
	}
	// select All Banquets user
	public List<Banq> selectAllBanquetsbyuser(String User) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Banq> bt = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_Banquetbyuser);) {
			preparedStatement.setString(1, User);
			
			System.out.println(preparedStatement);
			
		
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String guest = rs.getString("guest");
				int mobile = rs.getInt("mobile");
				String additional = rs.getString("additional");
				String decoration = rs.getString("decoration");
				String date = rs.getString("Date");

				bt.add(new Banq(id, guest, mobile, additional, decoration, date));
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return bt;
	}
	// select All Banquets
	public List<Banq> selectAllBanquets() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Banq> bt = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_Banquet);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String guest = rs.getString("guest");
				int mobile = rs.getInt("mobile");
				String additional = rs.getString("additional");
				String decoration = rs.getString("decoration");
				String date = rs.getString("Date");

				bt.add(new Banq(id, guest, mobile, additional, decoration, date));
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return bt;
	}

	// Update Banquet
	public boolean updateBanquet(Banq ba) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BAnquet_SQL);) {
			
			preparedStatement.setString(1, ba.getGuest());
			preparedStatement.setInt(2, ba.getMobile());
			preparedStatement.setString(3, ba.getAdditional());
			preparedStatement.setString(4, ba.getDecoration());
			preparedStatement.setString(5, ba.getDate());
			preparedStatement.setInt(6, ba.getId());

			rowUpdated = preparedStatement.executeUpdate() > 0;
			System.out.println("Update"+preparedStatement);
		}
		return rowUpdated;
	}
}