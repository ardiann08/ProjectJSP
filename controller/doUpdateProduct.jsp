<%@include file="../helper/connect.jsp"%>

<%
	String pid = request.getParameter("pid");
	String name = request.getParameter("txtName");
	String price = request.getParameter("txtPrice");
	String weight = request.getParameter("txtWeight");
	String stock = request.getParameter("txtStock");
	String image = request.getParameter("fimage");

	String message = "";

	if(name.equals("")){
		message += "please fill product name <br/>";
	}
	if(price.equals("")){
		message += "please fill product price <br/>";
	}
	if(weight.equals("")){
		message += "please fill product weight <br/>";
	}
	if(stock.equals("")){
		message += "please fill product stock <br/>";
	}
	if(!image.endsWith(".jpg") && !image.endsWith(".png")){
		message += "please fill product name <br/>";
	}
	if(!message.equals("")){
		response.sendRedirect("../updateproduct.jsp?message="+message);
	}else{
		String query = "update productstable set name='"+ name +"', price="+ price +", weight="+ weight +", stock="+ stock +", image='mouse.png' where pid=" + pid;
		st.executeUpdate(query);
		response.sendRedirect("../product.jsp?message=Success to update product");
	}


%>