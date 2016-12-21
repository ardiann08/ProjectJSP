<%@include file="../helper/connect.jsp"%>

<%
	// get all parameter
	String cid = request.getParameter("cid");
	String qty = request.getParameter("qty");

	// get current qty, and add to stock 
	String query = "update productstable set stock = stock + " + qty;
	st.executeUpdate(query);

	// clear cart by cartid
	query = "delete from cartstable where cid=" + cid;
	st.executeUpdate(query);
	response.sendRedirect("../cart.jsp?message=Successfuly to delete cart");

%>