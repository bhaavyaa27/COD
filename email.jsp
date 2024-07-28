<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="xyz.Conn"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />

    <script
      type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"
    ></script>
    <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js">
</script>
<script type="text/javascript">
   (function(){
      emailjs.init({
        publicKey: "pba55pPIMLw5OvMRo",
      });
   })();
</script>
  </head>
  
  <%
            String fname = request.getParameter("name");%>
            
            
<%
            
            String type="";
            
            if(fname != null){
                PreparedStatement ps = new Conn().con.prepareStatement("SELECT TYPE FROM SP WHERE FIRST_NAME =?");
                ps.setString(1,fname);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                
                    type = rs.getString(1);
                    
                
                }else{
                    %>
                    <script type="text/javascript">
                        alert("Provider does not exist");
                    </script>
                <%}
            }
               if(fname ==null) fname="";
        %>
  
  <body>
      
      <p id="service"><%=type%></p>
      
    <div class="container border mt-3 bg-light">
      <div class="row">
        <div class="col-md-6 p-5 bg-primary text-white">
          <h1>Hi there!</h1>
          <h4>
            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo,
          </h4>
        </div>
        <div class="col-md-6 border-left py-3">
          <h1>Contact form</h1>
          <div class="form-group">
            <h5 for="name">Name</h5>
            <input
              type="text"
              class="form-control"
              id="name"
              placeholder="Enter name"
            />
          </div>
          <div class="form-group">
            <h5 for="name">Service</h5>
            <input
              type="text"
              class="form-control"
              id="service"
              value="<%=type%>"
            />
          </div>
          <div class="form-group">
            <h5 for="date">date</h5>
            <input
              type="date"
              class="form-control"
              id="date"
              placeholder="date"
            />
          </div>
          <div class="form-group">
            <h5 for="email">Email</h5>
            <input
              type="email"
              class="form-control"
              id="email"
              placeholder="Enter email"
            />
          </div>
          <div class="form-group">
            <h5 id="message">Message</h5>
            <textarea class="form-control" id="message" rows="3"></textarea>
          </div>
          <button class="btn btn-primary" onclick="sendMail()">Submit</button>
        </div>
      </div>
    </div>
      
      <script>
          function sendMail() {
    var params = {
      name: document.getElementById("name").value,
      email: document.getElementById("email").value,
      message: document.getElementById("message").value,
      date: document.getElementById("date").value,
       service: "<%=type%>",
      
    };
  
    const serviceID = "service_nv93e9w";
    const templateID = "template_7u6y156";
  
      emailjs.send(serviceID, templateID, params)
      .then(res=>{
          document.getElementById("name").value = "";
          document.getElementById("email").value = "";
          document.getElementById("message").value = "";
          console.log(res);
          alert("Your message sent successfully!!")
  
      })
      .catch(err=>console.log(err));
  
  }
      </script>
      
  </body>
</html>


myemailjs2024