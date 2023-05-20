<%@page import="hotel.dbconnection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.Statement"%>
<%

String date=request.getParameter("date");
String reasons=request.getParameter("reasons");

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into holiday values(?,?)");
	ps.setString(1,date);
	ps.setString(2,reasons);
	ps.executeUpdate();
	response.sendRedirect("EM_addHoliday.jsp");
	
}
catch(Exception e)
{
	response.sendRedirect("EM_addHoliday.jsp");
}
%>
