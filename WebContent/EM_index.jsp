<html>

<head>
<title>Employee Management System</title>
<style>

*{
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}
.banner{
	width: 100%;
	height: 100vh;
	background-image: linear-gradient(rgba(0,0,0,0.50),rgba(0,0,0,0.50)),url(image/background.jpg);
	background-size: cover;
	background-position: center;
}
.navbar{
    width: 85%;
    margin: auto;
    padding: 35px 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.navbar .logo{
    width: 310px;
    height: 100px;
    cursor: pointer;
}
.navbar img{
    width: 100%;
    height: 100%;
    
}
.navbar ul li{
    list-style: none;
    display: inline-block;
    margin: 0 20px;
    position: relative;
}
.navbar ul li a{
    text-decoration: none;
    color: white;
    text-transform: uppercase;
}
.navbar ul li::after{
    content: '';
    height: 3px;
    width: 0;
    background: #FFA13B;
    position: absolute;
    left: 0;
    bottom: -10px;
    transition: 0.5s;
}
.navbar ul li:hover::after{
    width: 100%;
}

.content{
    width: 100%;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    text-align: center;
    color: white;
}
.content h1{
    font-size: 30px;
    margin-top: 80px;
}
button{
    width: 200px;
    padding: 15px 0;
    text-align: center;
    margin: 20px 10px;
    border-radius: 25px;
    font-weight: bold;
    border: 2px solid #FFA13B;
    background: transparent;
    color: #fff;
    cursor: pointer;
    position: relative;
    overflow: hidden;
}
span{
    background: #FFA13B;
    height: 100%;
    width: 0;
    border-radius: 25px;
    position: absolute;
    left: 0;
    bottom: 0;
    z-index: -1;
    transition: 0.5s;
}
button:hover span{
    width: 100%;
}
button:hover{
    border: none;
}

</style>
</head>
<body>

	<div class="banner">
		<div class="navbar">
            <img src="image/tulasimahal.png" class="logo">
            <ul>
                <li><a href="EM_index.jsp">Home</a></li>
                <li><a href="EM_adminLogin.jsp">Admin</a></li>
                <li><a href="EM_employeeLogin.jsp">Employee</a></li>
            </ul>
        </div>

        <div class="content">
            <h1>WELCOME TO EMPLOYEE MANAGEMENT SYSTEM</h1>
        <div>
            <button type="button" onclick="document.location='EM_adminLogin.jsp'"><span></span>ADMIN</button>
            <button type="button" onclick="document.location='EM_employeeLogin.jsp'"><span></span>EMPLOYEE</button>
        </div>
        </div>
	</div>

</body>
</html>