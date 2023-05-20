<%@ page import="hotel.dbconnection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String id=request.getParameter("id");
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from salaryinfo where id='"+id+"'");
	response.sendRedirect("EM_salaryDetails.jsp?msg=deleted");
}
catch(Exception e)
{
	response.sendRedirect("EM_salaryDetails.jsp?msg=deleted");
	}

%>