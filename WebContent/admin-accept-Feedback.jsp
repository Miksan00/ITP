<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<link rel="stylesheet" href="css/universal_style.css">
	<title>Comment List</title>
</head>
<body>

	<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="RoomController"><img Style="max-width:148px;" src="images/Logo.jpg"></a>
			
			<ul class="navbar-nav">
				
				<li class="nav-item">
					<c:url var="logoutLink" value="UserController">
						<c:param name="command" value="LOGOUT"/>
					</c:url>
					<a class="nav-link" href="${logoutLink}" style="color: #F1F1F1;"><i class="fas fa-sign-out-alt"></i> Logout</a>
				</li>
				
				<li class="nav-item">
					<c:url var="listLink" value="AdminAcceptController">
					<c:param name="COMMAND" value="LIST"/>
				</c:url>
			<a class="nav-link" href="${listLink}" style="color: #F1F1F1;"><i class="fas fa-sign-out-alt"></i> Load </a>
				</li>
				
					<li class="nav-item">
					<c:url var="listLink" value="AdminFeedbackController">
					<c:param name="COMMAND" value="LIST"/>
				</c:url>
			<a class="nav-link" href="${listLink}" style="color: #F1F1F1;"><i class="fas fa-sign-out-alt"></i> Accepted Comments</a>
				</li>
				
			</ul>
		</div>
	</nav>
	
	<nav class="navbar navbar-light" style="background-color:#070AAD;">
		<div class="container">
			<h2>Accepting Comments</h2>
		</div>
	</nav>
	
	<div class="container" style="text-align:center; padding-top: 10px;">
	
		<div class="row">
			<div class="col-sm-6">
				<form action="AdminFeedbackController" method="get" class="form-horizontal" style="padding: 10px 0 10px 0;">
					<div class="input-group">
						<input type="hidden" class="form-control" name="COMMAND" value="SEARCH"/>			    
						<input type="text" class="form-control" placeholder="Search" name="theSearchName">
						<div class="input-group-append">
							<c:url var="searchLink" value="AdminFeedbackController">
								<c:param name="COMMAND" value="SEARCH"/>
							</c:url>
							<button type="submit" class="btn btn-success" value="Search"><a href="${searchLink}" style="color: #ffffff; text-decoration: none;">Go</a></button> 
						</div>
					</div>
				</form>	
			</div>
			
			<div class="col-sm-6" style="padding: 10px 15px 10px 15px;">
				<c:url var="checkLink" value="AdminFeedbackController">
					<c:param name="COMMAND" value="CHECK"/>
				</c:url>
				<a href="${checkLink}" class="btn btn-success btn-block">Add Comment</a>
			</div>
		</div>  
	  	
	    <br>
		
		<div class="table-responsive" >
			<table id="tab-01" class="table table-striped table-hover" style="width:150%;">
				<thead style="background-color: #007bff; color:#ffffff;">
					<tr>
						<th>Full Name</th>
						<%-- <th>Nick Name</th> --%>
						<th>Comment</th>
						<th>Date </th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Action</th>
					</tr>
				</thead>
				
				<tbody>
				
					<c:forEach var="tempItem" items="${ ROOM_LIST }">
						<c:url var="updateLink" value="AdminAcceptController">
							<c:param name="COMMAND" value="ACCEPT"/>
							<c:param name="id" value="${tempItem.id}"/>
						</c:url>
						<c:url var="deleteLink" value="AdminAcceptController">
							<c:param name="COMMAND" value="DENIED"/>
							<c:param name="id" value="${tempItem.id}"/>
						</c:url>
						<tr>
							<td> ${tempItem.fullName} </td>
							<%-- <td> ${tempItem.nickName} </td>--%>
							<td> ${tempItem.comment} </td>
							<td> ${tempItem.date} </td>
							<td> ${tempItem.email} </td>
							<td> ${tempItem.mobile} </td>
							<td>
								<a href="${updateLink}" style="color:green;">Accept</a>
								|
								<a href="${deleteLink}" style="color:red;">Denied</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>

				</table>
				</div>
				
				<br>
				<button type="button" id="btnExport" class="btn btn-primary" Style="float:right">Report</button>
			</div>
			
			
			
	<footer class="page-footer font-small navbar-dark bg-dark" style="color:#ffffff; position: fixed; left: 0; bottom: 0; width: 100%;">
		<div class="footer-copyright text-center py-3">� 2023 Copyright</div>
	</footer>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    <script type="text/javascript">
        $("body").on("click", "#btnExport", function () {
            html2canvas($('#tab-01')[0], {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("Comment-details.pdf");
                }
            });
        });
    </script>
	
</body>
</html>