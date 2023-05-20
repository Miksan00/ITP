package hotel.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import hotel.dbconnection.DbConnection;
import hotel.model.RoomBooking;

public class RoomsBookingDao {


	// roombooking
	private static final String INSERT_rmbooking_SQL = "INSERT INTO roomsbooking"
			+ " ( 	User,Nic,mobile,email,checkin,checkout,noofrooms,members,AdvancedPayment) VALUES "
			+ " (?, ?, ?,?,?,?, ?, ?,?);";
	private static final String SELECT_ALL_BookingbyUser = "select * from roomsbooking where User=? ";
	private static final String SELECT_rmbooking_BY_ID = "select 	id,User,Nic,mobile,email,checkin,checkout,noofrooms,members,AdvancedPayment from roomsbooking where id =?";
	private static final String SELECT_ALL_ermbooking = "select * from roomsbooking";
	private static final String DELETE_rmbooking_SQL = "delete from roomsbooking where id = ?;";
	private static final String UPDATE_rmbooking_SQL = "update roomsbooking set   User= ?,Nic= ?,mobile= ?,email= ?,checkin= ?,checkout= ?,noofrooms= ?,members= ?,AdvancedPayment= ? where id = ?;";

	public RoomsBookingDao() {
	}

	DbConnection dbconnection = new DbConnection();

	// insert RoomsBoking
	public void insertRoomsBook(RoomBooking rmbook) throws SQLException {
		System.out.println(INSERT_rmbooking_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_rmbooking_SQL)) {
			preparedStatement.setString(1, rmbook.getUser());
			preparedStatement.setString(2, rmbook.getNic());
			preparedStatement.setInt(3, rmbook.getMobile());
			preparedStatement.setString(4, rmbook.getEmail());
			preparedStatement.setString(5, rmbook.getCheckin());
			preparedStatement.setString(6, rmbook.getCheckout());
			preparedStatement.setInt(7, rmbook.getNoofrooms());
			preparedStatement.setInt(8, rmbook.getMembers());
			preparedStatement.setInt(9, rmbook.getAdvancedPayment());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
	}

	// select RoomBooking
	public RoomBooking selectRoomBooking(int id) {
		RoomBooking rmbook = null;
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_rmbooking_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String user = rs.getString("User");
				String nic = rs.getString("Nic");
				int mobile = rs.getInt("mobile");
				String email = rs.getString("email");
				String checkin = rs.getString("checkin");
				String checkout = rs.getString("checkout");
				int noofrooms = rs.getInt("noofrooms");
				int members = rs.getInt("members");
				int advancedPayment = rs.getInt("AdvancedPayment");

				rmbook = new RoomBooking(id,user, nic, mobile, email, checkin, checkout, noofrooms, members,
						advancedPayment);
			}

		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return rmbook;
	}
	// select All RoomBokings
	public List<RoomBooking> selectAllRoomBookingsByUser(String User) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<RoomBooking> rmbook = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();
				
				// Step 2:Create a statement using connection object
				
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BookingbyUser);) {
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
				String email = rs.getString("email");
				String checkin = rs.getString("checkin");
				String checkout = rs.getString("checkout");
				int noofrooms = rs.getInt("noofrooms");
				int members = rs.getInt("members");
				int advancedPayment = rs.getInt("AdvancedPayment");
				rmbook.add(new RoomBooking(id, user, nic, mobile, email, checkin, checkout, noofrooms, members,
						advancedPayment));
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return rmbook;
	}
	// select All RoomBokings
	public List<RoomBooking> selectAllRoomBookings() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<RoomBooking> rmbook = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ermbooking);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String user = rs.getString("User");
				String nic = rs.getString("Nic");
				int mobile = rs.getInt("mobile");
				String email = rs.getString("email");
				String checkin = rs.getString("checkin");
				String checkout = rs.getString("checkout");
				int noofrooms = rs.getInt("noofrooms");
				int members = rs.getInt("members");
				int advancedPayment = rs.getInt("AdvancedPayment");
				rmbook.add(new RoomBooking(id, user, nic, mobile, email, checkin, checkout, noofrooms, members,
						advancedPayment));
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return rmbook;
	}

	// Delete roomsBook
	public boolean deleteRoomsBook(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_rmbooking_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	// Update RoomBooking
	public boolean updateRoombooking(RoomBooking rmbook) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_rmbooking_SQL);) {
			statement.setString(1, rmbook.getUser());
			statement.setString(2, rmbook.getNic());
			statement.setInt(3, rmbook.getMobile());
			statement.setString(4, rmbook.getEmail());

			statement.setString(5, rmbook.getCheckin());
			statement.setString(6, rmbook.getCheckout());
			statement.setInt(7, rmbook.getNoofrooms());
			
			statement.setInt(8, rmbook.getMembers());
			statement.setInt(9, rmbook.getAdvancedPayment());

			statement.setInt(10, rmbook.getId());
			System.out.println(".............................");
		
			System.out.println("Updating Id this "+ rmbook.getAdvancedPayment());
			System.out.println("Updating Id this "+ rmbook.getId());
System.out.println("Update "+statement);
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	

}