package hotel.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.dao.UserDao;
import hotel.model.User;

@WebServlet("/loginUser")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao UserDao;
	
	public void init() {
		UserDao = new UserDao();
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        try {
        	  Cookie c1 = new Cookie("LoginUser",username);
              c1.setMaxAge(100000);
              response.addCookie(c1);
          response.addCookie(c1);
            System.out.println("Cookie set For User");
            System.out.println(c1);
        	
        	
        	
            if (UserDao.validate(user)) {
                //HttpSession session = request.getSession();
                // session.setAttribute("username",username);
                response.sendRedirect("MemberView.jsp");
            } else {
                HttpSession session = request.getSession();
                //session.setAttribute("user", username);
             response.sendRedirect("CustomerLogin.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}