
<%@ page import="java.util.ArrayList" %>

<%@ page import="java.util.Arrays" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>

</head>

<body>

	<%@include file="header.jsp"%>
	<div class="container" style="margin-left: 20%; padding-top: 5%"
		>
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="updateroom" method="post" >
				
				</c:if>
				<c:if test="${user == null}">
					<form action="insertroom"  method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit Room
            		</c:if>
						<c:if test="${user == null}">
            			Add New Room
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>
				
				<fieldset class="form-group">
                    <label> Room Type</label>
                    <select class="form-control" name="roomtype" required="required">
                              <option value="">-- Select an Room type --</option>
                              <option value="Standard" <c:if test="${user.roomtype == 'Standard'}">selected</c:if>>Standard</option>
                              <option value="Luxury" <c:if test="${user.roomtype == 'Luxury'}">selected</c:if>>Luxury</option>
                              <option value="Deluxe" <c:if test="${user.roomtype == 'Deluxe'}">selected</c:if>>Deluxe</option>
                     </select>
                </fieldset>
				
				<fieldset class="form-group">
					<label> No Of Beds</label> 
					<input type="number"min="1" max="4"  name="nobeds"  required
						value="<c:out value='${user.nobeds}' />" class="form-control">
				</fieldset>

				<fieldset class="form-group">
				     <label>Facilities</label><br>
                         <%
                             ArrayList<String> facilities = new ArrayList<String>();
                             facilities.add("  AC  ");
                             facilities.add("  TV  ");
                             facilities.add("  Wifi  ");
                             facilities.add("  Mini-fridge  ");
                             facilities.add("  Iron  ");
                             facilities.add("  None  ");
                             String selectedFacilitiesStr = (String) request.getAttribute("selectedFacilities");
                             String[] selectedFacilities = new String[]{};
                             if (selectedFacilitiesStr != null) {
                             selectedFacilities = selectedFacilitiesStr.split(",");
                                 }
                             for (String facility : facilities) {
                         %>
                     <label>
                     <input type="checkbox" name="facilities"  value="<%= facility %>"
                         <% if (Arrays.asList(selectedFacilities).contains(facility)) { %>checked<% } %>
                     >
                         <%= facility %>
                     </label>
                         <% } %>
                </fieldset>
                
                <fieldset class="form-group">
				     <label>Foods</label><br>
                         <%
                         ArrayList<String> foods = new ArrayList<String>();
                         foods.add("  Fried Rice  ");
                         foods.add("  Kottu ");
                         foods.add("  None  ");
                             String selectedFoodsStr = (String) request.getAttribute("selectedFoods");
                             String[] selectedFoods = new String[]{};
                             if (selectedFoodsStr != null) {
                             selectedFoods = selectedFoodsStr.split(",");
                                 }
                             for (String food : foods) {
                         %>
                     <label>
                     <input type="checkbox" name="foods"  value="<%= food %>"
                         <% if (Arrays.asList(selectedFoods).contains(food)) { %>checked<% } %>
                     >
                         <%= food %>
                     </label>
                         <% } %>
                </fieldset>


				<fieldset class="form-group">
					<label> Cost Per Day</label> 
					<input type="number" min="1000"  name="cost" required="required"
						value="<c:out value='${user.cost}' />" class="form-control">
				</fieldset>

				<fieldset class="form-group">
					<label> Image</label> 
					<input type="file" class="form-control"	name="file"  > 
				</fieldset>
				<button type="submit" class="btn btn-success"  >Save</button>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	  function validateForm() {
		  console.log("test")
	      var checkboxes = document.querySelectorAll('input[name="facilities"]:checked');
	      if (checkboxes.length === 0) {
	         alert("Please select at least one option.");
	         return false;
	      }else{
	    	  window.location.href="/"
	      }
	      return true;
	   }
	  
	  
	  function validateForm() {
		  console.log("test")
	      var checkboxes = document.querySelectorAll('input[name="foods"]:checked');
	      if (checkboxes.length === 0) {
	         alert("Please select at least one option.");
	         return false;
	      }else{
	    	  window.location.href="/"
	      }
	      return true;
	   }
/* function validateForm() {
  var nobeds = document.forms["roomForm"]["nobeds"].value;
  var cost = document.forms["roomForm"]["cost"].value;
  console.log("test")
  
 
  
  /* var facilities = document.getElementsByName("facilities");
  var facilityChecked = false; */
  
/*   if (nobeds < 0) {
    alert("Number of beds cannot be negative.");
    return false;
  }
  
  if (cost < 0) {
    alert("Cost per day cannot be negative.");
    return false;
  }
  } */ 
  
  /* for (var i = 0; i < facilities.length; i++) {
    if (facilities[i].checked) {
      facilityChecked = true;
      break;
    }
  }
   */
  
</script>
	
</body>
</html>