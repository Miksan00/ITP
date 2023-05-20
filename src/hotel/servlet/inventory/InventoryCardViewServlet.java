package hotel.servlet.inventory;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.dao.InventoryDao;
import hotel.model.Inventory;




@WebServlet("/listcard")
public class InventoryCardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InventoryDao InventoryDao;
	
	public void init() {
		InventoryDao = new InventoryDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		List<Inventory> listUser = InventoryDao.selectAllUsers();
		//System.out.print(listUser);
		request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("InventoryCard.jsp");
		dispatcher.forward(request, response);
	
	}


}