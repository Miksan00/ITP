<%@ page import="hotel.dbconnection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String id=request.getParameter("id");
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from employee where id='"+id+"'");
	response.sendRedirect("EM_editDeleteList.jsp?msg=deleted");
}
catch(Exception e)
{
	response.sendRedirect("EM_editDeleteList.jsp?msg=deleted");
	}

%>