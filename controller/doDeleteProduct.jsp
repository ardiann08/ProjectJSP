<%@include file="../helper/connect.jsp"%>

<%
	String pid = request.getParameter("pid");
	String query = "delete from productstable where pid=" + pid;
	st.executeUpdate(query);
	response.sendRedirect("../product.jsp?message=Successfuly to delete the product");

%>