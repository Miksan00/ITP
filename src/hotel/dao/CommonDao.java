package hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hotel.dbconnection.DbConnection;
import hotel.model.Admin;


public class CommonDao {

	public CommonDao() {
	
	}
	
	DbConnection dbconnect = new DbConnection();

	public boolean validate(Admin admin) throws ClassNotFoundException {
		boolean status = false;

		// try-with-resource statement will auto close the connection.
		try (Connection connection = dbconnect.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from admin where username = ? and password = ? ")) {
			preparedStatement.setString(1, admin.getUsername());
			preparedStatement.setString(2, admin.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			dbconnect.printSQLException(e);
		}
		return status;
	}
}
