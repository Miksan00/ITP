<%
String username=request.getParameter("username");
String password=request.getParameter("password");
if("admin".equals(username) && "admin".equals(password))
{
	response.sendRedirect("EM_adminHome.jsp");
	}
else
{
	response.sendRedirect("EM_adminLogin.jsp?msg=invalid");
	}
%>