<%-- 
    Document   : spsignup
    Created on : 6 Apr, 2024, 2:10:18 AM
    Author     : DELL
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xyz.Conn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>SP-REGISTER</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #219dbca0, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-size: 1.0rem;
            color: #fff; 
        }
        .signup-container {
            background-color: rgba(255, 255, 255, 0.8); 
            border-radius: 10px;
            padding: 20px;
            width: 100%;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); 
            color:  #007185;
            overflow-y: auto; 
        }
        h1 {
            color: #007185;
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        .input-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px; 
        }
        .input-group label {
            width: 40%;
        }
        .input-group input, .input-group select {
            width: 45%;
        }
        button {
            background-color: #007185;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1.5rem;
            cursor: pointer;
            width: 100%;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        input[type=submit]:hover {
            background-color:  #007185;
        }
        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }
        .animated-button {
            animation: pulse 1.5s infinite alternate;
        }
        </style>
    </head>
    <body>
        <%
    String i = request.getParameter("spid");
   
    String message = "";
    String fname = request.getParameter("fname"); // Initialize variables to store field values
     System.out.println("this is fname "+fname);
    String lname = request.getParameter("lname");
    String spemail = request.getParameter("spemail");
    String spphone = request.getParameter("spphone");
    String aadhar_no = request.getParameter("aadhar_no");
    String sppass = request.getParameter("sppass");
    String type = request.getParameter("type");
    if (i != null) {
        Connection con = new Conn().con;
        try {
            PreparedStatement ps = con.prepareStatement("SELECT sp_id FROM SP WHERE sp_id=?");
            ps.setString(1, i);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                message = "ID Already exists";
                 fname = request.getParameter("fname");
                 lname = request.getParameter("lname");
                 spemail = request.getParameter("spemail");
                 spphone = request.getParameter("spphone");
                 aadhar_no = request.getParameter("aadhar_no");
            } else {
    // Redirect to sp-register.jsp with parameters
    response.sendRedirect("sp-register.jsp?fname=" + fname + "&lname=" + lname + "&spemail=" + spemail + "&spphone=" + spphone + "&aadhar_no=" + aadhar_no + "&sppass=" + sppass + "&spid=" + i + "&type=" + type);
    return; // Stop further execution
}

            System.out.println(message);
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Error executing SQL query: " + e.getMessage();
        } finally {
            // Close database connection here
        }
    }
%>
    <center>
        
        <form id="signupForm" method="post" action="spsignup.jsp" onsubmit="return validateForm()">
            <div class="signup-container">
                <h1>SIGNUP</h1>
                <div class="input-group">
            <label>First Name</label>
            <%  System.out.println("this is fname2 "+fname);
               if (fname == null || fname.equals("null")) { 
            fname = ""; %> <input  type="text" name="fname"  value="<%= fname %>"  pattern="[A-Za-z]{1,30}" title="Please enter letters only (max 30 characters)" required/>
            <%}else{
            %>
            <input  type="text" name="fname"  value="<%= fname %>"  pattern="[A-Za-z]{1,30}" title="Please enter letters only (max 30 characters)" required/>
            <%}%>
                    </div>
                <div class="input-group">
            <label>Last Name</label>
            <%  System.out.println("this is lname "+lname);
               if (lname == null || lname.equals("null")) { 
            lname = ""; %><input  type="text" name="lname" value="<%= lname %>"  pattern="[A-Za-z]{1,30}" title="Please enter letters only (max 30 characters)"/>
             <%}else{
            %>
            <input  type="text" name="lname" value="<%= lname %>"  pattern="[A-Za-z]{1,30}" title="Please enter letters only (max 30 characters)"/>
             
             <%}%>
                    </div>
                
                    <div class="input-group">
           
             <label for="serviceType">Service Type:</label>
        <select id="serviceType" name="type">
            <option value="Electrician">Electrician</option>
            <option value="Plumber">Plumber</option>
            <option value="Mechanic">Mechanic</option>
            <option value="Carpenter">Carpenter</option>
            <option value="Home-Cleaning">Home-Cleaning</option>
            <option value="Tailor">Tailor</option>
        </select>
            
                    </div>
                <div class="input-group">
            <label>E-Mail</label>
            <input type="email" name="spemail" value="<%= spemail %>" pattern="^[^\s@]+@[^\s@]+\.[^\s@]+$" title="Please enter a valid Banasthali email address" required />
         
                    </div>
                <div class="input-group">
            <label>Phone Number</label>
            <input type="tel" name="spphone" value="<%= spphone %>" pattern="[0-9]{10}" title="Please enter a valid 10-digit phone number" required />
                </div>
                <div class="input-group">
    <label>Aadhar No</label>
    <input type="text" pattern="^[0-9]{12}$" value="<%= aadhar_no %>" name="aadhar_no" title="Please enter a valid 12-digit Aadhar number" required />
</div>

                <div class="input-group">
            <label>ID</label>
            <input type="text" name="spid" pattern="[a-zA-Z0-9._]{6,10}" title="Username must be at least 6 and at most 10 characters long and can contain letters, digits, dots, and underscores." required/>
                </div>
                <% if (!message.isEmpty()) { %>
                <div class="error-message"><h5><%= message %></h5></div>
                <% } %>
                <div class="input-group">
            <label>Password</label>
            <input type="password" name="sppass" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,10}" title="Password must be at least 6 and at max 10 characters long, containing at least one lowercase letter, one uppercase letter, one digit, and one special character" required />
                </div>
                
<!--             <button class="animated-button" onclick="changeContent()">Signup</button>-->
                <button type="submit" class="animated-button">Signup</button>
                        
             </div>
        </form>
    </center>
        
    </body>
</html>
