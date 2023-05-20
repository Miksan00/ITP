package hotel.servlet.restaurant;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.dao.FoodDao;

import hotel.model.Restaurant;




@WebServlet("/listres")
public class RestaurantListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FoodDao FoodDao;
	
	public void init() {
		FoodDao = new FoodDao();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		List<Restaurant> listrest = FoodDao.selectAllRestaurants();
		//System.out.print(listUser);
		request.setAttribute("listFoods", listrest);
		RequestDispatcher dispatcher = request.getRequestDispatcher("FoodList.jsp");
		dispatcher.forward(request, response);
	}


}