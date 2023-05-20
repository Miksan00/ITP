//package hotel.servlet.room;
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
//import hotel.model.Rooms;
//import hotel.model.Inventory;
//
//@WebServlet("/m")
//public class Roomservlet extends HttpServlet {
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
//			case "/newroom":
//				showNewForm(request, response);
//				break;
//			case "/insertroom":
//				insertUser(request, response);
//				break;
//			case "/deleteroom":
//				deleteUser(request, response);
//				break;
//			case "/editroom":
//				showEditForm(request, response);
//				break;
//			case "/updateroom":
//				updateUser(request, response);
//				break;
//			case "/listroom":
//				listUser(request, response);
//				break;
//			}
//		} catch (SQLException ex) {
//			throw new ServletException(ex);
//		}
//	}
//
//	private void listUser(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, IOException, ServletException {
//		List<Rooms> listRooms = userDAO.selectAllRooms();
//		// System.out.print(listUser);
//		request.setAttribute("listRooms", listRooms);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("roomlist.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		RequestDispatcher dispatcher = request.getRequestDispatcher("Newroom.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, ServletException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		Rooms room = userDAO.selectRoom(id);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("Newroom.jsp");
//		request.setAttribute("user", room);
//		dispatcher.forward(request, response);
//
//	}
//
//	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//
//		String roomtype = request.getParameter("roomtype");
//
//		int nobeds = Integer.parseInt(request.getParameter("nobeds"));
//		String facilities = request.getParameter("facilities");
//		int cost = Integer.parseInt(request.getParameter("cost"));
//
//		Rooms room = new Rooms(roomtype, nobeds, facilities, cost);
//		userDAO.insertRooms(room);
//		response.sendRedirect("listroom");
//	}
//
//	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//
//		String roomtype = request.getParameter("roomtype");
//
//		int nobeds = Integer.parseInt(request.getParameter("nobeds"));
//		String facilities = request.getParameter("facilities");
//		int cost = Integer.parseInt(request.getParameter("cost"));
//
//		Rooms room = new Rooms(id,roomtype, nobeds, facilities, cost);
//		userDAO.updateRooms(room);
//		response.sendRedirect("listroom");
//	}
//
//	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		userDAO.deleteRoom(id);
//		response.sendRedirect("listroom");
//
//	}
//
//}