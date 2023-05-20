<%@page import="hotel.dbconnection.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.Statement"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String age=request.getParameter("age");
String city=request.getParameter("city");
String gender=request.getParameter("gender");
String phonenumber=request.getParameter("phonenumber");
String email=request.getParameter("email");
String position=request.getParameter("position");
String address=request.getParameter("address");

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,age);
	ps.setString(4,city);
	ps.setString(5,gender);
	ps.setString(6,phonenumber);
	ps.setString(7,email);
	ps.setString(8,position);
	ps.setString(9,address);
	ps.executeUpdate();
	response.sendRedirect("EM_addNewEmployee.jsp?msg=valid");
}
catch(Exception e)
{
	response.sendRedirect("EM_addNewEmployee.jsp?msg=invalid");
}
%>
