<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "hotel";
String userid = "root";
String password = "";
String search = request.getParameter("search");



try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null; 
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>

<body>
	<div class="container" style="margin-left: 20%; padding-top: 5%">
	<%@include file="header.jsp"%>
<form class="form-inline" method="post" action="roombookingSearch.jsp">
<input type="text" name="search" class="form-control" placeholder="Search here....">
<button type="submit" name="save" class="btn btn-primary">Search</button>
</form>


<table class="table table-bordered">
			<thead>
				<tr>

					<th>User Name</th>
					<th>NIC</th>
					<th>Mobile</th>
					<th>Email</th>
					<th>Checkin</th>
					<th>CheckOut</th>
					<th>Members</th>
					<th>Advance PAyment</th>
					<th>Actions</th>
					
				</tr>
			</thead>
					<tbody>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql = "SELECT * FROM roomsbooking WHERE User LIKE '%" + search + "%' OR Nic LIKE '%" + search + "%' OR mobile LIKE '%" + search + "%' OR email LIKE '%" + search + "%'  OR checkin LIKE '%" + search + "%'   OR checkout LIKE '%" + search + "%' OR noofrooms LIKE '%" + search + "%' OR members LIKE '%" + search + "%'  ";
System.out.println(sql);
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
	int id = 9;
	System.out.println(id);
 %> 




<tr>
<td><%=resultSet.getString("User") %></td>
<td><%=resultSet.getString("Nic") %></td>
<td><%=resultSet.getString("mobile") %></td>

<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("checkin") %></td>
<td><%=resultSet.getString("checkout") %></td>
<td><%=resultSet.getString("noofrooms") %></td>
<td><%=resultSet.getString("members") %></td>
<c:forEach var="user" items="${listRoomBooking}">
<td><a href="editRoomBook?id=<%=resultSet.getInt("id")%>">Edit</a>
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <a href="deleteRoomBook?id=<%=resultSet.getInt("id")%>">Delete</a>
</td>

						
					</c:forEach>
</tr>
<%
} 
connection.close();
} catch (Exception e) {
e.printStackTrace(); 
}
%>
</table>
</div>
</body>

</html>