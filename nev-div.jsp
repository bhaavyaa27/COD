<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Providers</title>
    <style>
        /* Define CSS for the service provider div */
        .service-provider {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div id="service-providers-container">
        <!-- Existing service providers will be listed here -->
    </div>
    <%
        String fname = request.getParameter("fname");
    %>
    <script>
        function addServiceProvider(fname) {
            // Create a new div element
            var name = fname;
            var div = document.createElement('div');
            div.classList.add('service-provider'); // Add the class for styling

            // Populate the div with content
            div.innerHTML = `
                <div class="profile">
                    <a href="service-provider-info.html"><img src="user-icon.png" alt="Electrician Profile Picture" class="profile-pic"></a>
                    <div class="info">
                        <a href="service-provider-info.html">
                            <div class="name" id="fname">${name}</div>
                            <div class="details">Lorem ipsum dolor sit amet consectetur adipisicing</div>
                        </a>
                    </div>
                    <a href="book-electrician.jsp?name=Kamal"><button class="book-now" onclick="window.location.href='book-electrician.jsp'">Book Now</button></a>
                </div>
            `;

            // Append the new div to the container
            document.getElementById('service-providers-container').appendChild(div);
        }

        // Example usage: call this function when a new provider is registered
        addServiceProvider('<%= fname %>');
    </script>
</body>
</html>

 

<!--<a href="book-electrician.jsp?name=Kamal"></a>
String fname = request.getParameter("name");-->