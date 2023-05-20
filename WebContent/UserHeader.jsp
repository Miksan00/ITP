a

<body>
	<!-------HIDDEN NAV SIDEBAR MENU------->
	<div id="menu-container">
		<div id="button-pinMenu">
			<div id="icon-hamburger">
				<span class="hamburger-line" id="line1"></span>
				<span class="hamburger-line"  id="line2"></span>
				<span class="hamburger-line"  id="line3"></span>
			</div>
		</div>
		<!-- <img id="nav-logo" src="https://jacobscottmedia.businesscatalyst.com/images/nav-logo.svg"></img> -->
		<a class="link-container" href="">
			<div class="menu-links">Home</div>
		</a>
		<a class="link-container" href="listuserres">
			<div class="menu-links">Restaurant </div>
        </a>
        <a class="link-container" href="listUserRoomBook">
			<div class="menu-links">Room Service </div>
        </a>

        <a class="link-container" href="">
			<div class="menu-links">Veichle Service</div>
		</a>

		<a class="link-container" href="listuserbanq">
			<div class="menu-links">Banquet service</div>
        </a>
        
       
		<a class="link-container" href="">
			<div class="menu-links">LogOut</div>
		</a>
	
	</div>
<!-------PAGE------->
<div class="page">
</div>


</body>




<style>
    @accent1: #d93232;
@accent1dark: #a61f1f;
body {

	background: #0a0a0a url no-repeat fixed bottom;
	background-size: cover;
	padding: 0px;
	margin: 0px;
}
#button-pinMenu {
	width: 64px;
	height: 64px;
	padding-right: 0px;
	padding-bottom: 0px;
	background: #1a1a1a;
	border-top-right-radius: 0px;
	border-bottom-right-radius: 16px;
	display: inline block;
	right: 0px;
	position: relative;
	transition: all 0.25s ease;
   cursor: pointer;
}

#button-pinMenu.change {
	background: @accent1;
	padding-right: 16px;
	border-radius: 16px;
	border-top-left-radius: 0%;
	border-top-right-radius: 0%;
	border-bottom-left-radius: 0%;
	transition: inherit inherit inherit;
}

#icon-hamburger {
	position: relative;
	top: 30%;
	margin-left: 25%;
	margin-right: 25%;
	display: block;
}

.hamburger-line {
	width: 32px;
	height: 5px;
	background: white;
	display: block;
	margin-bottom: 5px;
	transform-origin: 50% 50%;
	opacity: 1.0;
	transition: transform 0.25s ease, opacity 0.25s ease, margin-left 0.25s ease, width 0.275s ease;
}

#line1 {
	bottom: 3px;
}

#line3 {
	top: 3px;
}

#icon-hamburger.change > .hamburger-line {
	margin-left: 50%;
}

#icon-hamburger.change > #line1 {
	transform: rotate(45deg) translatey(14px);
	opacity: 1.0
}

#icon-hamburger.change > #line2 {
	width: 0px;
	opacity: 0.0;
}

#icon-hamburger.change > #line3 {
	transform: rotate(-45deg) translatey(-14px);
	opacity: 1.0;
}



#nav-logo {
	position: relative;
	display: block;
	width: inherit;
	height: 128px;
	margin-top: 16px;
	margin-bottom: 16px;
}

#menu-container > #nav-logo {
  visibility: hidden;
  overflow: hidden;
  display: block;
  transform: translatey(-250%);
  transition: visibility 0.5s ease-in-out, transform 0.5s cubic-bezier(.3,.65,.44,1);
  transition-delay: 0s;
}

#menu-container:hover > #nav-logo {
  visibility: visible;
  overflow: hidden;
  display: block;
  transform: translatex(0%);
  transition: visibility 0.5s ease-in-out, transform 0.5s cubic-bezier(.3,.65,.44,1);
  transition-delay: 0s;
}
#menu-container.hover > #nav-logo {
  visibility: visible;
  overflow: hidden;
  display: block;
  transform: translatex(0%);
  transition: visibility 0.5s ease-in-out, transform 0.5s cubic-bezier(.3,.65,.44,1);
  transition-delay: 0s;
}

#menu-container {
  position: fixed;
  display: block;
  padding: 0px;
  width: 0px;
  height: 100%;
  background: #1a1a1a;
  opacity: 0.75;
  border-right: 3px solid transparent;
  transition: width 0.5s cubic-bezier(.3,.65,.44,1), padding 0.25s ease-in-out, background 0.65s ease, opacity 0.25s ease;
  transition-delay: 0.35s;
}

