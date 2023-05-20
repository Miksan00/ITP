package hotel.servlet.banquet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.dao.BanquetDao;

import hotel.model.Banq;




@WebServlet("/insertbanq")
public class InsertBanquetServlet2 extends HttpServlet {
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
		String guest = request.getParameter("guest");
		int mobile = Integer.parseInt(request.getParameter("mobile"));
		String additional = request.getParameter("additional");
		String decoration = request.getParameter("decoration");
		String date = request.getParameter("Date");
		
		Banq newbanq = new Banq( guest, mobile, additional,decoration,date);
		try {
			BanquetDao.insertBanquet(newbanq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("listbanq");
		
	}

	

}