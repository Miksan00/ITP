package com.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.data.AcceptFeedbackDAOImpl;
import com.data.FeedbackDAOImpl;
import com.model.Feedback;

/**
 * Servlet implementation class AdminRoomController
 */
@WebServlet("/AdminAcceptController")
public class AdminAcceptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	AcceptFeedbackDAOImpl feedUtil;
	
	String resource = "login.jsp";
	String message = null;

	@Override
	public void init() throws ServletException {

		super.init();
		feedUtil = new AcceptFeedbackDAOImpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		try {
				
			String COMMAND = request.getParameter("COMMAND");
			
			if(COMMAND == null) {
				COMMAND = "LIST";
			}
			
			switch(COMMAND) {
				
			case "LIST":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					listComment(request, response);
				}
				break;
				
			
			case "ACCEPT": 
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					updateAcceptComment(request,response);
				}
				break;
				
			case "DENIED": 
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					updateDenyComment(request,response);
				}
				break;
				
			default:
				listComment(request, response);
			}
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	private void checkComment(HttpServletRequest request, HttpServletResponse response) throws Exception {

		RequestDispatcher rd=request.getRequestDispatcher("admin-add-Feedback.jsp");
		rd.forward(request, response);
		
	}


	private void sessionChecker(HttpServletRequest request, HttpServletResponse response) throws Exception {

		message = "Session Expired : TRY AGAIN";
		RequestDispatcher rd = request.getRequestDispatcher(resource);
		request.setAttribute("msg", message);
		rd.forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void updateAcceptComment(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id=Integer.parseInt(request.getParameter("id"));	
		feedUtil.updateAcceptFeedback(id);
		
		listComment(request,response);
	}
	
	private void updateDenyComment(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id=Integer.parseInt(request.getParameter("id"));	
		feedUtil.updateDenyFeedback(id);
		
		listComment(request,response);
	}




	

	private void listComment(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Feedback> feedList = feedUtil.getAcceptFeedbacks();
		request.setAttribute("ROOM_LIST", feedList);
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-accept-Feedback.jsp");
		
		rd.forward(request, response);
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	}

}