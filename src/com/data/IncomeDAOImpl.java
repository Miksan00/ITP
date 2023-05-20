package com.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Income;

public class IncomeDAOImpl implements IncomeDAO{

	@Override
	public List<Income> getIncomes() throws Exception {
List<Income> incomeList = new ArrayList<Income>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionFactory.getCon();
			ps = con.prepareStatement("select * from income order by id");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String invoiceId = rs.getString("invoiceId");
				String month = rs.getString("month");
				String division = rs.getString("division");
				
				
				Double total = rs.getDouble("total");
				String remark = rs.getString("remark");
			
				
				
				Income income = new Income(id, invoiceId, month,division, remark, total);
				
				incomeList.add(income);
				
			}
		}
		finally {
			close(rs, ps, con);
		}
		
		return incomeList;
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
	public void addIncome(Income income) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		
		

		try {
			con = ConnectionFactory.getCon();
			ps = con.prepareStatement("insert into income(invoiceId, month, remark , total,division) values( ?, ?, ?, ?, ?)");
			
			ps.setString(1, income.getInvoiceId());
			ps.setString(2, income.getMonth());
			
			ps.setString(3, income.getDivision());
		
			ps.setDouble(4, income.getTotal());
			ps.setString(5, income.getRemark());
			
			
			
			ps.executeUpdate();
		}
		catch (Error e) {
			System.out.println(e);
			
		}
		
		finally {
			close(null, ps, con);
		}
		
	}

	@Override
	public void deleteIncome(int id) throws Exception {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("delete from income where id=?");
			ps.setInt(1,id);
			ps.executeUpdate();
		}
		finally {
			close(null,ps,con);
		}
		
	}

	@Override
	public List<Income> searchIncomes(String invoiceid) throws Exception {
		List<Income> searchList=new ArrayList<>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("select * from income where invoiceId=?");
			ps.setString(1, invoiceid);
			rs=ps.executeQuery();
			while(rs.next()) {
				int id=rs.getInt(1);
				String invoiceId=rs.getString(2);
				String month=rs.getString(3);
				
				String division=rs.getString(4);
			
				double total = rs.getDouble(5);
				String remark=rs.getString(6);
		       
		        
		        
		      
		        
				Income income=new Income(id, invoiceId, month, division,remark, total);
		        
		        searchList.add(income);
			}
		}
		finally {
			close(rs,ps,con);
		}
		return searchList;
	}

	@Override
	public Income getIncome(int id) throws Exception {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Income income = null;
		try {
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("select * from income where id=?");
			ps.setInt(1, id);
			rs=ps.executeQuery();
			if(rs.next()) {
				
				String invoiceId=rs.getString(2);
				String month=rs.getString(3);
				
				String division=rs.getString(4);
				
				double total = rs.getDouble(5);
				String remark=rs.getString(6);
				
		       
		        
				income=new Income(id, invoiceId, month, division,remark, total);
		        
			}
			else {
				throw new Exception("Item Not Found");
			}
		}
		finally {
			close(rs,ps,con);
		}
		return income;
	}

	@Override
	public void updateIncome(Income income) throws Exception {
		Connection con=null;
		PreparedStatement ps=null;
		try
		{
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("update income set invoiceId=?,month=?,division=?,total=?,remark=? where id=?");
			ps.setString(1, income.getInvoiceId());
			ps.setString(2, income.getMonth());
			
			ps.setString(3, income.getDivision());
			ps.setDouble(4,income.getTotal());
			ps.setString(5, income.getRemark());
			ps.setInt(6,income.getId());
			ps.executeUpdate();
		}
		finally {
			close(null,ps,con);
		}
		
	}


}
