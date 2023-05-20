//package hotel.servlet.roombooking;
//
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.List;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import hotel.dao.UserDAO;
//import hotel.model.Employee;
//import hotel.model.RoomBooking;
//import hotel.model.Inventory;
//
//
//
//@WebServlet("/b")
//public class RoomBookingServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	private UserDAO userDAO;
//	
//	public void init() {
//		userDAO = new UserDAO();
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		doGet(request, response);
//	}
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String action = request.getServletPath();
//
//		try {
//			switch (action) {
//			case "/":
//				showNewForm(request, response);
//				break;
//			case "/insertRoomBook":
//				insertUser(request, response);
//				break;
//			case "/deleteRoomBook":
//				deleteUser(request, response);
//				break;
//			case "/editRoomBook":
//				showEditForm(request, response);
//				break;
//			case "/updateRoomBook":
//				updateUser(request, response);
//				break;
//			case "/listRoomBook":
//				listUser(request, response);
//				break;
//			}
//    			
//		} catch (SQLException ex) {
//			throw new ServletException(ex);
//		}
//	}
//
//	private void listUser(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, IOException, ServletException {
//		List<RoomBooking> listRoomBooking = userDAO.selectAllRoomBookings();
//		//System.out.print(listUser);
//		request.setAttribute("listRoomBooking", listRoomBooking);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("RoomBookingList.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		RequestDispatcher dispatcher = request.getRequestDispatcher("NewRoomBook.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, ServletException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		RoomBooking existingUser = userDAO.selectRoomBooking(id);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("NewRoomBook.jsp");
//		request.setAttribute("user", existingUser);
//		dispatcher.forward(request, response);
//
//	}
//
//	private void insertUser(HttpServletRequest request, HttpServletResponse response) 
//			throws SQLException, IOException {
//		String user = request.getParameter("user");
//		String nic = request.getParameter("nic");
//		int mobile = Integer.parseInt(request.getParameter("mobile"));
//		String email = request.getParameter("email");
//		String checkin = (request.getParameter("checkin"));
//		String checkout = (request.getParameter("checkout"));
//		int noofrooms = Integer.parseInt(request.getParameter("noofrooms"));
//		int members = Integer.parseInt(request.getParameter("members"));
//		int advancedPayment = Integer.parseInt(request.getParameter("advancedPayment"));
//		
//		RoomBooking rm = new RoomBooking( user, nic, mobile,email,checkin,checkout,noofrooms,members,advancedPayment);
//		userDAO.insertRoomsBook(rm);
//		response.sendRedirect("listRoomBooking");
//	}
//
//	private void updateUser(HttpServletRequest request, HttpServletResponse response) 
//			throws SQLException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		String user = request.getParameter("user");
//		String nic = request.getParameter("nic");
//		int mobile = Integer.parseInt(request.getParameter("mobile"));
//		String email = request.getParameter("email");
//		String checkin = (request.getParameter("checkin"));
//		String checkout = (request.getParameter("checkout"));
//		int noofrooms = Integer.parseInt(request.getParameter("noofrooms"));
//		int members = Integer.parseInt(request.getParameter("members"));
//		int advancedPayment = Integer.parseInt(request.getParameter("advancedPayment"));
//		
//		RoomBooking rm = new RoomBooking( id,user, nic, mobile,email,checkin,checkout,noofrooms,members,advancedPayment);
//		userDAO.updateRoombooking(rm);
//		response.sendRedirect("listRoomBook");
//	}
//
//	private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
//			throws SQLException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		userDAO.deleteRoomsBook(id);
//		response.sendRedirect("listRoomBook");
//
//	}
//
//}