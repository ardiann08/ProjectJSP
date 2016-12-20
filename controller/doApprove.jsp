<%@include file="../helper/connect.jsp"%>

<%
	String tid = request.getParameter("tid");
	String query = "update transactionstable set status='approved' where tid="+ tid;
	st.executeUpdate(query);
	response.sendRedirect("../transactionadmin.jsp?message=Successfuly to approve the transaction");

%>