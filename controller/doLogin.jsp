<%@include file="../helper/connect.jsp"%>

<%
	String username = request.getParameter("txtUsername");
	String password = request.getParameter("txtPassword");
	Integer onlineuser =  (Integer)application.getAttribute("onlineuser");
	String message = "";

	String query = "select * from userstable where username='" + username + "' and password = '" + password + "' ";
	ResultSet rs = st.executeQuery(query);

	if(rs.next()){
		session.setAttribute("uid", rs.getString("uid"));
		session.setAttribute("fullname", rs.getString("fullname"));
		session.setAttribute("role", rs.getString("role"));
		if(request.getParameter("cbRememberme")!=null){
			Cookie user = new Cookie("username",username);
			Cookie pass = new Cookie("password",password);

			user.setMaxAge(60*60*24);
			pass.setMaxAge(60*60*24);

			user.setPath("/");
			pass.setPath("/");

			response.addCookie(user);
			response.addCookie(pass);
		}
		if(onlineuser == null){
	        onlineuser = 1;
	    }else{
	        onlineuser+=1;
	    }
	    application.setAttribute("onlineuser", onlineuser);


		response.sendRedirect("../index.jsp");

	}else{
		response.sendRedirect("../login.jsp?message=invalid username or password");
	}





%>