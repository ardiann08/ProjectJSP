<%@include file="../helper/connect.jsp"%>

<%	
	// get all parameter
	String pid = request.getParameter("txtPid");
	String cid = request.getParameter("txtCid");
	// delete coment by comentid
	st.executeUpdate( "delete from commentstable where cid="+cid);
	response.sendRedirect("../comment.jsp?pid="+pid+"&message=Successfuly to delete your comment");

%>