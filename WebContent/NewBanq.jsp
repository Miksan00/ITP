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
					<form action="updatebanq" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insertbanq" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit Banquet Hall
            		</c:if>
						<c:if test="${user == null}">
            			Add Banquet Hall
            		</c:if>
					</h2>
				</caption>


				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Guest Name</label> <input type="text"
						value="<c:out value='${user.guest}' />" class="form-control"
						name="guest" required pattern="[A-Za-z0-9_\s]+"
						title="Please enter a valid guest name (letters, numbers, spaces, and underscores only)">
					<small class="text-muted">Please enter a valid guest name
						(letters, numbers, spaces, and underscores only).</small>
				</fieldset>

				<fieldset class="form-group">
					<label>Mobile</label> <input type="text"
						value="<c:out value='${user.mobile}' />" class="form-control"
						name="mobile" required pattern="[0-9]{10}"
						title="Please enter a 10-digit mobile number"> <small
						class="text-muted">Please enter a 10-digit mobile number.</small>
				</fieldset>

				<fieldset class="form-group">
					<label>Hall No</label> <select class="form-control"
						name="additional" required>
						<option value="" selected disabled>Select Hall No</option>
						<option value="Hall No 1"
							<c:if test="${user.additional == 'Hall No 1'}">selected</c:if>>Hall
							No 1</option>
						<option value="Hall No 2"
							<c:if test="${user.additional == 'Hall No 2'}">selected</c:if>>Hall
							No 2</option>
						<option value="Hall No 3"
							<c:if test="${user.additional == 'Hall No 3'}">selected</c:if>>Hall
							No 3</option>
					</select>
				</fieldset>
				<fieldset class="form-group">
					<label>Decorations</label>
					<div>
						<label> <input type="radio" name="decoration" value="yes"
							<c:if test="${user.decoration == 'yes'}">checked</c:if> required>
							Yes
						</label> <label> <input type="radio" name="decoration" value="no"
							<c:if test="${user.decoration == 'no'}">checked</c:if> required>
							No
						</label>
					</div>
				</fieldset>

				<fieldset class="form-group">
					<label>Date</label> <input type="date"
						value="<c:out value='${user.date}' />" class="form-control"
						name="Date" required>
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>