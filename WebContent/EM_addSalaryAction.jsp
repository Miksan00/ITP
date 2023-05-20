<%@page import="hotel.dbconnection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.Statement"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String city=request.getParameter("city");
String phonenumber=request.getParameter("phonenumber");
String position=request.getParameter("position");
String salary=request.getParameter("salary");

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into salaryinfo values(?,?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,city);
	ps.setString(4,phonenumber);
	ps.setString(5,position);
	ps.setString(6,salary);
	ps.executeUpdate();
	response.sendRedirect("EM_addSalary.jsp?msg=valid");
}
catch(Exception e)
{
	response.sendRedirect("EM_addSalary.jsp?msg=invalid");	
}
%>
