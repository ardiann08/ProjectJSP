<%@include file="master/header.jsp"%>
<%@include file="../helper/connect.jsp"%>

<%
	String query = "select * from cartstable a join productstable b on a.pid = b.pid where a.uid=" + session.getAttribute("uid");
	ResultSet rs = st.executeQuery(query);

	String query2 = "select sum(subtotal) from cartstable where uid = " + session.getAttribute("uid");
	ResultSet rs2 = stmt.executeQuery(query2);
%>


<div class="container-fluid">
    <div class="row">
    	<h3>Your Cart</h3>
    	<span style="color: red">
    		<%= request.getParameter("message") != null ? request.getParameter("message") : ""  %>
    	</span>
        <div class="panel-group">
        <%
        	while(rs.next()){
        %>
        	<form action="controller/doAddCart.jsp" method="POST">
        		<div class="panel panel-default">
	        		<div class="panel-heading">
	        			<label>Cart ID : <%= rs.getString("pid")%></label>
	        			<label class="pull-right">
	        				<a href="controller/doDeleteCart.jsp?cid=<%= rs.getString("cid")%>&qty=<%= rs.getString("qty")%>">
	        					<i class="glyphicon glyphicon-remove"></i>
	        				</a>
	        			</label>
	        		</div>
	        		<div class="panel-body">
	        			<img src="assets/images/<%= rs.getString("image")%>" width="100" height="100">
		        		<div class="col-md-offset-1 description">
		        			<p>Name : <%= rs.getString("name")%></p>
		        			<p>Qty : <%= rs.getString("qty")%></p>
		        			<p>Subtotal price : Rp. <%= rs.getString("subtotal")%>,- (Rp. <%= rs.getString("price")%> x <%= rs.getString("qty")%> Pcs) </p>	        			   			
		        		</div>		        		
	        		</div>
	        	</div>
        	</form>
        <%}%>
        <%
        	rs.beforeFirst();
        	if(!rs.next()){
        %>
        	<div class="panel panel-default">
	        	<div class="panel-heading">No Product in your cart</div>
	        </div>
        <%}else{
        	if(rs2.next()){
        %>
		        <div class="panel panel-info">
		        	<div class="panel-heading">
		        		<label>Total Payment </label>
		        		<label class="pull-right">
		        			Rp. <%= rs2.getString(1) %>,-
		        		</label>
		        	</div>
		        </div>

		        <a href="controller/doCompleteOrder.jsp?totalprice=<%= rs2.getString(1) %>">
		        	<button class="btn btn-primary col-md-12">Complete the Payment</button>
		        </a>
	        <%}%>
        <%}%>

        </div>
    </div>
</div>
<%@include file="master/footer.jsp"%>