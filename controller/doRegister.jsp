<%@include file="../helper/connect.jsp"%>

<%
	String username = request.getParameter("txtUsername");
	String fullname = request.getParameter("txtFullname");
	String password = request.getParameter("txtPassword");
	String cpassword = request.getParameter("txtCPassword");
	String phonenumber = request.getParameter("txtPhonenumber");
	String email = request.getParameter("txtEmail");
	String gender = request.getParameter("rbGender");
	String dob = request.getParameter("dob");
	String address = request.getParameter("txtAddress");

	String message = "";

	if(username.equals("")){
		message += "please fill username <br/>";
	}

	if(fullname.equals("") ){
		message += "please fill fulname<br/>";
	}
	if(!fullname.contains(" ")){
		message += "fullname can't 1 words<br/>";
	}
	if(password.equals("") || cpassword.equals("")){
		message += "please fill password and confirm password<br/>";
	}

	if(address.equals("")){
		message += "please fill address<br/>";
	}

	if(dob.equals("")){
		message += "please select date of birth <br/>";
	}

	if(message.equals("")){
		String query = "INSERT INTO userstable VALUES(null, '"+ fullname +"', '"+ username +"', '"+ phonenumber +"', '"+ email +"', '"+ password +"', '"+ gender +"', '"+ dob +"', '"+ address +"', 'member')";
		st.executeUpdate(query);
		response.sendRedirect("../register.jsp?message=Successfuly to register in bluejackstore :)");
	}else{
		response.sendRedirect("../register.jsp?message=" + message);
	}






%>