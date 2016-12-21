<%@include file="/helper/connect.jsp"%>
<%
	// get all parameter
	String old = request.getParameter("txtOld");
	String newpassword = request.getParameter("txtNew");
	String cpassword = request.getParameter("txtCPassword");
	String phonenumber = request.getParameter("txtPhonenumber");
	String email = request.getParameter("txtEmail");
	String address = request.getParameter("txtAddress");
	String photo = request.getParameter("fPhoto");
	String currpass ="";
	String message="";
	ResultSet rs = st.executeQuery("select * from userstable where uid = "+session.getAttribute("uid"));

	// check the update profile requirements
	if(rs.next()){
		currpass=rs.getString("password");
	}
	if(old.equals(currpass)==false){
		message+="Your Old Password Wrong<br/>";
	}
	if(newpassword.equals("")){
		message+="Please Insert New Password<br/>";
	}
	if(cpassword.equals(newpassword)==false){
		message+="Your New Password or Confirm Password doesnt match<br/>";
	}
	if(phonenumber.equals("")){
		message+="Please Insert Phone Number<br/>";
	}
	if(email.equals("")){
		message+="Please Insert Email Address<br/>";
	}
	if(address.equals("")){
		message += "Please Insert Address<br/>";
	}
	if(!photo.endsWith(".jpg")&&!photo.endsWith(".png")){
		message +="Please Insert Photo with extension .jpg or .png<br/>";
	}

	// if no error
	if(message.equals("")){
		// update users table
		stmt.executeUpdate("update userstable set password ='"+newpassword+"' , phone = '"+phonenumber+"' , email = '"+email+"' , address = '"+address+"' , photo = '"+photo+"' where uid = "+session.getAttribute("uid"));
		response.sendRedirect("../profile.jsp");
	}else{
		// if error, redirect to updateprofile page and give error message
		response.sendRedirect("../updateprofile.jsp?message=" + message);
	}




%>