<%@include file="master/header.jsp"%>
<%@include file="helper/connect.jsp"%>
<%
	if(session.getAttribute("role")==null){
		response.sendRedirect("error.jsp");
	}
%>
	<div class="container-fluid">
    <div class="row">
    	<h3 style="text-align: center;">All Active Member</h3>
    	<div class="col-md-4 col-md-offset-4">
    		<form action="member.jsp">
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
	    
    	<%	
    		String query="select * from userstable";
    		if(request.getParameter("find")!=null){
				query+=" where fullname like '%"+request.getParameter("find")+"%'";
    		}
			ResultSet rs = st.executeQuery(query);
			while(rs.next()){
		%>
    	<div class="col-md-12"> 			
			<div class="col-md-2">
	    		<img src="assets/images/<%=rs.getString("photo")%>" alt="" class="img-circle">
	    	</div>
		    <div class="col-md-10">
		    	<div class="well well-lg">
	    			<div>Name : <%=rs.getString("fullname")%></div>
		    		<div>Phone : <%=rs.getString("phone")%></div>
		    		<div>Email : <%=rs.getString("email")%></div>
		    		<div>Gender : <%=rs.getString("gender")%></div>
		    		<div>Date of Birth : <%=rs.getString("dateofbirth")%></div>
		    		<div>Address : <%=rs.getString("address")%></div>
		    	</div>
		    </div>
    	</div>
    	<%}%>
	    
    	
    </div>
</div>

<%@include file="master/footer.jsp"%>