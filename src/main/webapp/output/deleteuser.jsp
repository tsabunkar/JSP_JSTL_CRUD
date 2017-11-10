<%@page import="com.controller.Controller"%>
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
	<jsp:useBean id="part" class="com.dto.Participant"></jsp:useBean>
	<%
		String email = request.getParameter("email");
	%>

	<jsp:setProperty property="email" name="part" />
	<%
		Controller cont = new Controller();
		int i = cont.deleteRecord(part);
		if (i > 0)
			response.sendRedirect("./viewparticpants.jsp");
	%>
</body>
</html>