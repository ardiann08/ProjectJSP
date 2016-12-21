<%@include file="../helper/connect.jsp"%>

<%
	// get all parameter
	String username = request.getParameter("txtUsername");
	String password = request.getParameter("txtPassword");
	Integer onlineuser =  (Integer)application.getAttribute("onlineuser");
	String message = "";

	// check username and password into database users
	String query = "select * from userstable where username='" + username + "' and password = '" + password + "' ";
	ResultSet rs = st.executeQuery(query);


	// if found data
	if(rs.next()){
		// make session for user login
		session.setAttribute("uid", rs.getString("uid"));
		session.setAttribute("fullname", rs.getString("fullname"));
		session.setAttribute("role", rs.getString("role"));

		// make user cookie if button remember me is checked
		if(request.getParameter("cbRememberme")!=null){
			Cookie user = new Cookie("username",username);
			Cookie pass = new Cookie("password",password);

			// set cookie expired for 1 hours
			user.setMaxAge(60*60*24);
			pass.setMaxAge(60*60*24);

			user.setPath("/");
			pass.setPath("/");

			response.addCookie(user);
			response.addCookie(pass);
		}

		// give application for total user online
		if(onlineuser == null){
	        onlineuser = 1;
	    }else{
	        onlineuser+=1;
	    }
	    application.setAttribute("onlineuser", onlineuser);


		response.sendRedirect("../index.jsp");

	}else{
		// if username or password can't be found in database
		response.sendRedirect("../login.jsp?message=invalid username or password");
	}





%>