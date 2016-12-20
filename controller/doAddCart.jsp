<%@include file="../helper/connect.jsp"%>

<%
	String pid = request.getParameter("pid");
	Integer qty = Integer.parseInt(request.getParameter("txtQty"));
	Integer price = Integer.parseInt(request.getParameter("txtPrice"));
	Integer subtotal = qty*price;

	String query = "insert into cartstable values(null, "+ session.getAttribute("uid") +", "+ pid +", "+ qty +", "+ subtotal +")";
	st.executeUpdate(query);
	response.sendRedirect("../product.jsp?message=Success to add cart");

%>