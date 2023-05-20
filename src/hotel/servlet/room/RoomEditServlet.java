package hotel.servlet.room;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.dao.RoomsDao;
import hotel.model.Rooms;


@WebServlet("/editroom")
public class RoomEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RoomsDao RoomsDao;

	public void init() {
		RoomsDao = new RoomsDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		int id = Integer.parseInt(request.getParameter("id"));
		Rooms room = RoomsDao.selectRoom(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Newroom.jsp");
		request.setAttribute("user", room);
		dispatcher.forward(request, response);
		
	}

	

}