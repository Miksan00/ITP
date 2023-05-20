package hotel.servlet.banquet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.dao.BanquetDao;

import hotel.model.Banq;



@WebServlet("/newbanq")
public class BanqNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BanquetDao BanquetDao;
	
	public void init() {
		BanquetDao = new BanquetDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		RequestDispatcher dispatcher = request.getRequestDispatcher("NewBanq.jsp");
		dispatcher.forward(request, response);
	}


}