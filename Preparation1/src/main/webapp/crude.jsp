<%@page import="Database.Database"%>
<%@page import="Models.UserModel"%>
<%@page import="Dao.userDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    userDao pd = new userDao(Database.getConnection());
	List<UserModel> products= pd.getEllProduct();
    
    %>
    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
      <th scope="col">action</th>
    </tr>
  </thead>
  <tbody>
  <%if(!products.isEmpty()){
				for(UserModel p:products ){%>
	  <tr>
      <th scope="row"><%=p.getId()%></th>
      <td><%=p.getName() %></td>
      <td><%=p.getEmail() %></td>
      <td><%=p.getPassword()%></td>
      <td> <a href="edit?id=<%=p.getId()%>"><button type="button" class="btn btn-primary">Edit</button></a> </td>
       <td> <a href="delete?id=<%=p.getId()%>"><button type="button" class="btn btn-danger">Delete</button></a> </td>
    </tr>
    	<% }
			}
			%>
    
    
  </tbody>
</table>
<a href="Registration.jsp"><button type="button" class="btn btn-success" >Add</button></a>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>