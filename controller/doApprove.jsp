<%@include file="../helper/connect.jsp"%>

<%
	// get all parameter
	String tid = request.getParameter("tid");

	// change transaction status from waiting to approved
	String query = "update transactionstable set status='approved' where tid="+ tid;
	st.executeUpdate(query);

	// send response and message successfuly
	response.sendRedirect("../transactionadmin.jsp?message=Successfuly to approve the transaction");

%>