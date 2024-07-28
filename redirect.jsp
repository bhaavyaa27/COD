<%-- 
    Document   : redirect
    Created on : 4 Mar, 2024, 1:35:45 AM
    Author     : DELL
--%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.SQLException"%>
<%@page import="xyz.Conn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redirection Page</title>
        <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #007185, white);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .message {
            text-align: center;
        }
    </style>
     <script>
    // Delay the redirection to the home page
    setTimeout(function() {
        // Redirect to the home page
        window.location.href = "body-login.html";
    }, 1000); // Delay for 1 minute (600 milliseconds)
    </script>
    </head>
    <body>
        
         <%
            LocalDate currentDate = LocalDate.now();
            LocalDate nextDate = currentDate.plusDays(1);
            LocalDate nextNextDate = currentDate.plusDays(2);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yy");

    // Format the dates using the defined format
    String formattedCurrentDate = currentDate.format(formatter);
    String formattedNextDate = nextDate.format(formatter);
    String formattedNextNextDate = nextNextDate.format(formatter);
            
         %>
        
        <%
        String uid = (String) session.getAttribute("USER_ID");
        System.out.println(uid);
        String sid = request.getParameter("sid");
        String date = request.getParameter("date");
        String cd ="";
        String t="";
        System.out.println("value of date is-"+ date);
        String timeSlot = request.getParameter("time");
        if("button1".equals(date)){
                cd = String.valueOf(formattedCurrentDate);
                 System.out.println("value of cd is "+ cd);
               }
            else if(date.equals("button2")){
                cd = String.valueOf(formattedNextDate);
            }
            else if(date.equals("button3")){
                cd = String.valueOf(formattedNextNextDate);
            }
            else{
                System.out.println("errrrrrrrrrrr");
            }
        
        String sqlQuery = "";
        String sqlQuery2 = "";
        String sqlQuery3 = "";
        String sqlQuery4 = "";

        if ("button1".equals(date)) {
            if("10:00 AM - 11:00 AM".equals(timeSlot)){
            t = "cd_1";
            System.out.println("this is point A");
            sqlQuery = "UPDATE SP SET CD_1=FALSE WHERE SP_ID=?";}
            else if("11:00 AM - 12:00 PM".equals(timeSlot)){
            t = "cd_2";
            sqlQuery = "UPDATE SP SET CD_2=FALSE WHERE SP_ID=?";}
            else if("12:00 PM - 1:00 PM".equals(timeSlot)){
            t = "cd_3";
            sqlQuery = "UPDATE SP SET CD_3=FALSE WHERE SP_ID=?";}
            else if("1:00 PM - 2:00 PM".equals(timeSlot)){
            t = "cd_4";
            sqlQuery = "UPDATE SP SET CD_4=FALSE WHERE SP_ID=?";}
            else if("2:00 PM - 3:00 PM".equals(timeSlot)){
            t = "cd_5";
            sqlQuery = "UPDATE SP SET CD_5=FALSE WHERE SP_ID=?";}
            else if("3:00 PM - 4:00 PM".equals(timeSlot)){
            t = "cd_6";
            sqlQuery = "UPDATE SP SET CD_6=FALSE WHERE SP_ID=?";}
            else if("4:00 PM - 5:00 PM".equals(timeSlot)){
            t = "cd_7";
            sqlQuery = "UPDATE SP SET CD_7=FALSE WHERE SP_ID=?";}
            else{System.out.println("ERROR");}
            
            sqlQuery2 = "INSERT INTO booking VALUES (?,?,?,?)";
            sqlQuery3 = "INSERT INTO srating(SP_ID ,USER_ID) VALUES (?,?)" ;
            sqlQuery4 = "INSERT INTO urating(SP_ID ,U_ID) VALUES (?,?)" ;
        } else if ("button2".equals(date)) {if("10:00 AM - 11:00 AM".equals(timeSlot)){
            t = "cd1_1";
            sqlQuery = "UPDATE SP SET CD1_1=FALSE WHERE SP_ID=?";}
            else if("11:00 AM - 12:00 PM".equals(timeSlot)){
            t = "cd1_2";
            sqlQuery = "UPDATE SP SET CD1_2=FALSE WHERE SP_ID=?";}
            else if("12:00 PM - 1:00 PM".equals(timeSlot)){
            t = "cd1_3";
            sqlQuery = "UPDATE SP SET CD1_3=FALSE WHERE SP_ID=?";}
            else if("1:00 PM - 2:00 PM".equals(timeSlot)){
            t = "cd1_4";
            sqlQuery = "UPDATE SP SET CD1_4=FALSE WHERE SP_ID=?";}
            else if("2:00 PM - 3:00 PM".equals(timeSlot)){
            t = "cd1_5";
            sqlQuery = "UPDATE SP SET CD1_5=FALSE WHERE SP_ID=?";}
            else if("3:00 PM - 4:00 PM".equals(timeSlot)){
            t = "cd1_6";
            sqlQuery = "UPDATE SP SET CD1_6=FALSE WHERE SP_ID=?";}
            else if("4:00 PM - 5:00 PM".equals(timeSlot)){
            t = "cd1_7";
            sqlQuery = "UPDATE SP SET CD1_7=FALSE WHERE SP_ID=?";}
            else{System.out.println("ERROR");}
            
            sqlQuery2 = "INSERT INTO booking VALUES (?,?,?,?)";
            sqlQuery3 = "INSERT INTO srating(SP_ID ,USER_ID) VALUES (?,?)" ;
            sqlQuery4 = "INSERT INTO urating(SP_ID ,U_ID) VALUES (?,?)" ;
        } else if ("button3".equals(date)) {
            sqlQuery = "UPDATE SP SET CD2=FALSE WHERE SP_ID=?";
            sqlQuery2 = "INSERT INTO booking VALUES (?,?,?,?)";
            sqlQuery3 = "INSERT INTO srating(SP_ID ,USER_ID) VALUES (?,?)" ;
            sqlQuery4 = "INSERT INTO urating(SP_ID ,U_ID) VALUES (?,?)" ;
        } else {
            // Handle invalid button value
            out.println("Invalid button value");
        }

        Connection con = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
         PreparedStatement ps4 = null;
        ResultSet rs = null;
String DandT = cd + timeSlot;
        try {
            con = new Conn().con;
            ps = con.prepareStatement(sqlQuery);
            ps.setString(1,sid);
        int rows = ps.executeUpdate();
         ps2 = con.prepareStatement(sqlQuery2);
         ps2.setString(1, uid);
         ps2.setString(2,sid);
         ps2.setString(3,cd);
         ps2.setString(4,timeSlot);
        int rows2 = ps2.executeUpdate();
        ps3 = con.prepareStatement(sqlQuery3);
        ps3.setString(1, sid);
        ps3.setString(2, uid);
        int row3 = ps3.executeUpdate();
         ps4 = con.prepareStatement(sqlQuery4);
        ps4.setString(1, sid);
        ps4.setString(2, uid);
        int row4 = ps4.executeUpdate();
      }
         catch(SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query: " + e.getMessage());
        }
        

        
    %>
    
     <div class="message">
        <h1>Your booking is confirmed!</h1>
        <p>Redirecting you back to the home page...</p>
    </div>

   
    </body>
</html>
