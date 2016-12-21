<%@include file="master/header.jsp"%>
<%@include file="../helper/connect.jsp"%>
<%
	if(session.getAttribute("role")==null){
		response.sendRedirect("error.jsp");
	}
%>

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
		<div class="col-md-4 col-md-offset-4" style="text-align: center;">
			<span style="color: red">
    			<%= request.getParameter("message") != null ? request.getParameter("message") : ""  %>
    		</span>
		</div>	
    	
        <div class="panel-group">

        <%	
        	query = "select * from productstable a join userstable b on a.uid = b.uid";
        	String find="";
        	int limit=5;
        	int currentpage=1;
        	int offset=0;
        	int lastpage=0;
        	if(request.getParameter("page")!=null){
				currentpage=Integer.parseInt(request.getParameter("page"));
				offset=(limit*(currentpage-1));
        	}
        	
        	if(request.getParameter("find")!=null){
        		find=request.getParameter("find");
				query+=" where name like '%"+find+"%'";
    		}
    		query+=" limit "+limit+" offset "+offset;
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
		        				<a href="comment.jsp?pid=<%=rs.getString("pid")%>" class="btn btn-default" style="margin-top: 10px;">
		        					<i class="glyphicon glyphicon-comment"></i> Comment
		        				</a>		        				
		        			</div>		 
		        		<%}else{%>
		        			<div class="col-md-offset-10">		        				
		        				<a href="updateproduct.jsp?pid=<%= rs.getString("pid")%>" class="btn btn-success">
		        					Update
		        				</a>
		        				<a href="controller/doDeleteProduct.jsp?pid=<%= rs.getString("pid")%>" class="btn btn-danger" onclick="return confirm('Are you sure ?')">
		        					Delete
		        				</a>
		        				<a href="comment.jsp?pid=<%=rs.getString("pid")%>" class="btn btn-default" style="margin-top: 10px;">
		        					<i class="glyphicon glyphicon-comment"></i> Comment
		        				</a>
		        			</div>
		        		<%}%>      		
	        		</div>
	        	</div>
        	</form>
        </div>
        <%}%>
        </div>
        <div class="col-md-12" style="text-align: center;">
        	<%	
        		ResultSet rs2 = st.executeQuery("select count(*) as counter from productstable where name like '%"+find+"%'");
        		int counter=0;
        		if(rs2.next()){
					counter=Integer.parseInt(rs2.getString("counter"));
					lastpage=counter/limit;
					if(counter%limit!=0){
						lastpage++;
					}
					System.out.println(lastpage);	
        		}
        	%>
        	<%
    			if(currentpage!=1){
    		%>
    		<div class="btn-group">
    			<a href="product.jsp?page=<%=currentpage-1%><%if(!find.equals(""))out.print("&find="+find);%>"  class="btn btn-default"><</a>
    		</div>
    		<%}%>
			
    		<div class="btn-group">
    			<%
					for(int i=1;i<lastpage+1;i++){
				%>
    			<a href="product.jsp?page=<%=i%><%if(!find.equals(""))out.print("&find="+find);%>"  class="btn btn-default"><%=i%></a>
    			<%}%>
    		</div>
    		

    		<%
    			if(currentpage!=lastpage){
    		%>
    		<div class="btn-group">
    			<a href="product.jsp?page=<%=currentpage+1%><%if(!find.equals(""))out.print("&find="+find);%>"  class="btn btn-default">></a>
    		</div>
    		<%}%>
        </div>
    </div>
</div>
<%@include file="master/footer.jsp"%>