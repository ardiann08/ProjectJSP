<%@include file="../helper/connect.jsp"%>

<%
	String cid = request.getParameter("cid");
	String qty = request.getParameter("qty");


	String query = "update productstable set stock = stock + " + qty;
	st.executeUpdate(query);
	query = "delete from cartstable where cid=" + cid;
	st.executeUpdate(query);
	response.sendRedirect("../cart.jsp?message=Successfuly to delete cart");

%>