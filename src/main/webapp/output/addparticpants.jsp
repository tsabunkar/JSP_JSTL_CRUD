<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/mysqldb" user="root" password="root" />

	<sql:query var="countryQuery" dataSource="${ds}">
select * from country_table
</sql:query>
	<sql:query var="cityQuery" dataSource="${ds}">
select * from city_table
</sql:query>

	<form action="./register.jsp">
		<table border="1" align="center">
			<tr>
				<th>Participant Name :</th>
				<td><input type="text" name="pname"></td>
			</tr>

			<tr>
				<th>Sex :</th>
				<td><input type="radio" name="sex" value="Male">Male <input
					type="radio" name="sex" value="Female">Female</td>
			</tr>

			<tr>
				<th>email :</th>
				<td><input type="text" name="email"></td>
			</tr>


			<tr>
				<th>password :</th>
				<td><input type="password" name="password"></td>
			</tr>


			<tr>
				<th>Mobile Number :</th>
				<td><input type="text" name="mobile"></td>
			</tr>

			<tr>
				<th>Country :</th>
				<td><select name="country">
						<c:forEach items="${countryQuery.rows}" var="x">
							<option value="${x.countryname}"> ${x.countryname}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>city :</th>

				<td><select name="city">
						<c:forEach items="${cityQuery.rows}" var="x">
							<option value="${x.cityname}"> ${x.cityname}</option>
						</c:forEach>
				</select></td>
			</tr>


			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="register"></td>
			</tr>


		</table>
	</form>
</body>
</html>