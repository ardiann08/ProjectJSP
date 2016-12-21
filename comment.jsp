<%@include file="helper/connect.jsp"%>
<%@include file="master/header.jsp"%>
<%
    if(session.getAttribute("role")==null){
        response.sendRedirect("error.jsp");
    }
%>
<%
	ResultSet rs =st.executeQuery("select * from productstable where pid = "+request.getParameter("pid"));
	if(rs.next()){
%>
<div class="container-fluid">
    <div class="row">
    	<h3 style="text-align: center;">Comments</h3>
    	<div class="col-md-4 col-md-offset-4" style="text-align: center;">
			<span style="color: red">
    			<%= request.getParameter("message") != null ? request.getParameter("message") : ""  %>
    		</span>
		</div>
    	<div class="col-md-12">
    		<div class="panel panel-default">
	        	<div class="panel-heading"><label>Product ID : <%= rs.getString("pid")%></label></div>
	        	<div class="panel-body">
        			<img src="assets/images/<%= rs.getString("image")%>" width="100" height="100">
	        		<div class="col-md-offset-1 description">
	        			<p>Name : <%= rs.getString("name")%></p>
	        			<p>Price : <%= rs.getString("price")%></p>
	        			<p>Weight : <%= rs.getString("weight")%></p>
	        			<p>Stock : <%= rs.getString("stock")%></p>    			
	        		</div>
        			<div class="col-md-offset-9" style="text-align: right;">
        			<label>
        				Average Rating :
						<%
							ResultSet rs2 = st.executeQuery("select *,avg(star) AS averagestar from commentstable where pid = "+rs.getString("pid"));
							rs2.next();
							if(rs2.getString("averagestar")!=null){
								if(rs2.getString("averagestar").equals("1")){
									%>
									<i class="glyphicon glyphicon-star gold"></i>
									<i class="glyphicon glyphicon-star-empty gold"></i>
		        					<i class="glyphicon glyphicon-star-empty gold"></i>
		        					<i class="glyphicon glyphicon-star-empty gold"></i>
		        					<i class="glyphicon glyphicon-star-empty gold"></i>
								<%}else if(rs2.getString("averagestar").equals("2")){
									%>
									<i class="glyphicon glyphicon-star gold"></i>
									<i class="glyphicon glyphicon-star gold"></i>
									<i class="glyphicon glyphicon-star-empty gold"></i>
		        					<i class="glyphicon glyphicon-star-empty gold"></i>
		        					<i class="glyphicon glyphicon-star-empty gold"></i>
								<%}else if(rs2.getString("averagestar").equals("3")){
									%>
									<i class="glyphicon glyphicon-star gold"></i>
									<i class="glyphicon glyphicon-star gold"></i>
									<i class="glyphicon glyphicon-star gold"></i>
		        					<i class="glyphicon glyphicon-star-empty gold"></i>
		        					<i class="glyphicon glyphicon-star-empty gold"></i>
								<%}else if(rs2.getString("averagestar").equals("4")){
									%>
									<i class="glyphicon glyphicon-star gold"></i>
									<i class="glyphicon glyphicon-star gold"></i>
									<i class="glyphicon glyphicon-star gold"></i>
		        					<i class="glyphicon glyphicon-star gold"></i>
		        					<i class="glyphicon glyphicon-star-empty gold"></i>
								<%}else{%>
									<i class="glyphicon glyphicon-star gold"></i>
									<i class="glyphicon glyphicon-star gold"></i>
									<i class="glyphicon glyphicon-star gold"></i>
		        					<i class="glyphicon glyphicon-star gold"></i>
		        					<i class="glyphicon glyphicon-star gold"></i>
								<%}
							}else{%>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
        					<%}%>
        			</label>		        				
        				
        			</div>      		
	        	</div>
	        </div>
    	</div>
    	<%	
    		ResultSet rs3 = stmt.executeQuery("select * from commentstable ct , userstable ut where ct.uid = ut.uid and ct.pid = "+request.getParameter("pid"));
    		while(rs3.next()){
    	%>
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-body" style="position: relative;">
    				<div class="col-md-2">
			    		<img src="assets/images/<%=rs3.getString("photo")%>" alt="" class="img-circle">
			    		<div><%=rs3.getString("fullname")%></div>
			    	</div>
				    <div class="col-md-7">
				    	<p><%=rs3.getString("body")%></p>
				    </div>
				    <div class="col-md-3" style="text-align: right;margin-top: 30px;">
				    	<label>
        				Rating :
						<%
							if(rs3.getString("star").equals("1")){
								%>
								<i class="glyphicon glyphicon-star gold"></i>
								<i class="glyphicon glyphicon-star-empty gold"></i>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
							<%}else if(rs3.getString("star").equals("2")){
								%>
								<i class="glyphicon glyphicon-star gold"></i>
								<i class="glyphicon glyphicon-star gold"></i>
								<i class="glyphicon glyphicon-star-empty gold"></i>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
							<%}else if(rs3.getString("star").equals("3")){
								%>
								<i class="glyphicon glyphicon-star gold"></i>
								<i class="glyphicon glyphicon-star gold"></i>
								<i class="glyphicon glyphicon-star gold"></i>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
							<%}else if(rs3.getString("star").equals("4")){
								%>
								<i class="glyphicon glyphicon-star gold"></i>
								<i class="glyphicon glyphicon-star gold"></i>
								<i class="glyphicon glyphicon-star gold"></i>
	        					<i class="glyphicon glyphicon-star gold"></i>
	        					<i class="glyphicon glyphicon-star-empty gold"></i>
							<%}else{%>
								<i class="glyphicon glyphicon-star gold"></i>
								<i class="glyphicon glyphicon-star gold"></i>
								<i class="glyphicon glyphicon-star gold"></i>
	        					<i class="glyphicon glyphicon-star gold"></i>
	        					<i class="glyphicon glyphicon-star gold"></i>
						<%}%>
        				</label>
				    </div>
				    <%
				    	if(rs3.getString("uid").equals(session.getAttribute("uid"))){
				    %>
				    <form action="controller/doDeleteComment.jsp" method="post">
					    <div class="col-md-offset-9" style="position: absolute;right: 0;top: 0;">
					    	<a href="updatecomment.jsp?cid=<%=rs3.getString("cid")%>" class="btn btn-primary">
					    		<i class="glyphicon glyphicon-pencil"></i>
					    	</a>
				    		<input type="hidden" name="txtCid" value="<%=rs3.getString("cid")%>">
				    		<input type="hidden" name="txtPid" value="<%=request.getParameter("pid")%>">
				    		<button href="" class="btn btn-danger">
				    			<i class="glyphicon glyphicon-remove"></i>
				    		</button> 	
					    </div>
				    </form>
				    <%}%>
    			</div>
    		</div>    		
    	</div>
    	<%}%>
    	<%
    		if(session.getAttribute("role").equals("member")){
    	%>
    	<div class="col-md-12">
    		<form action="controller/doAddComment.jsp" method="post">
    			<input type="hidden" name="txtpid" value="<%=request.getParameter("pid")%>">
    			<div class="form-group">
    				<textarea name="txtBody" class="form-control" placeholder="Add Comment..."></textarea>
    			</div>
    			<div class="form-group">
    				<select name="ddlStar">
    					<option value="default" selected hidden disabled>Star</option>
    					<option value="1">1</option>
    					<option value="2">2</option>
    					<option value="3">3</option>
    					<option value="4">4</option>
    					<option value="5">5</option>

    				</select>
    			</div>
    			<div class="form-group">
    				<button class="btn btn-default" type="submit">Add Comment</button>
    			</div>
    		</form>
    	</div>
    	<%}%>	        	
    </div>
</div>
<%}%>
<%@include file="master/footer.jsp"%>