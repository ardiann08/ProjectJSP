<%@include file="/helper/connect.jsp"%>
<%
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
	if(message.equals("")){
		stmt.executeUpdate("update userstable set password ='"+newpassword+"' , phone = '"+phonenumber+"' , email = '"+email+"' , address = '"+address+"' , photo = '"+photo+"' where uid = "+session.getAttribute("uid"));
		response.sendRedirect("../profile.jsp");
	}else{
		response.sendRedirect("../updateprofile.jsp?message=" + message);
	}




%>