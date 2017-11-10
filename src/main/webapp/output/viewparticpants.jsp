<%@page import="com.dto.Participant"%>
<%@page import="java.util.List"%>
<%@page import="com.controller.Controller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Controller cont = new Controller();
		List<Participant> listpart = cont.getAllRecords();
		request.setAttribute("list", listpart);
	%>

	<table border="1">
		<tr>
			<th>Participant name</th>
			<th>sex</th>
			<th>email</th>
			<th>password</th>
			<th>mobile</th>
			<th>country</th>
			<th>city</th>
			<th>Update</th>
			<th>delete</th>
		</tr>

		<c:forEach items="${list}" var="l">
			<tr>
				<td>${l.getPname()}</td>
				<td>${l.isSex()}</td>
				<td>${l.getEmail()}</td>
				<td>${l.getPassword()}</td>
				<td>${l.getMobile()}</td>
				<td>${l.getCountry()}</td>
				<td>${l.getCity()}</td>
				<td><a href="editform.jsp?email=${l.getEmail()}">Edit</a></td>
				<td><a href="deleteuser.jsp?email=${l.getEmail()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>