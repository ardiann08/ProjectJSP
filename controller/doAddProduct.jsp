<%@include file="/helper/connect.jsp"%>
<%
	String name = request.getParameter("txtName");
	String price = request.getParameter("txtPrice");
	String weight = request.getParameter("txtWeight");
	String stock = request.getParameter("txtStock");
	String image = request.getParameter("fImage");
	String message="";

	if(name.equals("")){
		message+="Please insert Product Name<br/>";
	}
	if(price.equals("")){
		message+="Please insert Product Price<br/>";
	}
	if(weight.equals("")){
		message+="Please insert Product Weight<br/>";
	}
	if(stock.equals("")){
		message+="Please insert Product Stock<br/>";	}
	if(!image.endsWith(".jpg")&&!image.endsWith(".png")){
		message +="Please Insert Image with extension .jpg or .png<br/>";
	}
	if(message.equals("")){
		st.executeUpdate("insert into productstable values(null,'"+name+"',"+price+","+weight+","+stock+",'"+image+"',"+session.getAttribute("uid")+")");
		response.sendRedirect("../product.jsp");
	}else{
		response.sendRedirect("../addproduct.jsp?message="+message);
	}

%>