#menu-container:hover {
  position: fixed;
  display: block;
  padding: 0px;
  width: 300px;
  height: 100%;
  background: #1a1a1a;
  opacity: 1;
  transition: inherit inherit inherit;
  transition-delay: 0s;
}
#menu-container.hover{
  position: fixed;
  display: block;
  padding: 0px;
  width: 300px;
  height: 100%;
  background: #1a1a1a;
  opacity: 1;
  transition: inherit inherit inherit;
  transition-delay: 0s;
}

#menu-container > .link-container {
  visibility: hidden;
  overflow: hidden;
  display: block;
  transform: translatex(-150%);
  transition: visibility 0.5s ease-in-out, transform 0.5s cubic-bezier(.3,.65,.44,1);
  transition-delay: 0s;
}

#menu-container:hover > .link-container {
  visibility: visible;
  overflow: visible;
  display: block;
  transform: translatex(0%);
  transition: inherit inherit inherit;
  transition-delay: 0.15s;
}
#menu-container.hover > .link-container {
  visibility: visible;
  overflow: visible;
  display: block;
  transform: translatex(0%);
  transition: inherit inherit inherit;
  transition-delay: 0.15s;
}

.link-container {
	border: 2px solid transparent;
	border-bottom-color: #2a2a2a;
	background: transparent;
	height: 64px;
	width: calc(inherit-5px);
	color: white;
	padding-top: 16px;
	font-family: roboto;
	font-weight: bold;
	font-size: 20px;
	line-height: 250%;
	letter-spacing: 4px;
	text-decoration: none;
	text-align: left;
	text-transform: uppercase;
	transition: background 0.25s ease;
}

.link-container:hover {
  background: #d93232;
  cursor: pointer;
	transition: inherit;
}
.link-container.hover {
  background: #d93232;
  cursor: pointer;
	transition: inherit;
}

.link-container:hover > .menu-links {
  color: white;
}
.link-container.hover > .menu-links {
  color: white;
}

.menu-links {
  margin-left: 16px;
  vertical-align: center;
	transition: color 0.25s ease;
}
.menu-links:active {
  margin-left: 16px;
  vertical-align: center;
  color: white;
	transition: inherit inherit inherit;
}

#menu-container > .nav-social-icons-container {
	visibility: hidden;
	opacity: 0.0;
	overflow: hidden;
	display: block;
	transform: translatey(250%);
	transition: visibility 0.5s ease-in-out, transform 0.5s cubic-bezier(.3,.65,.44,1), opacity 0.5s ease-in-out;
	transition-delay: 0s;
}

#menu-container:hover > .nav-social-icons-container {
	visibility: visible;
	overflow: visible;
	opacity: 1.0;
	display: block;
	transform: translatey(0%);
	transition: inherit inherit inherit;
	transition-delay: 0.15s;
}
#menu-container.hover > .nav-social-icons-container {
	visibility: visible;
	overflow: visible;
	opacity: 1.0;
	display: block;
	transform: translatey(0%);
	transition: inherit inherit inherit;
	transition-delay: 0.15s;
}

.nav-social-icons-container {
	height: 64px;
	width: inherit;
	position: relative;
	display: block;
	background: #2a2a2a;
	padding-bottom: 18px;
}

.nav-social-icon {
	top: 16px;
	margin-left: 16px;
	margin-right: 16px;
	background: transparent;
	display: inline;
	position: absolute;
	transition: transform 0.15s ease, background 0.15s ease;
	border-radius: 50%;
	padding: 2px;
}

.nav-social-icon:hover {
	transform: scale(1.15);
	transition: inherit inherit inherit;
	cursor: pointer;
	background: #ffffff;
}
.nav-social-icon.hover {
	transform: scale(1.15);
	transition: inherit inherit inherit;
	cursor: pointer;
	background: #ffffff;
}

#nav-fb {
	left: 0%;
}

#nav-gp {
	left: 25%;
}

#nav-yt {
	right: 25%;
}

#nav-li {
	right: 0%;
}

footer {
	position: fixed;
	width: 960px;
	height: 32px;
	background: #1a1a1a;
	opacity: 0.85;
	color: white;
	padding-bottom: 18px;
	display: block;
	font-family: droid sans;
	left: 25%;
	right: 25%;
	text-align: center;
	vertical-align: bottom;
	bottom: 0%;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	letter-spacing: 2px;
	font-weight: regular;
}
</style>