<%@page import="java.math.BigInteger"%>
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
	<jsp:useBean id="part" class="com.dto.Participant"></jsp:useBean>
	<%
		String partname = request.getParameter("pname");
		String sex = request.getParameter("sex");
		String emailid = request.getParameter("email");
		String pass = request.getParameter("password");
		String mo = request.getParameter("mobile");
		String country = request.getParameter("country");
		String city = request.getParameter("city");

		Long mo1 = Long.parseLong(mo);
	%>
	<jsp:setProperty property="pname" name="part" value="<%=partname%>" />
	<jsp:setProperty property="sex" name="part" value="<%=sex%>" />
	<jsp:setProperty property="email" name="part" value="<%=emailid%>" />
	<jsp:setProperty property="password" name="part" value="<%=pass%>" />
	<jsp:setProperty property="mobile" name="part" value="<%=mo1%>" />
	<jsp:setProperty property="country" name="part" value="<%=country%>" />
	<jsp:setProperty property="city" name="part" value="<%=city%>" />

	<%
		Controller cont = new Controller();
		int i = cont.saveRecord(part);
		if (i > 0) {
			response.sendRedirect("success.jsp");
		} else {
			response.sendRedirect("failure.jsp");
		}
	%>
</body>
</html>