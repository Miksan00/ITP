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
					<form action="update" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insert" method="post" enctype="multipart/form-data">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit Inventory
            		</c:if>
						<c:if test="${user == null}">
            			Add New Inventory
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
    <label> Inventory Name</label> 
    <input type="text" value="<c:out value='${user.inventoryname}' />" class="form-control" name="inventoryname" maxlength="25" required>
    <small class="form-text text-muted" id="charcount">Max 25 characters</small>
</fieldset> 

<script type="text/javascript">
    var input = document.querySelector('input[name="inventoryname"]');
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



				<fieldset class="form-group">
					<label> Supplier Name</label> <input type="text"
						value="<c:out value='${user.suppliername}' />"
						class="form-control" name="suppliername">
				</fieldset>

				<fieldset class="form-group">
    <label>Supplier ID</label> 
    <input type="text" value="<c:out value='${user.supllierid}' />" class="form-control" name="supllierid" unique>
</fieldset> 

				<fieldset class="form-group">
					<label> Supplier Date</label> <input type="date"
						value="<c:out value='${user.supplierdate}' />"
						class="form-control" name="supplierdate" required="required">
				</fieldset>

				<fieldset class="form-group">
<fieldset class="form-group">
    <label>Quantity</label> 
    <input type="text" value="<c:out value='${user.quantity}' />" class="form-control" name="quantity" id="input2" onkeypress="return isNumberKey(event)">
    <span id="quantityError" style="color: red;"></span>
</fieldset>

<script type="text/javascript">
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            document.getElementById("quantityError").textContent = "Quantity must be a number.";
            return false;
        }
        document.getElementById("quantityError").textContent = "";
        return true;
    }
</script>


				<fieldset class="form-group">
    <label> Price</label> 
    <input type="text" value="<c:out value='${user.price}' />" class="form-control" name="price" id="input1" onkeypress="return isNumberKey(event)">
</fieldset> 

<script type="text/javascript">
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
</script>



			


				<fieldset class="form-group">
					<label> <a href="javascript: void(0)" onClick="calc()">Calculate</a>Total
						Amount
					</label> <input type="number" name="total" id="output" value="<c:out value='${user.total}' />" >


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
<script>
	$("#input2,#input1").keyup(function() {

		$('#output').val($('#input1').val() * $('#input2').val());

	});
</script>