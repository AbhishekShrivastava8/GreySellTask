<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Record Form</title>
</head>
<body>
    <h1>Record Form</h1>
    <form action="recordGet" method="post">
        Name: <input type="text" name="name" required /><br/>
        Email: <input type="email" name="email" required /><br/>
        Phone: <input type="text" name="phone" required /><br/>
        Age: <input type="number" name="age" min="18" max="25" required /><br/>
        <input type="submit" value="Submit" />
    </form>
    <% if ("true".equals(request.getParameter("error"))) { %>
        <p style="color:red;">Error: Invalid input or email already exists!</p>
    <% } %>
</body>
</html>