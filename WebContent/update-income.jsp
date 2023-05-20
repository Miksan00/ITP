<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<link rel="stylesheet" href="css/universal_style.css">
	<title>Update Income</title>
<style>
* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 10px 10px;
}

.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background-color: dodgerblue;
  color: white;
}

.header-right {
  float: right;
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  }
}
</style>
</head>
<body>

<div class="header">
  <a href="#default" class="logo"><img Style="max-width:148px" src="images/v1.jpg"></a> 
  <div class="header-right">
    <a href="admin-view-income.jsp">View Income</a>
    <a href="admin-view-expense.jsp">View Expense</a>
    <a  href="admin-add-expense.jsp">Add Expense</a>
    <a class="active" href="admin-add-income.jsp">Add Income</a>

  </div>
</div>

<div class="container" style="max-width: 700px; max-height:1000px;  margin-top:20px; box-shadow: 5px 10px 18px #888888;">
		
		<br>
		
		<div>
			<form action="IncomeController" method="get">
			
				<input type="hidden" name="COMMAND" value="UPDATE">
				<input type="hidden" name="id" value="${INCOME.id}">
				
			
				<div class="form-group">
					<label for="inputName">Invoice ID: </label>
					<input type="text" id="inputIID" name="invoiceId" placeholder="Invoice ID" class="form-control" value="${INCOME.invoiceId}"required="required">	
				</div>
				
				<div class="form-group">
					<label for="inputAddress">Month: </label>
					<input type="text" id="Month" name="month" placeholder=" Enter Month" class="form-control" value="${INCOME.month}"required="required">
				</div>
				
				<div class="form-group">
					<label for="inputNIC">Division: </label>
					<input type="text" id="Division" name="division" placeholder="Enter  Division" class="form-control" value="${INCOME.division}"required="required">
				</div>
				
		
				<div class="form-group">
					<label for="inputMobile">Total: </label>
					<input type="number" id="Total" name="total" placeholder="Enter Total" class="form-control"value="${INCOME.total}" required="required">
				</div>
				<div class="form-group">
					<label for="inputRe">Remark: </label>
					<input type="text" id="inputRe" name="remark" placeholder="Enter  remark" class="form-control" value="${INCOME.remark}"required="required">
				</div>
				<%-- <div class="form-group">
					<label for="inputDOD">Date: </label>
					<input type="date" id="inputDOC" name="date" placeholder="Date " class="form-control" value="${INCOME.date}" required="required">
				</div>
	 --%>
				
				<div class="row">
					<div class="col text-center">
						<input type="submit" value="Update" class="btn btn-success btn-block">
						
					</div>
				</div>
					
			</form>
			
			<br>
			<div style="text-align:center; margin-bottom: 20px;">
				
				<button  class="btn btn-link" type="submit"><a href="admin-view-income.jsp">Back to List</a></button>
			</div>
			
			<br>
		</div>
		
	</div>
	
	<footer class="page-footer font-small navbar-dark bg-dark" style="color:#ffffff; left: 0; bottom: 0; width: 100%; margin-top: 20px;">
		<div class="footer-copyright text-center py-3">© 2023 Copyright</div>
	</footer>

</body>
</html>