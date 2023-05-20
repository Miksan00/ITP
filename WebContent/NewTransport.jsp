<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	crossorigin="anonymous">
</head>
<body>

	<%@include file="header.jsp"%>
	<div class="container" style="margin-left: 20%; padding-top: 5%">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="updatetransport" method="post" >
				</c:if>
				<c:if test="${user == null}">
					<form action="inserttransport" method="post"  enctype="multipart/form-data">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit User
            		</c:if>
						<c:if test="${user == null}">
            			Add New User
            		</c:if>
					</h2>
				</caption>
				
				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				
				<fieldset class="form-group">
					<label>Passengers Count</label> <input type="number" min="1"
						value="<c:out value='${user.name}' />" class="form-control"
						name="veichlename" required="required">
				</fieldset>

				<fieldset class="form-group">
  <label>Vehicle Facilities</label>
  <div class="form-check">
    <input class="form-check-input" type="radio" name="facilities" id="ac" value="AC" <c:if test="${user.facilities == 'AC'}">checked</c:if>>
    <label class="form-check-label" for="ac">
      AC
    </label>
  </div>
  <div class="form-check">
    <input class="form-check-input" type="radio" name="facilities" id="non-ac" value="Non AC" <c:if test="${user.facilities == 'Non AC'}">checked</c:if>>
    <label class="form-check-label" for="non-ac">
      Non AC
    </label>
  </div>
</fieldset>



				<fieldset class="form-group">
					<label> cost Per Day</label> <input type="number" min="1"
						value="<c:out value='${user.cost}' />" class="form-control"
						name="cost" required="required">
				</fieldset>
				<fieldset class="form-group">
  				    <label> Vehicle type</label>
  			            <select name="type" class="form-control">
    		                <option value="type">--Select A Vehicle Type--</option>
     		                <option value="Car">Car</option>
     		                <option value="Van">Van</option>
    		                <option value="Bus">Bus</option>
  		                </select>
		        </fieldset>
				<fieldset class="form-group">
					<label> Image</label> <input type="file" class="form-control"
						name="file">
				
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>