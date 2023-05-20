<html>
<head>
<title>Admin Login</title>
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
.navbar img{
height:100%;
width:100%;
}
.navbar .logo{
    width: 310px;
    height: 100px;
    cursor: pointer;
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
.center{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    height: 360px;
    background: white;
    border-radius: 10px;
}
.center h1{
    text-align: center;
    padding: 20px 0 20px 0;
    border-bottom: 1px solid silver;
}
.center form{
    padding: 0 40px;
    box-sizing: border-box;
}
form .form-group{
    position: relative;
    border-bottom: 2px solid #adadad;
    margin: 30px 0;
}
.form-group input{
    width: 100%;
    padding: 0 5px;
    height: 40px; 
    font-size: 16px;
    border: none;
    background: none;
    outline: none;
}
.form-group label{
    position: absolute;
    top: 50%;
    left: 5px;
    color: #adadad;
    transform: translateY(-50%);
    font-size: 16px;
    pointer-events: none;
    transition: 0.5s;
}
.form-group span::before{
    content: '';
    position: absolute;
    top: 40px;
    left: 0;
    width: 0;
    height: 2px;
    background: #FFA13B;
    transition: 00.5s;
}
.form-group input:focus ~ label,
.form-group input:valid ~ label{
    top: -5px;
    color: #FFA13B;
}
.form-group input:focus ~ span::before,
.form-group input:valid ~ span::before{
    width: 100%;
}
button[type="submit"]{
    width: 100%;
    height: 50px;
    border: 1px solid;
    background: #FFA13B;
    border-radius: 25px;
    font-size: 18px;
    color: #e9f4fb;
    font-weight: 700;
    cursor: pointer;
    outline: none;
}
button[type="submit"]:hover{
    border-color: #FFA13B;
    transition: .5s;
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

            <div class="center">
                <h1>Admin Login</h1>
                    <form action="EM_adminLoginAction.jsp" method="post">
                    <br>
                    <%
	String msg=request.getParameter("msg");
	if("invalid".equals(msg))
	{
	%>
	<center><font color="red" size="3">Invalid Username or Password</font></center>
	<%
	}%>
           
                <div class="form-group">
                    <input type="text" name="username" required>
                        <span></span>
                        <label>Username</label>
                </div>
                <div class="form-group">
                    <input type="password" name="password" required>
                        <span></span>
                        <label>Password</label>
                </div>
                    <button type="submit" class="button">Submit</button>
           
           </div>
	</div>

</body>
</html>