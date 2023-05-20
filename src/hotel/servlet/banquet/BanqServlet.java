package hotel.servlet.banquet;
//package hotel.servlet.banquet;
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
//import hotel.model.Banq;
//import hotel.model.Inventory;
//
//
//
//@WebServlet("/sc")
//public class BanqServlet extends HttpServlet {
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
//			case "/newbanq":
//				showNewForm(request, response);
//				break;
//			case "/insertbanq":
//				insertUser(request, response);
//				break;
//			case "/deletebanq":
//		//		deleteUser(request, response);
//				break;
//			case "/editbanq":
//			showEditForm(request, response);
//				break;
//			case "/updatebanq":
//				updateUser(request, response);
//				break;
//			case "/listbanq":
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
//		List<Banq> list = userDAO.selectAllBanquets();
//		//System.out.print(listUser);
//		request.setAttribute("listBanq", list);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("Banqlist.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		RequestDispatcher dispatcher = request.getRequestDispatcher("NewBanq.jsp");
//		dispatcher.forward(request, response);
//	}
//
//	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, ServletException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		Banq existingUser = userDAO.selectBanquet(id);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("Banqlist.jsp");
//		request.setAttribute("user", existingUser);
//		dispatcher.forward(request, response);
//
//	}
//
//	private void insertUser(HttpServletRequest request, HttpServletResponse response) 
//			throws SQLException, IOException {
//		String guest = request.getParameter("guest");
//		int mobile = Integer.parseInt(request.getParameter("mobile"));
//		String additional = request.getParameter("additional");
//		String decoration = request.getParameter("decoration");
//		String date = request.getParameter("Date");
//		
//		Banq newbanq = new Banq( guest, mobile, additional,decoration,date);
//		userDAO.insertBanquet(newbanq);
//		response.sendRedirect("listbanq");
//	}
//
//	private void updateUser(HttpServletRequest request, HttpServletResponse response) 
//			throws SQLException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		String guest = request.getParameter("guest");
//		int mobile = Integer.parseInt(request.getParameter("mobile"));
//		String additional = request.getParameter("additional");
//		String decoration = request.getParameter("decoration");
//		String date = request.getParameter("date");
//
//		Banq ban = new Banq(id,guest, mobile, additional,decoration,date);
//		userDAO.updateBanq(ban);
//		response.sendRedirect("listbanq");
//	}
//
//
//}