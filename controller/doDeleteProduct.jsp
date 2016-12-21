<%@include file="../helper/connect.jsp"%>

<%
	// get all parameter
	String pid = request.getParameter("pid");

	// delete product by productid
	String query = "delete from productstable where pid=" + pid;
	st.executeUpdate(query);
	response.sendRedirect("../product.jsp?message=Successfuly to delete the product");

%>