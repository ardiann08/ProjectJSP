<%@include file="../helper/connect.jsp"%>

<%	
	String pid = request.getParameter("txtPid");
	String cid = request.getParameter("txtCid");
	st.executeUpdate( "delete from commentstable where cid="+cid);
	response.sendRedirect("../comment.jsp?pid="+pid+"&message=Successfuly to delete your comment");

%>