package hotel.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import hotel.dbconnection.DbConnection;
import hotel.model.VeichleBooking;

public class VeichleDao {

	private String jdbcURL = "jdbc:mysql://localhost/hotel?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";

	// Veichle Reservation
	private static final String INSERT_VeichleBook_SQL = "INSERT INTO veichlereservation"
			+ "  (	User,Nic,mobile,email,checkin,km,cost) VALUES " + " (?, ?, ?,?,?,?,?);";

	private static final String SELECT_BVeichleBook_BY_ID = "select id,User,Nic,mobile,email,checkin,km,cost from veichlereservation where id =?";
	private static final String SELECT_ALL_VeichleBook = "select * from veichlereservation";
	private static final String SELECT_ALL_VeichleBookbyuser = "select * from veichlereservation where User=?";

	private static final String DELETE_VeichleBook_SQL = "delete from veichlereservation where id = ?;";
	private static final String UPDATE_VeichleBook_SQL = "update veichlereservation set  User=?,Nic=?,mobile=?,email=?,checkin=?,km=?,cost=?  where id = ?;";

	public VeichleDao() {
	}

	DbConnection dbconnection = new DbConnection();

	// insert Veichle reservation
	public void insertVeichleBook(VeichleBooking vb) throws SQLException {
		System.out.println(INSERT_VeichleBook_SQL);
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_VeichleBook_SQL)) {
			preparedStatement.setString(1, vb.getUser());
			preparedStatement.setString(2, vb.getNic());

			preparedStatement.setInt(3, vb.getMobile());
			preparedStatement.setString(4, vb.getEmail());
			preparedStatement.setString(5, vb.getCheckin());
			preparedStatement.setInt(6, vb.getKm());
			preparedStatement.setInt(7, vb.getCost());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
	}

	// Update
	public boolean updateBook(VeichleBooking vb) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_VeichleBook_SQL);) {
			statement.setString(1, vb.getUser());
			statement.setString(2, vb.getNic());

			statement.setInt(3, vb.getMobile());
			statement.setString(4, vb.getEmail());
			statement.setString(5, vb.getCheckin());
			statement.setInt(6, vb.getKm());
			statement.setInt(7, vb.getCost());
			statement.setInt(8, vb.getId());
			System.out.println("Update "+statement);
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	// Delete book
	public boolean deleteBook(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_VeichleBook_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	// select All Bookings By User
	public List<VeichleBooking> selectAllVeichlebooks() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<VeichleBooking> vb = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_VeichleBook);) {

			System.out.println(preparedStatement);

			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String user = rs.getString("User");
				String nic = rs.getString("Nic");
				int mobile = rs.getInt("mobile");
				String mail = rs.getString("email");
				String checkin = rs.getString("checkin");
				int km = rs.getInt("km");
				int cost = rs.getInt("cost");

				vb.add(new VeichleBooking(id, user, nic, mobile, mail, checkin, km, cost));
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return vb;
	}

	// select All Bookings By User
	public List<VeichleBooking> selectAllBooksbyuser(String User) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<VeichleBooking> vb = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_VeichleBookbyuser);) {
			preparedStatement.setString(1, User);

			System.out.println(preparedStatement);

			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String user = rs.getString("User");
				String nic = rs.getString("Nic");
				int mobile = rs.getInt("mobile");
				String mail = rs.getString("email");
				String checkin = rs.getString("checkin");
				int km = rs.getInt("km");
				int cost = rs.getInt("cost");

				vb.add(new VeichleBooking(id, user, nic, mobile, mail, checkin, km, cost));
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return vb;
	}

	// select veichle Booking
	public VeichleBooking selectVeichlebook(int id) {
		VeichleBooking vb = null;
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BVeichleBook_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String user = rs.getString("User");
				String nic = rs.getString("Nic");
				int mobile = rs.getInt("mobile");
				String mail = rs.getString("email");
				String checkin = rs.getString("checkin");
				int km = rs.getInt("km");
				int cost = rs.getInt("cost");

				vb = new VeichleBooking(id,user, nic, mobile, mail, checkin, km, cost);
			}

		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return vb;
	}

}