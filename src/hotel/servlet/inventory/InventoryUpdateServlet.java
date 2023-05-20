package hotel.servlet.inventory;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import hotel.dao.InventoryDao;
import hotel.model.Inventory;



@WebServlet("/update")
public class InventoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InventoryDao InventoryDao;
	
	public void init() {
		InventoryDao = new InventoryDao();
	}
	public static final String UPLOAD_DIR = "images"+File.separator+"rooms";
	public static final String UPLOAD_DIR2="images/rooms";
	public String dbFileName = "";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		int id = Integer.parseInt(request.getParameter("id"));
		String inventoryname = request.getParameter("inventoryname");
		String suppliername = request.getParameter("suppliername");
		int supllierid = Integer.parseInt(request.getParameter("supllierid"));
		String supplierdate = request.getParameter("supplierdate");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int price = Integer.parseInt(request.getParameter("price"));
		int total = Integer.parseInt(request.getParameter("total"));

		
		
		
		Inventory book = new Inventory(id,inventoryname, suppliername, supllierid,supplierdate,quantity,price,total);
		try {
			InventoryDao.updateUser(book);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("list");
		
	}
	private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
	private String randomString() {
		// create a string of all characters
	    String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    // create random string builder
	    StringBuilder sb = new StringBuilder();
	    // create an object of Random class
	    Random random = new Random();
	    // specify length of random string
	    int length = 7;
	    for(int i = 0; i < length; i++) {
	      // generate random index number
	      int index = random.nextInt(alphabet.length());
	      // get character specified by index
	      // from the string
	      char randomChar = alphabet.charAt(index);
	      // append the character to string builder
	      sb.append(randomChar);
	    }
	    String randomString = sb.toString();
		return randomString;
		
	}
	
	

	

}