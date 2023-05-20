package hotel.servlet.user;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import hotel.dao.UserDao;
import hotel.model.User;



@WebServlet("/usrupdate")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao UserDao;
	
	public void init() {
		UserDao = new UserDao();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		int mobile = Integer.parseInt( request.getParameter("mobile"));
		String address = request.getParameter("address");
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");
		
	User usr = new User( id,fullname,username,mobile,address,mail,password);

	try {
		UserDao.updateUser(usr);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		response.sendRedirect("userlist");

	
	}

}