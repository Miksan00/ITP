<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

    

</head>
<body>
<%@include file="header.jsp" %>
		<div class="container" style="margin-left: 20%; padding-top:5%">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="updateRoomBook" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insertRoomBook" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit Booking
            		</c:if>
						<c:if test="${user == null}">
            			Add New Booking
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Full Name</label> 
					<input type="text" class="form-control" name="user" value="<c:out value='${user.user}' />" required>
					<small class="form-text text-muted" id="charcount">Max 25 characters</small>
					
					<c:if test="${not empty errorMap.user}">
						<p class="text-danger"><c:out value="${errorMap.user}"/></p>
					</c:if>
					
					<script type="text/javascript">
    var input = document.querySelector('input[name="user"]');
    var charcount = document.querySelector('#charcount');

    input.addEventListener('input', function() {
        if (input.value.length > 25) {
            input.value = input.value.slice(0, 25);
            charcount.textContent = 'Max 25 characters';
        } else {
            charcount.textContent = (25 - input.value.length) + ' characters left';
        }
    });
</script>
					
				</fieldset>

				<fieldset class="form-group">
					<label>NIC</label> 
					<input type="text" class="form-control" name="nic" pattern="[0-9]{9}[vVxX]|[0-9]{12}"  maxlength="12" value="<c:out value='${user.nic}' />" required >
					<c:if test="${not empty errorMap.nic}">
						<p class="text-danger"><c:out value="${errorMap.nic}"/></p>
					</c:if>
				</fieldset>

				<fieldset class="form-group">
					<label> Mobile</label> 
					<input type="tel"
						value="<c:out value='${user.mobile}' />" class="form-control"
						name="mobile" pattern="[0-9]{10}" maxlength="10" minlength="10" onkeyup="validateMobile(this)" required="required">
					<small class="text-muted">Please enter a valid 10 digit phone number.</small>
				</fieldset>
				
				<fieldset class="form-group">
					<label> Email</label> <input type="email"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email" required="required">
						<small class="text-muted">Please enter a valid email address.</small>
				</fieldset>
				
				<fieldset class="form-group">
					<label>Check In</label> <input type="date"
						value="<c:out value='${user.checkin}' />" class="form-control"
						name="checkin" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label> Check Out</label> <input type="date"
						value="<c:out value='${user.checkout}' />" class="form-control"
						name="checkout">
				</fieldset>

				<fieldset class="form-group">
					<label> No of Rooms</label> <input type="number"
						value="<c:out value='${user.noofrooms}' />" class="form-control"
						name="noofrooms" min="1" max="4" required="required">
						<small class="text-muted">Maximum 4 rooms allowed per booking.</small>
				</fieldset>
				
				<fieldset class="form-group">
					<label> Total Members</label> <input type="number"
						value="<c:out value='${user.members}' />" class="form-control"
						name="members" min="1" required="required">
						<small class="text-muted">Please enter a value greater than or equal to 1.</small>
				</fieldset>
				
					<fieldset class="form-group">
					<label> AdvancedPayment</label> <input type="number"
						value="<c:out value='${user.advancedPayment}' />" class="form-control"
						name="AdvancedPayment" min="1000" required="required">
						<small class="text-muted">Minimum payment required: Rs. 1000. You may choose to pay more if you wish.</small>
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
	
	<script>
    
        function validateMobile(input) {
        	
  	    // Remove any non-numeric characters from the input
  	    input.value = input.value.replace(/\D/g, '');
  	    }
          
		// validate mobile number
	//	function validateMobile() {
		//	var mobile = document.getElementById("mobile").value;
		//	var pattern = /^\d{10}$/;
		//	if (pattern.test(mobile)) {
		//		document.getElementById("mobileErr").innerHTML = "";
		//		return true;
		//	}
		//	else {
		//		document.getElementById("mobileErr").innerHTML = "Invalid mobile number";
		//		return false;
		//	}
		//}

		// validate email
		function validateEmail() {
			
			var email = document.getElementById("email").value;
			var pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			if (pattern.test(email)) {
				document.getElementById("emailErr").innerHTML = "";
				return true;
			}
			else {
				document.getElementById("emailErr").innerHTML = "Invalid email address";
				return false;
			}
		}
		
		
		//Get the check-in and check-out input elements
		const checkinInput = document.getElementsByName('checkin')[0];
		const checkoutInput = document.getElementsByName('checkout')[0];
			console.log(checkinInput,checkoutInput,"dates")
		// Add an event listener for when the check-in input changes
	  checkinInput.addEventListener('change', () => {
	  
    // Get the check-in and check-out dates as Date objects
    const checkinDate = new Date(checkinInput.value);
    const checkoutDate = new Date(checkoutInput.value);
    
    // Check if the check-out date is before the check-in date
    if (checkoutDate < checkinDate) {
      // Display an error message and reset the check-out input value
      checkoutInput.setCustomValidity('Check-out date must be after check-in date');
      checkoutInput.value = '';
    } else {
      // Clear any previous error message
      checkoutInput.setCustomValidity('');
    }
    
    // Check if the check-in date is before today's date
    const today = new Date();
    today.setHours(0, 0, 0, 0); // Set the time to midnight to compare date only
    if (checkinDate < today) {
      // Display an error message and reset the check-in input value
      checkinInput.setCustomValidity('Check-in date must be today or after today');
      checkinInput.value = '';
    } else {
      // Clear any previous error message
      checkinInput.setCustomValidity('');
    }
  });


		// Add an event listener for when the check-out input changes
		checkoutInput.addEventListener('change', () => {
		  // Get the check-in and check-out dates as Date objects
		  const checkinDate = new Date(checkinInput.value);
		  const checkoutDate = new Date(checkoutInput.value);
		
		  // Check if the check-out date is before the check-in date
		  if (checkoutDate < checkinDate) {
		    // Display an error message and reset the check-out input value
		    checkoutInput.setCustomValidity('Check-out date must be after check-in date');
		    checkoutInput.value = '';
		  } else {
		    // Clear any previous error message
		    checkoutInput.setCustomValidity('');
		  }
		});

		
		

		// validate number of rooms
		function validateNoOfRooms() {
			var noOfRooms = document.getElementById("noofrooms").value;
			if (noOfRooms >= 1) {
				document.getElementById("noOfRoomsErr").innerHTML = "";
				return true;
			}
			else {
				document.getElementById("noOfRoomsErr").innerHTML = "Number of rooms cannot be zero or negative";
				return false;
			}
		}

		// validate total members
		function validateTotalMembers() {
			var totalMembers = document.getElementById("members").value;
			if (totalMembers >= 1) {
				document.getElementById("totalMembersErr").innerHTML = "";
				return true;
			}
			else {
				document.getElementById("totalMembersErr").innerHTML = "Total members cannot be zero or negative";
				return false;
			}
		}

		// validate advance payment
		function validateAdvancePayment() {
			var advancePayment = document.getElementById("advancePayment").value;
			if (advancePayment >= 1000) {
				document.getElementById("advancePaymentErr").innerHTML = "";
				return true;
			}
			else {
				document.getElementById("advancePaymentErr").innerHTML = "Advance payment cannot be less than 1000";
				return false;
			}
		}

		// validate form
		function validateForm() {
			var mobileValid = validateMobile();
			var emailValid = validateEmail();
			var noOfRoomsValid = validateNoOfRooms();
			var totalMembersValid = validateTotalMembers();
			var advancePaymentValid = validateAdvancePayment();
			return mobileValid && emailValid && noOfRoomsValid && totalMembersValid && advancePaymentValid;
		}
	</script>
	
	
</body>
</html>