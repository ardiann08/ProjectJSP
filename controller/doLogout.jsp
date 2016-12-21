<%@include file="../helper/connect.jsp"%>

<%
	// remove all session 
	session.removeAttribute("uid");
	session.removeAttribute("fullname");
	session.removeAttribute("role");

	// decrease the user online application
	Integer onlineuser = (Integer)application.getAttribute("onlineuser");
	if( onlineuser != 0){
		onlineuser -= 1;
		application.setAttribute("onlineuser", onlineuser);
	}
	response.sendRedirect("../index.jsp");
%>