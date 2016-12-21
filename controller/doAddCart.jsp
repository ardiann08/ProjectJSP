<%@include file="../helper/connect.jsp"%>

<%
	// get all parameter
	String pid = request.getParameter("pid");
	Integer qty = Integer.parseInt(request.getParameter("txtQty"));
	Integer price = Integer.parseInt(request.getParameter("txtPrice"));
	Integer subtotal = qty*price;

	// insert product to cart
	String query = "insert into cartstable values(null, "+ session.getAttribute("uid") +", "+ pid +", "+ qty +", "+ subtotal +")";
	st.executeUpdate(query);

	// decrease the product stock by user request
	query = "update productstable set stock = stock - " + qty;
	st.executeUpdate(query);

	// redirect and give message success
	response.sendRedirect("../product.jsp?message=Success to add cart");
%>