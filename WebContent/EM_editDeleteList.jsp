<%@ page import="hotel.dbconnection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Salary Details</title>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
@import
	url('http://fonts.googleapis.com/css2?family=Spartan:wght@100;200;300;400;500;600;700;800;900&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Spartan', sans-serif;
}

h1 {
	font-size: 50px;
	line-height: 64px;
	color: #222222
}

h2 {
	font-size: 46px;
	line-height: 54px;
	color: #222222
}

h4 {
	font-size: 20px;
	color: #222222
}

h6 {
	font-weight: 700;
	font-size: 12px;
}

p {
	font-size: 16px;
	color: #465B52;
	margin: 15px 0 20px 0;
}

.section-p1 {
	padding: 40px 80px;
}

.section-m1 {
	margin: 40px 0;
}

body {
	width: 100%;
}

#header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20px 80px;
	background-color: #F1F1F1;
	box-shadow: 0 0 20px rgba(48, 46, 77, 0.5);
	border-bottom-left-radius: 15px;
	border-bottom-right-radius: 15px;
}

#header .logo {
	height: 100px;
	width: 310px;
}

#header .logo {
	height: 100%;
	width: 100%;
}

#navbar {
	display: flex;
	align-items: center;
	justify-content: center;
}

#navbar li {
	list-style: none;
	padding: 0 20px;
	position: relative;
}

#navbar li a {
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	color: #1A1A1A
}

#navbar li a:hover, #navbar li a.active {
	color: #088178
}

#navbar li a:hover::after, #navbar li a.active::after {
	content: "";
	width: 30%;
	height: 2px;
	background: #088178;
	position: absolute;
	bottom: -4px;
	left: 20px;
}

.aa a {
	background-color: #cc3a3a;
	color: white;
	padding: 15px 20px;
	display: inline-block;
	text-align: center;
	margin: 30px 50px;
	margin-right: 1080px;
	border-radius: 30px;
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	transition: all 0.3s ease;
}

.aa button {
	background-color: #cc3a3a;
	color: white;
	padding: 15px 20px;
	display: inline-block;
	text-align: center;
	margin: 30px 50px;
	margin-right: 1080px;
	margin-top: 100px;
	border-radius: 30px;
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	transition: all 0.3s ease;
	top: 18%;
	left: 0;
	position: absolute;
	margin-left: 1235px;
}

.aa a:hover {
	transform: scale(1.05);
}

#employees {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 95%;
}

#employees td, #employees th {
	border: 1px solid #ddd;
	padding: 8px;
}

#employees tr:nth-child(even) {
	background-color: #f2f2f2;
}

#employees tr:hover {
	background-color: #ddd;
}

#employees th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #584242;
	color: white;
}

footer {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	background-color: #F1F1F1;
	box-shadow: 0 0 20px rgba(48, 46, 77, 0.5);
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
}

footer .col {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	margin-bottom: 20px;
}

footer.logo {
	margin-bottom: 30px;
}

footer h4 {
	font-size: 14px;
	padding-bottom: 20px;
}

footer p {
	font-size: 13px;
	margin: 0 0 8px 0;
	color: #222222;
}

footer a {
	font-size: 14px;
	text-decoration: none;
	color: #222;
	margin-bottom: 10px;
}

footer.Copyrights {
	width: 100%;
	text-align: center;
}

img {
	width: 100%;
	height: 100px;
}

#btnExport:hover {
	transform: scale(1.1);
	color: #fff;
	cursor: pointer;
}

/* Styles for the search input and button */
#search-input {
	padding: 5px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

#search-button {
	padding: 5px 10px;
	font-size: 16px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

/* Styles for the search results */
#results-list {
	margin-top: 20px;
	list-style: none;
	padding: 0;
}

