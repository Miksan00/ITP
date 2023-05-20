package hotel.servlet.banquet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.dao.BanquetDao;

import hotel.model.Banq;

@WebServlet("/updatebanq")
public class BanqUpdateServlet extends HttpServlet {
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
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("id"+id);
		String guest = request.getParameter("guest");
		System.out.println("guest"+guest);
		int mobile = Integer.parseInt(request.getParameter("mobile"));
		System.out.println("guest mobile"+mobile);
		String additional = request.getParameter("additional");
		System.out.println("guest additional"+additional);
		String decoration = request.getParameter("decoration");
		System.out.println("guest decoration"+decoration);
		String date = request.getParameter("Date");
		System.out.println("guest date"+date);
		System.out.println("Updating............");
		
		Banq ban = new Banq(id, guest, mobile, additional, decoration, date);

		try {
			System.err.println("working");
			BanquetDao.updateBanquet(ban);
			System.out.println("banquet Updating...........");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("listbanq");

	}

}