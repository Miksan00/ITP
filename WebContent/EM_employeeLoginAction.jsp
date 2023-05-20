<%
String username=request.getParameter("username");
String password=request.getParameter("password");
if("employee".equals(username) && "employee".equals(password))
{
	response.sendRedirect("EM_employeeHome.jsp");	
	}
else
{
	response.sendRedirect("EM_employeeLogin.jsp?msg=invalid");
	}
%>