#results-list li {
	margin-bottom: 5px;
	padding: 5px;
	background-color: #f2f2f2;
	border-radius: 5px;
}
</style>
</head>
<body>
	<section id="header">
		<a href="#"><img src="image/tulasimahal.png" alt="" width="130"
			class="logo"></a>
		<div>
			<ul id="navbar">

				<li><a href="EM_adminHome.jsp">Home</a></li>
				<li><a href="index.html">Logout</a></li>
			</ul>

		</div>
	</section>
	<div>
		<div class="aa">
			<a href="EM_addNewEmployee.jsp">Add New Employee</a>
		</div>
		<br> <input type="text" id="search-input" onkeyup="searchTable()"
			placeholder="Search...">

		<button id="search-button">Search</button>

		<div class="aa">
			<button type="button" id="btnExport" onclick="downloadPDF()"
				class="btn btn-primary">Generate Report</button>
		</div>
		<br>
	</div>

	<%
	String msg = request.getParameter("msg");
	if ("valid".equals(msg)) {
	%>
	<center>
		<font color="green" size="4">Successfully Updated</font>
	</center>
	<%
	}
	%>
	<%
	if ("invalid".equals(msg)) {
	%>
	<center>
		<font> color="red" size="4">Something went wrong! Try Again!</font>
	</center>
	<%
	}
	%>
	<%
	if ("deleted".equals(msg)) {
	%>
	<center>
		<font color="green" size="4">Successfully Deleted</font>
	</center>
	<%
	}
	%>
	<br>

	<center>
		<table id="employees">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Age</th>
				<th>City</th>
				<th>Gender</th>
				<th>Phone Number</th>
				<th>E-mail</th>
				<th>Possition</th>
				<th>Address</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<tr>
				<%
				try {
					Connection con = ConnectionProvider.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select *from employee");
					while (rs.next()) {
				%>
				<td><%=rs.getInt(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
				<td><a href="EM_updateEmployee.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
				<td><a href="EM_deleteEmployee.jsp?id=<%=rs.getString(1)%>">Delete</a></td>
			</tr>
			<%
			}
			} catch (Exception e) {
			System.out.println(e);
			}
			%>
		</table>
	</center>



	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<footer class="section-p1">
		<div class="col">
			<img class="logo" src="image/tulasimahal.png" alt="" width="100">

		</div>

		<div class="Copyrights">

			<h4>Copyrights</h4>
			<p>©2023 Batch SLIIT ITP Group TW21 Students</p>


		</div>

	</footer>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

	<script type="text/javascript">
		function downloadPDF() {
			console.log("click")
			// Get the HTML table element
			var table = document.getElementById("employees");

			// Use html2canvas to create an image of the table
			html2canvas(table).then(function(canvas) {
				// Get the image data
				var imgData = canvas.toDataURL("image/png");

				// Set up the PDF document definition
				var docDefinition = {
					content : [ {
						image : imgData,
						width : 500
					} ]
				};

				// Use pdfMake to create and download the PDF
				pdfMake.createPdf(docDefinition).download("employees.pdf");
			});
		}

		function searchTable() {
		
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("search-input");
			filter = input.value.toUpperCase();
			table = document.getElementById("employees");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1] 
				td1 = tr[i].getElementsByTagName("td")[2] 
				td2 = tr[i].getElementsByTagName("td")[3] 
				td3 = tr[i].getElementsByTagName("td")[4] 
				td4 = tr[i].getElementsByTagName("td")[5] 
				td5 = tr[i].getElementsByTagName("td")[6] 
				td6 = tr[i].getElementsByTagName("td")[7] 
				td7 = tr[i].getElementsByTagName("td")[8] 
				
/* 				console.log(td,"td5/*  */
 				if (td) {
					txtValue = td.textContent || td.innerText
					console.log(td2.textContent,"txtValue")
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						if (td) {
							txtValue = td1.textContent || td1.innerText
							console.log(td2.textContent,"txtValue")
							if (txtValue.toUpperCase().indexOf(filter) > -1) {
								tr[i].style.display = "";
							} else {
								if (td) {
									txtValue = td2.textContent || td2.innerText
									if (txtValue.toUpperCase().indexOf(filter) > -1) {
										tr[i].style.display = "";
									} else {
										if (td) {
											txtValue = td3.textContent || td3.innerText
											if (txtValue.toUpperCase().indexOf(filter) > -1) {
												tr[i].style.display = "";
											} else {
												if (td) {
													txtValue = td4.textContent || td4.innerText
													if (txtValue.toUpperCase().indexOf(filter) > -1) {
														tr[i].style.display = "";
													} else {
														if (td) {
															txtValue = td5.textContent || td5.innerText
															if (txtValue.toUpperCase().indexOf(filter) > -1) {
																tr[i].style.display = "";
															} else {
																if (td) {
																	txtValue = td6.textContent || td6.innerText
																	if (txtValue.toUpperCase().indexOf(filter) > -1) {
																		tr[i].style.display = "";
																	} else {
																		if (td) {
																			txtValue = td7.textContent || td7.innerText
																			if (txtValue.toUpperCase().indexOf(filter) > -1) {
																				tr[i].style.display = "";
																			} else {
																				tr[i].style.display = "none";
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}									}
								}
							}
						}					}
				}
			}
		}
	</script>
</body>
</html>