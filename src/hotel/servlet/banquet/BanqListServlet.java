package hotel.servlet.banquet;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.dao.BanquetDao;

import hotel.model.Banq;




@WebServlet("/listbanq")
public class BanqListServlet extends HttpServlet {
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
		List<Banq> list = BanquetDao.selectAllBanquets();
		//System.out.print(listUser);
		request.setAttribute("listBanq", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Banqlist.jsp");
		dispatcher.forward(request, response);
	
	}

	

}