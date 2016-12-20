<%@include file="../helper/connect.jsp"%>

<%
	String username = request.getParameter("txtUsername");
	String password = request.getParameter("txtPassword");

	String message = "";

	String query = "select * from userstable where username='" + username + "' and password = '" + password + "' ";
	ResultSet rs = st.executeQuery(query);

	if(rs.next()){
		session.setAttribute("uid", rs.getString("uid"));
		session.setAttribute("fullname", rs.getString("fullname"));
		session.setAttribute("role", rs.getString("role"));


		response.sendRedirect("../index.jsp");

	}else{
		response.sendRedirect("../login.jsp?message=invalid username or password");
	}





%>