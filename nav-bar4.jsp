<%-- 
    Document   : nav-bar4
    Created on : 8 Mar, 2024, 11:12:02 PM
    Author     : DELL
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xyz.Conn"%>
<%@page import="java.sql.Connection"%>
<head>
    <title>LOGO-BAR</title>
    <link href="logo-bar.css" rel="stylesheet">
    <style>
        #navbar {
            display: flex; /* Use flexbox to align items */
            justify-content: center; /* Center items horizontally */
            align-items: center; /* Center items vertically */
            height: 100%; /* Set the height of the ul */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }

        .nav-item {
            display: flex; /* Use flexbox to align items */
            align-items: center; /* Center items vertically */
            margin-right: 20px; /* Add some space between items */
        }

        .nav-item img,
        .nav-item h4 {
            margin: 0; /* Remove any default margins */
        }
    </style>
</head>

<body>
    <%
        HttpSession sessionn = request.getSession();
    // Retrieve session attribute
    
    String aid = (String) sessionn.getAttribute("ADMIN_ID");
    Connection con = new Conn().con;
%>
    
    <div class="container">
        <div class="navbar-icon">
            <img src="zcod-logo.png" width="60" height="65">
            <div class="pname">
                <pre>Command
On
Demand
                </pre>
            </div>
        </div>
        <div class="navbar">
            <ul class="nav-items" id="navbar">
                <li class="nav-item">
                    <a href="body-login.html" target="_body" class="nav-link">Home</a>
                </li>
                <li class="nav-item">
                    <a href="body-login.html#main" target="_body" class="nav-link">Services</a>
                </li>
                
                    <li class="nav-item"><a href="signup.html" target="_body" class="nav-link">Signup</a></li>
                    <li class="nav-item"><a href="login.html" target="_body" class="nav-link">Login</a></li>
                <li class="nav-item">
                    <a href="spsignup.jsp" target="_body" class="nav-link">Join as Service Provider</a>
                </li>
                <li class="nav-item">
                    <a href="about.html" target="_body" class="nav-link">About</a>
                </li>
                <li class="nav-item">
                    <a href="logout.jsp" class="nav-link">Logout</a>
                </li>
                <li class="nav-item">
                    <ul class="nav-items" id="navbar">
<!--                        <li style=" margin: 0; margin-left: 10px" class="nav-item">
                    <a href="user-profile.html" target="_body" class="nav-link">
                        <img src="z-profile-icon.png" height="40px" width="auto"></a></li>-->
                        <li><a href="admin.jsp" target="_body" class="nav-link"><h4><%=aid%></h4></a></li>
                    
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</body>

</html>
