<%@include file="../helper/connect.jsp"%>
<%
String pid=request.getParameter("txtpid");
String body=request.getParameter("txtBody");
String star=request.getParameter("ddlStar");
String message = "";
if(body.equals("")||body.length()>255){
	message+="Please insert Comment and Comment can't more than 255 characters<br/>";
}
if(star.equals("default")){
	message+="Please insert Star<br/>";
}
if(message.equals("")){
	st.executeUpdate("insert into commentstable values(null,"+session.getAttribute("uid")+","+pid+",'"+body+"',"+star+")");
	message="Successfuly to insert your comment";
	response.sendRedirect("../comment.jsp?pid="+pid+"&message="+message);
}else{
	response.sendRedirect("../comment.jsp?pid="+pid+"&message="+message);
}


%>