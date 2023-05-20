package hotel.servlet.veichlebook;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.dao.VeichleDao;
import hotel.model.VeichleBooking;



@WebServlet("/insertveichleBook")
public class VeichleBookingAddServlet extends HttpServlet {
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
		String user = request.getParameter("user");
		String nic = request.getParameter("nic");
		int mobile = Integer.parseInt(request.getParameter("mobile"));
		String email = request.getParameter("email");
		String checkin = (request.getParameter("checkin"));
		int noofkm = Integer.parseInt(request.getParameter("noofkm"));
		int cost = Integer.parseInt(request.getParameter("cost"));
		
		
//		String action = "jjjj";
//		String user = "jjjj";;
//		String nic = "jjjj";;
//		int mobile = 8888;
//		String email = "jjjj";;
//		String checkin = "jjjj";
//		int noofkm = 8888;
//		int cost = 8888;
		
		
		
		VeichleBooking vb = new VeichleBooking( user, nic, mobile,email,checkin,noofkm,cost);
		System.out.println("ajsdvhasvdjghasdvjasvyasjyadjyasdjhadva");
		System.out.println(vb);
		try {
			VeichleDao.insertVeichleBook(vb);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("listveichleBook");
	
	}

	

}