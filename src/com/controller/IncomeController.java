package com.controller;

import java.io.IOException;
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

import com.data.IncomeDAOImpl;

import com.model.Expense;
import com.model.Income;

/**
 * Servlet implementation class IncomeControll
 */
@WebServlet("/IncomeController")
public class IncomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
IncomeDAOImpl incomeUtil;
	
	String resource = "login.jsp";
	String message = null;

	@Override
	public void init() throws ServletException {

		super.init();
		incomeUtil = new IncomeDAOImpl();
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
					listIncome(request, response);
				}
				break;
				
			case "ADD":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					addIncome(request, response);
				}
				break;
				
			case "DELETE":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					deleteIncome(request,response);
				}
				break;
			
			case "SEARCH":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					SearchIncome(request,response);
				}
				break;
				
			case "LOAD":
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					loadIncome(request,response);
				}
				break;
				
			case "UPDATE": 
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					updateIncome(request,response);
				}
				break;
				
			case "CHECK": 
				if(session.isNew()) {
					sessionChecker(request, response);
				}
				else {
					checkIncome(request,response);
				}
				break;
				
			default:
				listIncome(request, response);
			}
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
	}
	
	private void checkIncome(HttpServletRequest request, HttpServletResponse response) throws Exception {

		RequestDispatcher rd=request.getRequestDispatcher("admin-add-income.jsp");
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
	
	private void loadIncome(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id=Integer.parseInt(request.getParameter("id"));
		Income income=incomeUtil.getIncome(id);
		request.setAttribute("INCOME",income);
		RequestDispatcher rd=request.getRequestDispatcher("update-income.jsp");
		rd.forward(request, response);
		
		
	}

	private void updateIncome(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id=Integer.parseInt(request.getParameter("id"));
		String invoiceId=request.getParameter("invoiceId");
		String month=request.getParameter("month");
		String division=request.getParameter("division");
		double total=Double.parseDouble(request.getParameter("total"));
		String remark=request.getParameter("remark");
		
		
		
		Income income=new Income(id,invoiceId, month, division, remark,total);
		incomeUtil.updateIncome(income);
		
		listIncome(request,response);
	}


	private void SearchIncome(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String invoiceId=request.getParameter("theSearchName");
		List<Income> incomeList = incomeUtil.searchIncomes(invoiceId);
		request.setAttribute("INCOME_LIST", incomeList);
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-view-income.jsp");
		
		rd.forward(request, response);
		listIncome(request,response);
		
	}



	private void deleteIncome(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id=Integer.parseInt(request.getParameter("id"));
		incomeUtil.deleteIncome(id);
		listIncome(request,response);
		
	}


	private void addIncome(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String invoiceId = request.getParameter("invoiceId");
		String month = request.getParameter("month");
		String division = request.getParameter("division");
		
		double total = Double.valueOf(request.getParameter("total"));
		String remark=request.getParameter("remark");
		
		
	
		if(invoiceId.isEmpty()|| month.isEmpty()|| division.isEmpty()) {
			
			request.setAttribute("error", "All Field are required");
//		              String errorMsg=(String)request.getAttribute("ErrorMessage");
		  RequestDispatcher dispatcher =  request.getRequestDispatcher("admin-add-income.jsp");
		  dispatcher.forward(request, response);
		}
		else {
			request.setAttribute("msg", "income Successfully Saved");
//		              String errorMsg=(String)request.getAttribute("ErrorMessage");
		  RequestDispatcher dispatcher =  request.getRequestDispatcher("admin-add-income.jsp");
		 dispatcher.forward(request, response);
		}
		
		
		Income income = new Income(invoiceId, month, remark, division, total);
		
		incomeUtil.addIncome(income);
		
		response.sendRedirect("IncomeController");
	}


	private void listIncome(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Income> incomeList = incomeUtil.getIncomes();
		request.setAttribute("INCOME_LIST", incomeList);
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-view-income.jsp");
		
		rd.forward(request, response);
		
	}


}
