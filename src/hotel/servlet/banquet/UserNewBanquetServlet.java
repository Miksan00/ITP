package hotel.servlet.banquet;

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

import hotel.dao.BanquetDao;

import hotel.model.Banq;



@WebServlet("/newuserbanq")
public class UserNewBanquetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BanquetDao BanquetDao;
	
	public void init() {
		BanquetDao = new BanquetDao();
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
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("UserAddBanquet.jsp");
		
		request.setAttribute("user", loginuser);
		dispatcher.forward(request, response);
	}


}