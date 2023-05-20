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

import com.data.FeedbackDAOImpl;
import com.model.Feedback;

/**
 * Servlet implementation class AdminRoomController
 */
@WebServlet("/AdminFeedbackController")
public class AdminFeedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	FeedbackDAOImpl feedUtil;
	
	String resource = "login.jsp";
	String message = null;

	@Override
	public void init() throws ServletException {

		super.init();
		feedUtil = new FeedbackDAOImpl();
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
				
			case "USERLIST":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					listUserComment(request, response);
				}
				break;
				
				
				
			case "ADD":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					addComment(request, response);
				}
				break;
				
			case "DELETE":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					deleteComment(request,response);
				}
				break;
			
			case "SEARCH":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					SearchComment(request,response);
				}
				break;
				
			case "LOAD":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					loadComment(request,response);
				}
				break;
				
			case "UPDATE": 
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					updateComment(request,response);
				}
				break;
				
			case "CHECK": 
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					checkComment(request,response);
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
	private void loadComment(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id=Integer.parseInt(request.getParameter("id"));
		Feedback feedback=feedUtil.getFeedback(id);
		request.setAttribute("ROOM",feedback);
		RequestDispatcher rd=request.getRequestDispatcher("admin-edit-Feedback.jsp");
		rd.forward(request, response);
		
		
	}

	private void updateComment(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id=Integer.parseInt(request.getParameter("id"));
		String fullName=request.getParameter("fullName");
		String comment=request.getParameter("address");
		String date=request.getParameter("dateOfArrival");
		String email=request.getParameter("email");
		int mobile=Integer.parseInt(request.getParameter("mobile"));
	
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date dom=new Date();
		dom=sdf.parse(date);
		
		
		
		Feedback feedback=new Feedback(id,fullName, comment, dom, email,mobile);
		feedUtil.updateFeedback(feedback);
		
		listComment(request,response);
	}


	private void SearchComment(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String fullName=request.getParameter("theSearchName");
		List<Feedback> feedList = feedUtil.searchFeedback(fullName);
		request.setAttribute("ROOM_LIST", feedList);
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-view-Feedback.jsp");
		
		rd.forward(request, response);
		listComment(request,response);
		
	}



	private void deleteComment(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id=Integer.parseInt(request.getParameter("id"));
		feedUtil.deleteFeedback(id);
		listComment(request,response);
		
	}


	private void addComment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String fullName = request.getParameter("fullName");
		String comment = request.getParameter("address");
		String date= request.getParameter("dateOfArrival");
		String email = request.getParameter("email");
		int mobile = Integer.valueOf(request.getParameter("mobile"));
		
		
		
//		System.out.println(location + "   " + itemCategory + "   " + itemSubCategory);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date dateOfarriv = new Date();
		Date dateOfdep= new Date();
		
		try {
			dateOfarriv = sdf.parse(date);
			
		} catch (ParseException e) {

			e.printStackTrace();
		}
		
		Feedback feedback = new Feedback(fullName, comment, dateOfarriv,  email, mobile);
		
		feedUtil.addFeedback(feedback);
		
		response.sendRedirect("AdminFeedbackController");
	}


	private void listComment(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Feedback> feedList = feedUtil.getFeedbacks();
		request.setAttribute("ROOM_LIST", feedList);
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-view-Feedback.jsp");
		
		rd.forward(request, response);
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	}
	
	private void listUserComment(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Feedback> feedList = feedUtil.getFeedbacks();
		request.setAttribute("ROOM_LIST", feedList);
		
		RequestDispatcher rd = request.getRequestDispatcher("user-view-Feedback.jsp");
		
		rd.forward(request, response);
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	}

}
