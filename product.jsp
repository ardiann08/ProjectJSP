<%@include file="master/header.jsp"%>
<%@include file="../helper/connect.jsp"%>


<%
	String query = "select * from productstable a join userstable b on a.uid = b.uid";
	ResultSet rs = st.executeQuery(query);
%>


<div class="container-fluid">
    <div class="row">
    	<h3 style="text-align: center;">List Product</h3>
		<div class="col-md-4 col-md-offset-4">
    		<form action="product.jsp">
    			<div class="col-md-10">
    				<div class="form-group">
    					<input type="text" name="find" class="form-control">
    				</div>			
	    		</div>
	    		<div class="col-md-2">
	    			<div class="form-group">
    					<button type="submit" class="btn btn-default">Search <span class="glyphicon glyphicon-search"></span></button>
    				</div>			
	    		</div>
    		</form>    	
	    </div>
	    <%if(session.getAttribute("role").equals("admin")){%>
	    <div class="col-md-2 col-md-offset-5" style="margin-bottom: 10px;">
	    	<a href="addproduct.jsp" class="btn btn-default" style="width: 100%;">Add Product</a>
	    </div>
		<%}%>
    	<span style="color: red">
    		<%= request.getParameter("message") != null ? request.getParameter("message") : ""  %>
    	</span>
        <div class="panel-group">

        <%
        	query = "select * from productstable a join userstable b on a.uid = b.uid";
        	if(request.getParameter("find")!=null){
				query+=" where name like '%"+request.getParameter("find")+"%'";
    		}
			rs = st.executeQuery(query);
        	while(rs.next()){
        %>
        <div class="col-md-12">
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
		        				<input type="number" min="1" value="1" max="<%= rs.getString("stock")%>" name="txtQty"/><br/><br/>
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
        </div>
        <%}%>
        </div>
    </div>
</div>
<%@include file="master/footer.jsp"%>