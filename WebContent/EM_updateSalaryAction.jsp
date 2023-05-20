<%@ page import="hotel.dbconnection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String city=request.getParameter("city");
String phonenumber=request.getParameter("phonenumber");
String salary=request.getParameter("salary");
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update salaryinfo set id=?,name=?,city=?,phonenumber=?,salary=?");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,city);
	ps.setString(4,phonenumber);
	ps.setString(5,salary);
	ps.executeUpdate();
	response.sendRedirect("EM_salaryDetails.jsp?msg=valid");
}
catch(Exception e)
{
	response.sendRedirect("EM_salaryDetails.jsp?msg=valid");
	}
%>