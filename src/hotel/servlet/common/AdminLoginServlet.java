package hotel.servlet.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.model.Admin;
import hotel.dao.CommonDao;

@WebServlet("/loginadmin")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommonDao CommonDao;

	public void init() {
		CommonDao = new CommonDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(password);

		try {
			if (CommonDao.validate(admin)) {

				response.sendRedirect("header.jsp");
			} else {
				HttpSession session = request.getSession();
				response.sendRedirect("AdminLogin.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}