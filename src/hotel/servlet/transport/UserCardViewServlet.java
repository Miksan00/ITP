package hotel.servlet.transport;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.dao.TransportDao;
import hotel.model.Transport;

@WebServlet("/listtransportuser")
public class UserCardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TransportDao TransportDao;

	public void init() {
		TransportDao = new TransportDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		List<Transport> listTransport = TransportDao.selectAllTransport();
		// System.out.print(listUser);
		request.setAttribute("listTransport", listTransport);
		RequestDispatcher dispatcher = request.getRequestDispatcher("VeichleCardList.jsp");
		dispatcher.forward(request, response);
	}

	
}