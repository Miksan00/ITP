<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<link rel="stylesheet" href="css/universal_style.css">
	<title>Add Income</title>
<style>
* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  background-image: url('images/bg.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
   
  
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
<div class="container"  style=" display: flex;
  justify-content: center;">
			<h2 style="font-family:courier;"><b>Add Income</b></h2>
		</div>

<div class="container" style="max-width: 700px; max-height:1000px;  margin-top:20px; box-shadow: 5px 10px 18px #888888;background: #08877;">
		
		<br>
		<div class="form-group">
					<% 
	             		String str=(String)request.getAttribute("msg");
					String str1=(String)request.getAttribute("error");
					
	            	%><%
	            	if(str!=null){
	            	%> 
	            		<h4 style="color: green; text-align: center;"> <%=str%></h4>
	            		
	            	<%
	            	}
	            	%>
	            	 
	            	<%
	            	 if(str1!=null){
	            	%> 
	            		<h4 style="color: red; text-align: center;"> <%=str1%></h4>
	            		
	            	<%
	            	}
	            	%>
	            	</div>
	            	
		<div>
			<form action="IncomeController" method="get">
			
				<input type="hidden" name="COMMAND" value="ADD">
				
			
				<div class="form-group">
					<label for="inputName">Invoice ID: </label><br>
					<textarea id="invoiceID" name="invoiceId" rows="1" cols="31">
					</textarea>
					<button id="generate" style = "display: flex; justify-content:flex-end">Generate</button>
					
				</div>
				
				<div class="form-group">
				<label>Choose Month:<br>
					<input placeholder="Choose Month" list="months" name="month" style="width:670px" required="required"></label>
						<datalist id="months">
  						<option value="January">
  						<option value="February">
  						<option value="March">
  						<option value="April">
  						<option value="May">
  						<option value="June">
  						<option value="July">
  						<option value="Augest">
  						<option value="September">
  						<option value="October">
  						<option value="November">
  						<option value="December">
						</datalist>
				</div>
				
							
				<div>
				<label>Division:<br><br>
				
				<fieldset >
      <div class="some-class" >
        <input type="radio" id="Banquet" name="division" value="Banquet" required="required">
        <label for="y">Banquet</label>
        <input type="radio" id="HotelRoom" name="division" value="Hotel Room" required="required">
        <label for="z">Hotel Room</label>
        <input type="radio" id="Transport" name="division" value="Transport" required="required">
        <label for="z">Transport</label>
        <input type="radio" id="Inventory" name="division" value="Inventory" required="required" >
        <label for="z">Inventory</label>
      </div>
    </fieldset>
				</div>
				
			<!-- 	<div class="form-group">
					<label for="inputNIC">Division: </label><br>
					<input type="radio" id="Banquet" name="division" value="Banquet" >
  					<label for="Marriage">Banquet</label><br>
  					<input type="radio" id="HotelRoom" name="division" value="Hotel Room" >
  					<label for="HotelRoom" >Hotel Room</label><br>	
  					<input type="radio" id="Transport" name="division" value="Transport" >
  					<label for="Transport" >Transport</label><br>
					<input type="radio" id="Inventory" name="division" value="Inventory" >
  					<label for="Inventory" >Inventory</label><br>
				</div>	 -->	
				
				<div class="form-group">
					<label for="inputTotal">Total: </label>
					<input type="number" id="tot_amount" name="total"  placeholder="Enter Total" class="form-control" required="required" >
				</div>
				<div class="form-group">
					<label for="inputRemarks">Remarks: </label>
					<input type="text" id="Remarks" name="remark" placeholder="Enter Remarks" class="form-control" required="required" >
				</div>
				<div class="form-group">
					<label for="inputDOD">Date: </label>
					<input type="date" id="inputDOC" name="date" placeholder="Date " class="form-control" required="required">
				</div>
				
				<div class="row">
					<div class="col text-center">
						<input type="submit" value="Add Income" class="btn btn-success btn-block">
						<input type="submit" value="Draft" class="btn btn-warning btn-block">
					</div>
				</div>
					
			</form>
			
			<br>
			<div style="text-align:center; margin-bottom: 20px;">
				<c:url var="listLink" value="IncomeController">
					<c:param name="COMMAND" value="LIST"/>
				</c:url>
				<button  class="btn btn-link" type="submit"><a href="${listLink}">Back to List</a></button>
			</div>
			
			<br>
		</div>
		
	</div>
	
	<footer class="page-footer font-small navbar-dark bg-dark" style="color:#ffffff; left: 0; bottom: 0; width: 100%; margin-top: 20px;">
		<div class="footer-copyright text-center py-3">© 2023 Copyright</div> 
	</footer>

<script type="text/javascript">

(function() {
	 function IDGenerator() {
	 
		 this.length = 4;
		 this.timestamp = +new Date;
		 
		 var _getRandomInt = function( min, max ) {
			return Math.floor( Math.random() * ( max - min + 1 ) ) + min;
		 }
		 
		 this.generate = function() {
			 var ts = this.timestamp.toString();
			 var parts = ts.split( "" ).reverse();
			 var id = "";
			 
			 for( var i = 0; i < this.length; ++i ) {
				var index = _getRandomInt( 0, parts.length - 1 );
				id += parts[index];	 
			 }
			 
			 return id;
		 }

		 
	 }
	 
	 
	 document.addEventListener( "DOMContentLoaded", function() {
		var btn = document.querySelector( "#generate" ),
			output = document.querySelector( "#invoiceID" );
			
		btn.addEventListener( "click", function() {
			var generator = new IDGenerator();
			output.innerHTML = generator.generate();
			
		}, false); 
		 
	 });
	 
	 
})();
	</script>	
</body>
</html>