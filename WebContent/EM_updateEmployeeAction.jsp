<%@ page import="hotel.dbconnection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String age=request.getParameter("age");
String city=request.getParameter("city");
String phonenumber=request.getParameter("phonenumber");
String email=request.getParameter("email");
String address=request.getParameter("address");
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update employee set name=?,age=?,city=?,phonenumber=?,email=?,address=? where id=?");
	ps.setString(1,name);
	ps.setString(2,age);
	ps.setString(3,city);
	ps.setString(4,phonenumber);
	ps.setString(5,email);
	ps.setString(6,address);
	ps.setString(7,id);
	ps.executeUpdate();
	response.sendRedirect("EM_editDeleteList.jsp?msg=valid");
}
catch(Exception e)
{
	response.sendRedirect("EM_editDeleteList.jsp?msg=valid");
	}
%>