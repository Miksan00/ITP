package hotel.servlet.veichlebook;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import hotel.dao.VeichleDao;





@WebServlet("/newUserveichleBook")
public class UserAddVeichleBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VeichleDao VeichleDao;

	public void init() {
		VeichleDao = new VeichleDao();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		Cookie c1[] = request.getCookies();

		System.out.println("Cookies get for Veichle Booking ");
		System.out.println(c1[0].getValue());
		String loginuser = c1[0].getValue();
		System.out.println("Request");
		RequestDispatcher dispatcher = request.getRequestDispatcher("AddBookVeichleUser.jsp");
		request.setAttribute("user", loginuser);
		
		dispatcher.forward(request, response);
	}

	
}