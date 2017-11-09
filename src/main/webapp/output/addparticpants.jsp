<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysqldb","root","root");
PreparedStatement ps = 	con.prepareStatement("select * from country_table");
ResultSet rs = ps.executeQuery();
PreparedStatement ps1 = 	con.prepareStatement("select * from city_table");
%>

<form action="./register.jsp">
<table border="1" align="center">
<tr>
<th>
Participant Name :
</th>
<td>
<input type="text" name="pname">
</td>
</tr>

<tr>
<th>
Sex : 
</th>
<td>
<input type="radio" name="sex" value="Male" >Male
<input type="radio" name="sex" value="Female" >Female
</td>
</tr>

<tr>
<th>
email :
</th>
<td>
<input type="text" name="email">
</td>
</tr>


<tr>
<th>
password :
</th>
<td>
<input type="password" name="password">
</td>
</tr>


<tr>
<th>
Mobile Number : 
</th>
<td>
<input type="text" name="mobile">
</td>
</tr>

<tr>
<th>
Country : 
</th>
	<td>     		<select name="country">
					<%while(rs.next()){
						%>
						<option  value="<%=rs.getString(2)%>"><%= rs.getString(2)%></option>
						<%}%>
						</select> 
		</td>
</tr>

<tr>
<th>
city : 
</th>
<td>
<select name="city">
					<%
					 rs = ps1.executeQuery();
					while(rs.next()){
						%>
						<option  value="<%=rs.getString(2)%>"><%= rs.getString(2)%></option>
						<%}%>
						</select> 
</td>
</tr>


<tr>
<td colspan="2" align="center">
<input type="submit" name="register">
</td>
</tr>


</table>
</form>
</body>
</html>