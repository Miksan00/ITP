package com.data;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.model.Feedback;
import com.data.ConnectionFactory;


public class FeedbackDAOImpl implements FeedbackDAO{

	@Override
	public List<Feedback> getFeedbacks() throws Exception {
	List<Feedback> roomList = new ArrayList<Feedback>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionFactory.getCon();
			ps = con.prepareStatement("select * from feedbacks where status='accepted' order by id");
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

	@Override
	public void addFeedback(Feedback feedback) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		
		

		try {
			con = ConnectionFactory.getCon();
			ps = con.prepareStatement("insert into feedbacks(fullName, comment, date, email, mobile,status) values( ?, ?, ?, ?, ?,?)");
			
			ps.setString(1, feedback.getFullName());
			ps.setString(2, feedback.getComment());
			ps.setTimestamp(3, new java.sql.Timestamp(feedback.getDate().getTime()));
			ps.setString(4, feedback.getEmail());
			ps.setInt(5, feedback.getMobile());
			ps.setString(6,"pending");
			
			
			ps.executeUpdate();
		}
		finally {
			close(null, ps, con);
		}
		
	}

	@Override
	public void deleteFeedback(int id) throws Exception {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("delete from feedbacks where id=?");
			ps.setInt(1,id);
			ps.executeUpdate();
		}
		finally {
			close(null,ps,con);
		}
		
	}

	@Override
	public List<Feedback> searchFeedback(String fullname) throws Exception {
		List<Feedback> searchList=new ArrayList<>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("select * from feedbacks where fullName=?");
			ps.setString(1, fullname);
			rs=ps.executeQuery();
			while(rs.next()) {
				int id=rs.getInt(1);
				String fullName=rs.getString(2);
				String comment=rs.getString(3);
		        Date date=rs.getDate(4);
		        String email=rs.getString(5);
		        int mobile=rs.getInt(6);
		      
		        
		        Feedback feedback=new Feedback(id, fullName, comment, date, email, mobile);
		        
		        searchList.add(feedback);
			}
		}
		finally {
			close(rs,ps,con);
		}
		return searchList;
	}

	@Override
	public Feedback getFeedback(int id) throws Exception {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Feedback feedback = null;
		try {
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("select * from feedbacks where id=?");
			ps.setInt(1, id);
			rs=ps.executeQuery();
			if(rs.next()) {
				String fullName=rs.getString(2);
				String comment=rs.getString(3);
		        Date date=rs.getDate(4);
		        String email=rs.getString(5);
		        int mobile=rs.getInt(6);
		       
		        
		        feedback=new Feedback(id, fullName, comment, date, email, mobile);
		        
			}
			else {
				throw new Exception("Item Not Found");
			}
		}
		finally {
			close(rs,ps,con);
		}
		return feedback;
	}

	@Override
	public void updateFeedback(Feedback feedback) throws Exception {
		Connection con=null;
		PreparedStatement ps=null;
		try
		{
			con=ConnectionFactory.getCon();
			ps=con.prepareStatement("update feedbacks set fullName=?,comment=?,date=?,email=?,mobile=? where id=?");
			ps.setString(1, feedback.getFullName());
			ps.setString(2,feedback.getComment());
			ps.setTimestamp(3, new java.sql.Timestamp(feedback.getDate().getTime()));
			ps.setString(4,feedback.getEmail());
			ps.setInt(5,feedback.getMobile());
			ps.setInt(6,feedback.getId());
			ps.executeUpdate();
		}
		finally {
			close(null,ps,con);
		}
		
	}

		
	

}
