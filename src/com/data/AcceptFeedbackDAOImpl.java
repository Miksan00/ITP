package com.data;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.model.Feedback;
import com.data.ConnectionFactory;


public class AcceptFeedbackDAOImpl implements AcceptFeedbackDAO{

	@Override
	public List<Feedback> getAcceptFeedbacks() throws Exception {
	List<Feedback> roomList = new ArrayList<Feedback>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionFactory.getCon();
			ps = con.prepareStatement("select * from feedbacks where status='pending'  order by id");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String fullName = rs.getString("fullName");
				String comment = rs.getString("comment");
				Date date = rs.getDate("date");
				String email = rs.getString("email");
				int mobile = rs.getInt("mobile");
				
				Feedback feedback = new Feedback(id, fullName, comment, date, email, mobile);
				
				roomList.add(feedback);
				
			}
		}
		finally {
			close(rs, ps, con);
		}
		
		return roomList;
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

	public void updateAcceptFeedback(int id) throws Exception {
			
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("update feedbacks set status='accepted' where id=?");
			ps.setInt(1,id);
			ps.executeUpdate();
		}
		finally {
			close(null,ps,con);
		}
		

		
	}

	@Override
	public void updateDenyFeedback(int id) throws Exception {
		
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("update feedbacks set status='denied' where id=?");
			ps.setInt(1,id);
			ps.executeUpdate();
		}
		finally {
			close(null,ps,con);
		}
		
		
		
	}

	
		
	

}
