<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- Font-->
	<link rel="stylesheet" type="text/css" href="css/montserrat-font.css">
	<link rel="stylesheet" type="text/css" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
	<!-- Main Style Css -->
    <link rel="stylesheet" href="Books/css/style.css"/>
</head>
<body class="form-v10">
	<div class="page-content">
		<div class="form-v10-content">
			<form class="form-detail" action="insertuserRoomBook" method="post" >
				<div class="form-left">
					<h2>General Infomation 	<h3 value="${user} " ReadOnly> </h3></h2>
				
					<div class="form-group">
										
						<div class="form-row form-row-1">
							<input type="text" value="${user}"  name="user" placeholder="User Name" >
						</div>
						<div class="form-row form-row-2">
							<input type="text" name="nic" id="l-name" placeholder="NIC number" pattern="[0-9]{9}[vVxX]|[0-9]{12}"  maxlength="12" required/>
						</div>
					</div>
				
					<div class="form-row">
					<label>Check In</label>
						<input type="date" name="checkin"   required>
					</div>

					<div class="form-row">
					<label>Check Out</label>
						<input type="date" name="checkout"   required>
					</div>
					<div class="form-row">
						<input type="number" name="noofrooms" min="1" max="4" placeholder="No Of Rooms" required>
					</div>
					<div class="form-row">
						<input type="number" name="members" min="1" placeholder="Staying Total members" required>
					</div>

					<div class="form-row">
						<input type="number" name="advancedPayment" min="1000" placeholder="Payment" required>
					</div>  
					
				</div>
				<div class="form-right">
					<h2>Contact Details</h2>
					
					<div class="form-row">
						<input type="tel" name="mobile" id="mobile" class="input-text" required placeholder="Your Mobile Number"  maxlength="10" minlength="10" onkeyup="validateMobile(this)" >
					</div>
				
					
					<div class="form-row">
						<input type="text" name="email" id="your_email" class="input-text" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" placeholder="Your Email">
					</div>
					<div class="form-checkbox">
						<label class="container"><p>I do accept the <a href="#" class="text">Terms and Conditions</a> of your site.</p>
						  	<input type="checkbox" name="checkbox" required >
						  	<span class="checkmark"></span>
						</label>
					</div>
					<div class="form-row-last">
						<input type="submit" name="register" class="register" value="Book Now">
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<script>
  // Get the phone number input element
  const phoneInput = document.getElementById('mobile');

  // Add an event listener for when the input loses focus
  phoneInput.addEventListener('blur', () => {
    // Get the input value and remove any non-digit characters
    const phoneNumber = phoneInput.value.replace(/\D/g, '');
    
    // Check if the phone number is 10 digits long
    if (phoneNumber.length !== 10) {
      // Display an error message and reset the input value
      phoneInput.setCustomValidity('Please enter a 10-digit phone number');
      phoneInput.value = '';
    } else {
      // Clear any previous error message
      phoneInput.setCustomValidity('');
    }
  });
  
//Get the check-in and check-out input elements
  const checkinInput = document.getElementsByName('checkin')[0];
  const checkoutInput = document.getElementsByName('checkout')[0];

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
  
  function validateMobile(input) {
	  // Remove any non-numeric characters from the input
	  input.value = input.value.replace(/\D/g, '');
	}

  
</script>
	
	
</body>
</html>