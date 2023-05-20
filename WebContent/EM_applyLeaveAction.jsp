<%@page import="hotel.dbconnection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.Statement"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String date=request.getParameter("date");
String phonenumber=request.getParameter("phonenumber");
String reason=request.getParameter("reason");
String status="pending";

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into leaves values(?,?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,date);
	ps.setString(4,phonenumber);
	ps.setString(5,reason);
	ps.setString(6,status);
	ps.executeUpdate();
	response.sendRedirect("EM_applyLeave.jsp?msg=valid");
}
catch(Exception e)
{
	response.sendRedirect("EM_applyLeave.jsp?msg=invalid");
}
%>
