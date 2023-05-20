package hotel.servlet.veichlebook;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import hotel.dao.VeichleDao;
import hotel.model.VeichleBooking;



@WebServlet("/listVeichleRoomBook")
public class UserVeichleBookingListServlet extends HttpServlet {
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
		
		
	Cookie c1[] = request.getCookies();
		
		System.out.println("Cookies get");
		System.out.println(c1[0].getValue());
		String loginuser=c1[0].getValue();
		System.out.println("Request");	
		
		String action = request.getServletPath();
		List<VeichleBooking> listBooking = VeichleDao.selectAllBooksbyuser(loginuser);
		//System.out.print(listUser);
		request.setAttribute("listBooking", listBooking);
		RequestDispatcher dispatcher = request.getRequestDispatcher("UserVeichleBookList.jsp");
		dispatcher.forward(request, response);
		
	}

	

}