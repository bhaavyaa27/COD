<%-- 
    Document   : nav-bar2
    Created on : 4 Mar, 2024, 8:37:24 PM
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="xyz.Conn"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.HttpSession"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>

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
        
   // Start or get the current session
    HttpSession sessionn = request.getSession();
    
    // Retrieve session attribute
    String uid = (String) sessionn.getAttribute("USER_ID");
    System.out.println(uid+"nav-bar2");
    Connection con = new Conn().con;
    
    String firstname = "";
    
    if (uid != null) {
        PreparedStatement ps = con.prepareStatement("SELECT FIRST_NAME FROM USERSIGNUP WHERE USER_ID = ?");
        ps.setString(1, uid);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            firstname = rs.getString("FIRST_NAME");
          
        } else {
            System.out.println("User not found");
        }
    }
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
                <li class="nav-item">
                    <a href="spsignup.jsp" target="_body" class="nav-link">Join as Service Provider</a>
                </li>
                <li class="nav-item">
                    <a href="admin-login.html" target="_body" class="nav-link">Admin</a>
                </li>
                <li class="nav-item">
                    <a href="about.jsp" target="_body" class="nav-link">About</a>
                </li>
                <li class="nav-item">
                    <a href="logout.jsp" class="nav-link">Logout</a>
                </li>
                <li class="nav-item">
                    <ul class="nav-items" id="navbar">
<!--                        <li style=" margin: 0; margin-left: 10px" class="nav-item">
                    <a href="user-profile.html" target="_body" class="nav-link">
                        <img src="z-profile-icon.png" height="40px" width="auto"></a></li>-->
                        <li><a href="Uprofile.jsp" target="_body" class="nav-link"><h4><%=firstname%></h4></a></li>
                    
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</body>

</html>



