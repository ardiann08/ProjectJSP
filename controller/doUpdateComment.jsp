<%@include file="../helper/connect.jsp"%>

<%
	// get all parameter
	String cid = request.getParameter("txtCid");
	String pid = request.getParameter("txtPid");
	String body = request.getParameter("txtBody");
	String star = request.getParameter("ddlStar");

	String message = "";


	// check the update comment requiremnt
	if(body.equals("")||body.length()>255){
		message+="Please insert Comment and Comment can't more than 255 characters<br/>";
	}
	if(star.equals("default")){
		message+="Please insert Star<br/>";
	}
	

	// if no error
	if(message.equals("")){
		// update choosed comment
		st.executeUpdate("update commentstable set body = '"+body+"',star = "+star+" where cid = "+cid);
		response.sendRedirect("../comment.jsp?pid="+pid+"&message=Success to update comment");
	}else{
		// if errorr redirect to coment page and give error message
		response.sendRedirect("../comment.jsp?cid="+cid+"&message="+message);		
	}


%>