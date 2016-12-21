<%@include file="helper/connect.jsp"%>
<%@include file="master/header.jsp"%>
<%
	if(session.getAttribute("role")==null){
		response.sendRedirect("error.jsp");
	}
%>
<%
	ResultSet rs =st.executeQuery("select * from userstable where uid = "+session.getAttribute("uid"));
	if(rs.next()){
%>
<div class="container-fluid">
    <div class="row">
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
	    <div class="col-md-2 col-md-offset-2">
	    	<a href="updateprofile.jsp" class="btn btn-default" style="width: 100%">Update Profile</a>
	    </div>
	    
    	
    </div>
</div>
<%}%>
<%@include file="master/footer.jsp"%>