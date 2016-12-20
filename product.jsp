<%@include file="master/header.jsp"%>
<%@include file="../helper/connect.jsp"%>

<%
	String query = "select * from productstable a join userstable b on a.uid = b.uid";
	ResultSet rs = st.executeQuery(query);
%>


<div class="container-fluid">
    <div class="row">
    	<h3>List Product</h3>
    	<span style="color: red">
    		<%= request.getParameter("message") != null ? request.getParameter("message") : ""  %>
    	</span>
        <div class="panel-group">
        <%
        	while(rs.next()){
        %>
        	<form action="controller/doAddCart.jsp" method="POST">
        		<div class="panel panel-default">
	        		<div class="panel-heading"><label>Product ID : <%= rs.getString("pid")%></label></div>
	        		<div class="panel-body">
	        			<img src="assets/images/<%= rs.getString("image")%>" width="100" height="100">
		        		<div class="col-md-offset-1 description">
		        			<p>Name : <%= rs.getString("name")%></p>
		        			<p>Price : <%= rs.getString("price")%></p>
		        			<p>Weight : <%= rs.getString("weight")%></p>
		        			<p>Stock : <%= rs.getString("stock")%></p>
		        			<h6>
		        				<i>
		        					Insert by <%= rs.getString("fullname") %>
		        				</i>
		        			</h6>        			
		        		</div>
		        		<% if(session.getAttribute("role").equals("member")){%>
			        		<div class="col-md-offset-10">
			        			<input type="hidden" name="pid" value="<%= rs.getString("pid")%>"/>
			        			<input type="hidden" name="txtPrice" value="<%= rs.getString("price")%>"/>
		        				<label>Qty </label>
		        				<input type="number" min="1" max="<%= rs.getString("stock")%>" name="txtQty"/><br/><br/>
		        				<button type="submit" class="btn btn-primary">
		        					<i class="glyphicon glyphicon-shopping-cart"></i> Add to Cart
		        				</button>		        				
		        			</div>		 
		        		<%}else{%>
		        			<div class="col-md-offset-10">		        				
		        				<a href="updateproduct.jsp?pid=<%= rs.getString("pid")%>" class="btn btn-success">
		        					Update
		        				</a>
		        				<a href="controller/doDeleteProduct.jsp?pid=<%= rs.getString("pid")%>" class="btn btn-danger" onclick="return confirm('Are you sure ?')">
		        					Delete
		        				</a>
		        			</div>
		        		<%}%>      		
	        		</div>
	        	</div>
        	</form>
        <%}%>
        </div>
    </div>
</div>
<%@include file="master/footer.jsp"%>