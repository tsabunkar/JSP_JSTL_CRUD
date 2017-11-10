<%@page import="com.controller.Controller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="part" class="com.dto.Participant"></jsp:useBean>
	<%
		String pname = request.getParameter("part_name");
		String sex = request.getParameter("part_sex");
		String email = request.getParameter("part_email");
		String password = request.getParameter("part_pass");
		String country = request.getParameter("part_country");
		String city = request.getParameter("part_city");
		String mobile = request.getParameter("part_mobile");
		Long mo = Long.parseLong(mobile);
	%>
	<jsp:setProperty property="pname" name="part" value="<%=pname%>" />
	<jsp:setProperty property="sex" name="part" value="<%=sex%>" />
	<jsp:setProperty property="email" name="part" value="<%=email%>" />
	<jsp:setProperty property="password" name="part" value="<%=password%>" />
	<jsp:setProperty property="mobile" name="part" value="<%=mo%>" />
	<jsp:setProperty property="country" name="part" value="<%=country%>" />
	<jsp:setProperty property="city" name="part" value="<%=city%>" />

	<%
		Controller cont = new Controller();
		int i = cont.updateRecord(part);
		if (i > 0) {
			response.sendRedirect("viewparticpants.jsp");
		} else {
			response.sendRedirect("failure.jsp");
		}
	%>

</body>
</html>