<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Database.Database"%>
<%@page import="Models.UserModel"%>
<%@page import="Dao.userDao"%>
<%@page import="java.util.*"%>    
    
     <%
    userDao pd = new userDao(Database.getConnection());
	List<UserModel> products=  pd.getEllProduct();
    UserModel user=(UserModel) request.getAttribute("user");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="updateServlet" method="get">
					<div class="form-group">
					<input type="hidden" name="id" class="form-control" value="<%=user.getId()%>">
						<label>Full name</label> 
						<input type="text" name="name" class="form-control" value="<%=user.getName()%>">
					</div>
					<div class="form-group">
						<label>Email</label> 
						<input type="email" name="email" class="form-control" value="<%=user.getEmail()%>">
					</div>
					<div class="form-group">
						<label>Password</label> 
						<input type="password" name="password" class="form-control" value="<%=user.getPassword()%>">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">update</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>


</body>
</html>