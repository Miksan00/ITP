package hotel.servlet.inventory;
//package hotel.servlet.inventory;
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
//import hotel.model.Inventory;
//
//
//
//@WebServlet("/nv")
//public class UserServlet extends HttpServlet {
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
//			case "/new":
//				showNewForm(request, response);
//				break;
//			case "/insert":
//				insertUser(request, response);
//				break;
//			case "/delete":
//				deleteUser(request, response);
//				break;
//			case "/edit":
//				showEditForm(request, response);
//				break;
//			case "/update":
//				updateUser(request, response);
//				break;
//			case "/list":
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
//		List<Inventory> listUser = userDAO.selectAllUsers();
//		//System.out.print(listUser);
//		request.setAttribute("listUser", listUser);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, ServletException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		Inventory existingUser = userDAO.selectUser(id);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
//		request.setAttribute("user", existingUser);
//		dispatcher.forward(request, response);
//
//	}
//
//	private void insertUser(HttpServletRequest request, HttpServletResponse response) 
//			throws SQLException, IOException {
//		String inventoryname = request.getParameter("inventoryname");
//		String suppliername = request.getParameter("suppliername");
//		int supllierid = Integer.parseInt(request.getParameter("supllierid"));
//		String supplierdate = request.getParameter("supplierdate");
//		int quantity = Integer.parseInt(request.getParameter("quantity"));
//		int price = Integer.parseInt(request.getParameter("price"));
//		Inventory newUser = new Inventory( inventoryname, suppliername, supllierid,supplierdate,quantity,price);
//		userDAO.insertUser(newUser);
//		response.sendRedirect("list");
//	}
//
//	private void updateUser(HttpServletRequest request, HttpServletResponse response) 
//			throws SQLException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		String inventoryname = request.getParameter("inventoryname");
//		String suppliername = request.getParameter("suppliername");
//		int supllierid = Integer.parseInt(request.getParameter("supllierid"));
//		String supplierdate = request.getParameter("supplierdate");
//		int quantity = Integer.parseInt(request.getParameter("quantity"));
//		int price = Integer.parseInt(request.getParameter("price"));
//
//		Inventory book = new Inventory(id,inventoryname, suppliername, supllierid,supplierdate,quantity,price);
//		userDAO.updateUser(book);
//		response.sendRedirect("list");
//	}
//
//	private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
//			throws SQLException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		userDAO.deleteUser(id);
//		response.sendRedirect("list");
//
//	}
//
//}