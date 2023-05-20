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

import com.data.ExpenseDAOImpl;
import com.model.Expense;

/**
 * Servlet implementation class ExpenseController
 */
@WebServlet("/ExpenseController")
public class ExpenseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
ExpenseDAOImpl expenseUtil;
	
	String resource = "login.jsp";
	String message = null;

	@Override
	public void init() throws ServletException {

		super.init();
		expenseUtil = new ExpenseDAOImpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
					listExpense(request, response);
				}
				break;
				
			case "ADD":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					addExpense(request, response);
				}
				break;
				
			case "DELETE":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					deleteExpense(request,response);
				}
				break;
			
			case "SEARCH":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					SearchExpense(request,response);
				}
				break;
				
			case "LOAD":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					loadExpense(request,response);
				}
				break;
				
			case "UPDATE": 
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					updateExpense(request,response);
				}
				break;
				
			case "CHECK": 
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					checkExpense(request,response);
				}
				break;
				
			default:
				listExpense(request, response);
			}
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
	}
	
	private void checkExpense(HttpServletRequest request, HttpServletResponse response) throws Exception {

		RequestDispatcher rd=request.getRequestDispatcher("admin-add-expense.jsp");
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
	
	private void loadExpense(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id=Integer.parseInt(request.getParameter("id"));
		Expense expense=expenseUtil.getExpense(id);
		request.setAttribute("EXPENSE",expense);
		RequestDispatcher rd=request.getRequestDispatcher("update-expense.jsp");
		rd.forward(request, response);
		
		
	}

	private void updateExpense(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id=Integer.parseInt(request.getParameter("id"));
		String invoiceId=request.getParameter("invoiceId");
		String month=request.getParameter("month");
		String division=request.getParameter("division");		
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		String type=request.getParameter("type");
		double total=Double.parseDouble(request.getParameter("total"));
	
		
		
		
		Expense expense=new Expense(id,invoiceId, month, division, quantity,type,  total);
		expenseUtil.updateExpense(expense);
		
		listExpense(request,response);
	}


	private void SearchExpense(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String invoiceId=request.getParameter("theSearchName");
		List<Expense> expenseList = expenseUtil.searchExpenses(invoiceId);
		request.setAttribute("EXPENSE_LIST", expenseList);
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-view-expense.jsp");
		
		rd.forward(request, response);
		listExpense(request,response);
		
	}



	private void deleteExpense(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id=Integer.parseInt(request.getParameter("id"));
		expenseUtil.deleteExpense(id);
		listExpense(request,response);
		
	}


	private void addExpense(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String invoiceId = request.getParameter("invoiceId");
		String month = request.getParameter("month");
		
		String division = request.getParameter("division");
		int quantity = Integer.valueOf(request.getParameter("quantity"));
		String type = request.getParameter("type");
		double total = Double.valueOf(request.getParameter("total"));
		
		
if(invoiceId.isEmpty()|| month.isEmpty()|| division.isEmpty()|| type.isEmpty()) {
	
	request.setAttribute("error", "All Field are required");
//              String errorMsg=(String)request.getAttribute("ErrorMessage");
  RequestDispatcher dispatcher =  request.getRequestDispatcher("admin-add-expense.jsp");
  dispatcher.forward(request, response);
}
else {
	request.setAttribute("msg", "Expenses Successfully Saved");
//              String errorMsg=(String)request.getAttribute("ErrorMessage");
  RequestDispatcher dispatcher =  request.getRequestDispatcher("admin-add-expense.jsp");
 dispatcher.forward(request, response);
}
		
		Expense expense = new Expense(invoiceId, month, division, quantity, type, total);
		
		expenseUtil.addExpense(expense);
		
		response.sendRedirect("ExpenseController");
	}


	private void listExpense(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Expense> expenseList = expenseUtil.getExpenses();
		request.setAttribute("EXPENSE_LIST", expenseList);
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-view-expense.jsp");
		
		rd.forward(request, response);
		
	}

}
