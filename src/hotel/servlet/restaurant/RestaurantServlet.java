package hotel.servlet.restaurant;
//package hotel.servlet.restaurant;
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
//import hotel.model.Restaurant;
//import hotel.model.Inventory;
//
//
//
//@WebServlet("/ad")
//public class RestaurantServlet extends HttpServlet {
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
//			case "/newres":
//				showNewForm(request, response);
//				break;
//			case "/insertres":
//				insertUser(request, response);
//				break;
//			case "/deleteres":
//				deleteUser(request, response);
//				break;
//			case "/editres":
//				showEditForm(request, response);
//				break;
//			case "/updateres":
//				updateUser(request, response);
//				break;
//			case "/listres":
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
//		List<Restaurant> listrest = userDAO.selectAllRestaurants();
//		//System.out.print(listUser);
//		request.setAttribute("listFoods", listrest);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("FoodList.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		RequestDispatcher dispatcher = request.getRequestDispatcher("NewFood.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, ServletException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		Restaurant existingUser = userDAO.selectRestaurant(id);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("NewFood.jsp");
//		request.setAttribute("user", existingUser);
//		dispatcher.forward(request, response);
//
//	}
//
//	private void insertUser(HttpServletRequest request, HttpServletResponse response) 
//			throws SQLException, IOException {
//		String user = request.getParameter("user");
//		String juice = request.getParameter("juice");
//		String main = request.getParameter("main");
//		String dessert = request.getParameter("dessert");
//		
//		Restaurant newfood = new Restaurant( user, juice, main,dessert);
//		userDAO.insertRestaurant(newfood);
//		response.sendRedirect("listres");
//	}
//
//	private void updateUser(HttpServletRequest request, HttpServletResponse response) 
//			throws SQLException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		String user = request.getParameter("user");
//		String juice = request.getParameter("juice");
//		String main = request.getParameter("main");
//		String dessert = request.getParameter("dessert");
//
//		Restaurant updfood = new Restaurant(id,user,juice,main,dessert);
//		userDAO.updateRestaurant(updfood);
//		response.sendRedirect("listres");
//	}
//
//	private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
//			throws SQLException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		userDAO.deleteRestaurant(id);
//		response.sendRedirect("listres");
//
//	}
//
//}