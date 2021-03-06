<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dto.Participant"%>
<%@page import="com.controller.Controller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
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

	<sql:query var="cityQuery" dataSource="${ds}">
select * from city_table
</sql:query>


	<jsp:useBean id="part" class="com.dto.Participant"></jsp:useBean>
	<%
		String email = request.getParameter("email");
	%>
	<jsp:setProperty property="email" name="part" />
	<%
		Controller cont = new Controller();
		Participant p = cont.getParticularRecord(part);

		String sex = p.isSex();
		String country = p.getCountry();
		/* String city = p.getCity(); */
		request.setAttribute("par", p);
	%>



	<form action="updateedited.jsp">
		<table border="1">
			<tr>
				<th>Participant name</th>
				<td><input type="text" name="part_name"
					value="${par.getPname()}"></td>
			</tr>
			<tr>
				<th>sex</th>
				<td><input type="radio" name="part_sex"
					<%if (sex.equals("Male")) {%> checked="checked" <%}%> value="Male">Male
					<input type="radio" name="part_sex" <%if (sex.equals("Female")) {%>
					checked="checked" <%}%> value="Female">Female</td>
			</tr>
			<tr>
				<th>email</th>
				<td><input type="text" name="part_email"
					value="${par.getEmail()}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>password</th>
				<td><input type="text" name="part_pass"
					value="${par.getPassword()}"></td>
			</tr>
			<tr>
				<th>mobile</th>
				<td><input type="text" name="part_mobile"
					value="${par.getMobile()}"></td>
			</tr>
			<tr>
				<th>country</th>
				<td><select name="part_country">
						<option value="India" <%if (country.equals("India")) {%>
							selected="selected" <%}%>>India</option>
						<option value="Pakistan" <%if (country.equals("Pakistan")) {%>
							selected="selected" <%}%>>Pakistan</option>
				</select></td>
			</tr>
			<tr>
				<th>city</th>

				<td><select name="city">
						<c:forEach items="${cityQuery.rows}" var="x">
							<option value="${x.cityname}"> ${x.cityname}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="update"></td>
			</tr>
		</table>
	</form>
</body>
</html>