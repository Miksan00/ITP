package hotel.servlet.transport;
//package hotel.servlet.transport;
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
//import hotel.model.Transport;
//import hotel.model.Inventory;
//
//@WebServlet("/hv")
//public class TransportServlet extends HttpServlet {
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
//			case "/newtransport":
//				showNewForm(request, response);
//				break;
//			case "/inserttransport":
//				insertUser(request, response);
//				break;
//			case "/deletetransport":
//				deleteUser(request, response);
//				break;
//			case "/edittransport":
//				showEditForm(request, response);
//				break;
//			case "/updatetransport":
//				updateUser(request, response);
//				break;
//			case "/listtransport":
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
//		List<Transport> listTransport = userDAO.selectAllTransport();
//		// System.out.print(listUser);
//		request.setAttribute("listTransport", listTransport);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("TransportList.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		RequestDispatcher dispatcher = request.getRequestDispatcher("NewTransport.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, ServletException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		Transport tr = userDAO.selectTransport(id);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("NewTransport.jsp");
//		request.setAttribute("user", tr);
//		dispatcher.forward(request, response);
//
//	}
//
//	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//
//		String name = request.getParameter("name");
//
//	
//		String facilities = request.getParameter("facilities");
//		int cost = Integer.parseInt(request.getParameter("cost"));
//		String type = request.getParameter("type");
//		Transport tr = new Transport(name, facilities, cost,type);
//		userDAO.insertTransport(tr);
//		response.sendRedirect("listtransport");
//	}
//
//	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//
//		String name = request.getParameter("name");
//
//		String facilities = request.getParameter("facilities");
//		int cost = Integer.parseInt(request.getParameter("cost"));
//		String type = request.getParameter("type");
//
//		Transport tr = new Transport(id,name, facilities, cost,type);
//		userDAO.updateTransport(tr);
//		response.sendRedirect("listtransport");
//	}
//
//	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		userDAO.deleteTransport(id);
//		response.sendRedirect("listtransport");
//
//	}
//
//}