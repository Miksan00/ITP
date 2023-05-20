package com.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.model.Expense;
import com.model.Income;

public class ExpenseDAOImpl implements ExpenseDAO{

	@Override
	public List<Expense> getExpenses() throws Exception {
List<Expense> expenseList = new ArrayList<Expense>();
		
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
	con = ConnectionFactory.getCon();
	ps = con.prepareStatement("select * from expense order by id");
	rs = ps.executeQuery();
	
	while(rs.next()) {
		int id = rs.getInt("id");
		String invoiceId = rs.getString("invoiceId");
		String month = rs.getString("month");
		String division = rs.getString("division");
		int quantity = rs.getInt("quantity");
		String type = rs.getString("type");
		Double total = rs.getDouble("total");
		
	
		
		
		Expense expense = new Expense(id, invoiceId, month,division, quantity,type, total);
		
		expenseList.add(expense);
		
	}
		}
		finally {
			close(rs, ps, con);
		}
		
		return expenseList;
	}

	private void close(ResultSet rs, PreparedStatement ps, Connection con) {
		
		try {
			
			if(rs != null) {
				rs.close();
			}
			if(ps != null) {
				ps.close();
			}
			if(con != null) {
				con.close();
			}
			
		}
		catch(Exception e) {
			e.getStackTrace();
		}
	}

	@Override
	public void addExpense(Expense expense) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		
		

		try {
			con = ConnectionFactory.getCon();
			ps = con.prepareStatement("insert into expense(invoiceId, month, division ,quantity,type, total) values( ?, ?, ?, ?, ?,?)");
			
			ps.setString(1, expense.getInvoiceId());
			ps.setString(2, expense.getMonth());	
			ps.setString(3, expense.getDivision());
			ps.setInt(4, expense.getQuantity());
			ps.setString(5, expense.getType());
			ps.setDouble(6, expense.getTotal());
			
			
			
			
			ps.executeUpdate();
		}
		finally {
			close(null, ps, con);
		}
		
	}

	@Override
	public void deleteExpense(int id) throws Exception {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("delete from expense where id=?");
			ps.setInt(1,id);
			ps.executeUpdate();
		}
		finally {
			close(null,ps,con);
		}
		
		
	}

	@Override
	public List<Expense> searchExpenses(String invoiceid) throws Exception {
		List<Expense> searchList=new ArrayList<>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("select * from expense where invoiceId=?");
			ps.setString(1, invoiceid);
			rs=ps.executeQuery();
			while(rs.next()) {
				int id=rs.getInt(1);
				String invoiceId=rs.getString(2);
				String month=rs.getString(3);
				String division=rs.getString(6);
				int quantity=rs.getInt(5);
				String type=rs.getString(4);
				double total = rs.getDouble(7);
		       
		        
		        
		      
		        
		        Expense expense=new Expense(id, invoiceId, month, type, quantity, division,total);
		        
		        searchList.add(expense);
			}
		}
		finally {
			close(rs,ps,con);
		}
		return searchList;
	}

	@Override
	public Expense getExpense(int id) throws Exception {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Expense expense = null;
		try {
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("select * from expense where id=?");
			ps.setInt(1, id);
			rs=ps.executeQuery();
			if(rs.next()) {
				
				String invoiceId=rs.getString(2);
				String month=rs.getString(3);
				
				String division=rs.getString(4);
				int quantity = rs.getInt(5);
				String type=rs.getString(6);
				double total = rs.getDouble(7);
				
				
		       
		        
				expense=new Expense(id, invoiceId, month, division,quantity,type, total);
		        
			}
			else {
				throw new Exception("Item Not Found");
			}
		}
		finally {
			close(rs,ps,con);
		}
		return expense;
	}

	@Override
	public void updateExpense(Expense expense) throws Exception {
		Connection con=null;
		PreparedStatement ps=null;
		try
		{
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("update expense set invoiceId=?,month=?,division=?,quantity=?,type=?,total=? where id=?");
			ps.setString(1, expense.getInvoiceId());
			ps.setString(2, expense.getMonth());
			
			ps.setString(3, expense.getDivision());
			ps.setInt(4,expense.getQuantity());
			ps.setString(5, expense.getType());
			ps.setDouble(6,expense.getTotal());
			
			ps.setInt(7,expense.getId());
			ps.executeUpdate();
		}
		finally {
			close(null,ps,con);
		}
		
	}

}
