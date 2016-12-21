<%@include file="../helper/connect.jsp"%>

<%
	// get total price from form
	String totalprice = request.getParameter("totalprice");

	// insert transcction 
	String query = "insert into transactionstable values(null,"+ session.getAttribute("uid") +", "+ totalprice +", 'waiting', null)";
	st.executeUpdate(query);

	// query for get current transactionid
	query = "select tid from transactionstable where uid=" + session.getAttribute("uid") + " order by tid desc limit 1";
	ResultSet rs = st.executeQuery(query);
	rs.next();
	String tid = rs.getString(1);

	// add all cart detail to transaction detail
	query = "select * from cartstable where uid=" + session.getAttribute("uid");
	rs = st.executeQuery(query);
	while(rs.next()){
		query = "insert into transactiondetailstable values(null, "+ tid +", "+ rs.getString("pid") +", "+ rs.getString("qty") +", "+ rs.getString("subtotal") +")";
		stmt.executeUpdate(query);
	}

	// delete cart after add all data to transcation
	query = "delete from cartstable where uid = " + session.getAttribute("uid");
	st.executeUpdate(query);

	// redirect to cart page and give message successfuly
	response.sendRedirect("../cart.jsp?message=Successfuly to complete the payment");


%>