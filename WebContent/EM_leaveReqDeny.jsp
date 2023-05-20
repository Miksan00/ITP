<%@ page import="hotel.dbconnection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String phonenumber=request.getParameter("phonenumber");
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update leaves set status='Denied' where phonenumber=?");

	ps.setString(1,phonenumber);
	ps.executeUpdate();
	response.sendRedirect("EM_leaveReq.jsp");
}
catch(Exception e)
{
	response.sendRedirect("EM_leaveReq.jsp");
	}
%>