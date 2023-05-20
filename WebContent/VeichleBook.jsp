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
<%@include file="header.jsp" %>
		 <div class="container" style="margin-left: 20%; padding-top:5%">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="updateveichleBook" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insertveichleBook" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit Veichle Booking
            		</c:if>
						<c:if test="${user == null}">
            			Add New Veichle Booking
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />

				</c:if>

				<fieldset class="form-group">
					<label>User  Name </label> 
					
					  <%-- input type="text" id="f-name"name="user" value="${user.user}" class="form-control"  placeholder="UserName" /> --%>
					
					<input type="text"
						value="<c:out value='${user.user}' />" class="form-control"
						name="user" required="required"> 
				</fieldset>

				<fieldset class="form-group">
					<label> Nic</label> 
					
					 <input type="text"
						value="<c:out value='${user.nic}' />" class="form-control"
						name="nic" pattern="[0-9]{9}[vVxX]|[0-9]{12}" required> 
						
						 <%-- <input type="text" id="nic"name="nic" value="${user.nic}" class="form-control"  placeholder="Nic" /> --%>
				</fieldset>

				<fieldset class="form-group">
					<label> Mobile </label> 
					
					<input type="text"
						value="<c:out value='${user.mobile}' />" class="form-control"
						name="mobile" pattern="[0-9]{10}" required>
						
						<%--  <input type="text" id="Mobile"name="mobile" value="${user.mobile}" class="form-control"  placeholder="Mobile" /> --%>
				</fieldset>
				<fieldset class="form-group">
					<label> Email</label>
				<input type="text"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email" required="required">
						
						<%--  <input type="text" id="email"name="email" value="${user.email}" class="form-control"  placeholder="Email" /> --%>
				</fieldset>

				<fieldset class="form-group">
					<label> Check In</label> 
					<input type="date"
						value="<c:out value='${user.checkin}' />" class="form-control"
						name="checkin">
						
<%-- 						 <input type="text" id="Check in"name="checkin" value="${user.checkin}" class="form-control"  placeholder="Check in" />
 --%>				
 </fieldset>

				<fieldset class="form-group">
					<label> Requsted Km</label> 
					<input type="number"
						value="<c:out value='${user.km}' />" class="form-control"
						name="noofkm"> 
						
<%-- 						 <input type="text" id="request km"name="noofkm" value="${user.km}" class="form-control"  placeholder="Request km" />
 --%>			
 	</fieldset>
						<fieldset class="form-group">
					<label> cost</label> 
					 <input type="text"
						value="<c:out value='${user.cost}' />" class="form-control"
						name="cost">
<%-- 						 <input type="text" id="Cost"name="cost" value="${user.cost}" class="form-control"  placeholder="	Cost" />
 --%>				
 </fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div> 
	
	<%-- <form action="insertuserveichleBook" method="post" class="form">
    <!-- First Name -->
    <div class="group">
        <div class="col-1">
            <label for="f-name">Username</label>
        </div>
        <div class="col-2">
            <input type="text" id="f-name"name="user" value="${user}"   placeholder="UserName" />
        </div>
    </div>
    <!-- Last Name -->
    <div class="group">
        <div class="col-1">
            <label for="l-name">NIC</label>
        </div>
        <div class="col-2">
            <input type="text" name="nic" id="l-name" placeholder="NIC number" />
        </div>
    </div>
    <!-- Password -->
    <div class="group">
        <div class="col-1">
            <label for="password">Mobile</label>
        </div>
        <div class="col-2">
            <input type="nmber" " name="mobile" placeholder="Mobile " />
        </div>
    </div>
    <!-- Email -->
    <div class="group">
        <div class="col-1">
            <label for="email">your email</label>
        </div>
        <div class="col-2">
            <input type="email" name="email" id="email" placeholder="example@email.com" />
        </div>
    </div>
   <div class="group">
        <div class="col-1">
            <label >Check In</label>
        </div>
        <div class="col-2">
            <input type="date" name="checkin"  />
        </div>
    </div>
     <div class="group">
        <div class="col-1">
            <label >No Of Km</label>
        </div>
        <div class="col-2">
            <input type="number" name="noofkm"  />
        </div>
    </div>
     <div class="group">
        <div class="col-1">
            <label for="email">Cost</label>
        </div>
        <div class="col-2">
            <input type="number" name="cost"  />
        </div>
    </div>
  
    <!-- Submit button -->
    <input type="submit" class="submit" value="submit" />
</form> --%>
</body>
</html>
