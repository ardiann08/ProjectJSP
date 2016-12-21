<%@include file="../helper/connect.jsp"%>

<%
	String cid = request.getParameter("txtCid");
	String pid = request.getParameter("txtPid");
	String body = request.getParameter("txtBody");
	String star = request.getParameter("ddlStar");

	String message = "";

	if(body.equals("")||body.length()>255){
		message+="Please insert Comment and Comment can't more than 255 characters<br/>";
	}
	if(star.equals("default")){
		message+="Please insert Star<br/>";
	}
	
	if(message.equals("")){
		st.executeUpdate("update commentstable set body = '"+body+"',star = "+star+" where cid = "+cid);
		response.sendRedirect("../comment.jsp?pid="+pid+"&message=Success to update comment");
	}else{
		response.sendRedirect("../comment.jsp?cid="+cid+"&message="+message);		
	}


%>