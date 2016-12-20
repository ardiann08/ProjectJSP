<%@include file="../helper/connect.jsp"%>

<%
	session.removeAttribute("uid");
	session.removeAttribute("fullname");
	session.removeAttribute("role");
	response.sendRedirect("../index.jsp");
%>