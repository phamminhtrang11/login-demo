<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form action="http://localhost:6777/dologin" method="post">
    <table>
        <tr>
            <td>Username</td>
            <td><input type="text" name="username"> </td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>
<% if (request.getAttribute("error") != null) { %>
<p style="color:red;">Invalid username or password</p>
<% } %>
</body>
</html>
