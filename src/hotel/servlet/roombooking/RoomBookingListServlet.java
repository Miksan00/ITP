package hotel.servlet.roombooking;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.dao.RoomsBookingDao;


import hotel.model.RoomBooking;



@WebServlet("/listRoomBook")
public class RoomBookingListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RoomsBookingDao RoomsBookingDao;
	
	public void init() {
		RoomsBookingDao = new RoomsBookingDao();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		List<RoomBooking> listRoomBooking = RoomsBookingDao.selectAllRoomBookings();
		//System.out.print(listUser);
		request.setAttribute("listRoomBooking", listRoomBooking);
		RequestDispatcher dispatcher = request.getRequestDispatcher("RoomBookingList.jsp");
		dispatcher.forward(request, response);
		
	}

	

}