package hotel.servlet.transport;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import hotel.dao.TransportDao;
import hotel.model.Transport;

@WebServlet("/updatetransport")
public class TransportUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TransportDao TransportDao;

	public void init() {
		TransportDao = new TransportDao();
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Request received");
		Map param=request.getParameterMap();
		System.out.println(param);
//		Enumeration<String> params = request.getParameterNames(); 
//		while(params.hasMoreElements()){
//		 String paramName = params.nextElement();
//	//	 System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameterMap();
//		
//		}
		System.out.println("Request Progress");
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		System.out.println(request.getParameter("id"));
		
		int id = Integer.parseInt(request.getParameter("id"));
System.out.println("id "+id);
		String name = request.getParameter("veichlename");
System.out.println("veichle "+name);
		String facilities = request.getParameter("facilities");
		System.out.println("facilities "+facilities);
		int cost = Integer.parseInt(request.getParameter("cost"));
		System.out.println("cost "+cost);
		String type = request.getParameter("type");
		System.out.println("type "+type);
		

System.out.println("update....");
		Transport tr = new Transport(id, name, facilities, cost, type);
		try {
			TransportDao.updateTransport(tr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("listtransport");

	}
	


}