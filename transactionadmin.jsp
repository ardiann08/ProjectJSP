<%@include file="master/header.jsp"%>
<%@include file="../helper/connect.jsp"%>


<div class="container-fluid">
    <div class="row">
    	<h3>Your Transaction</h3>
    	<span style="color: red">
    		<%= request.getParameter("message") != null ? request.getParameter("message") : ""  %>
    	</span>
        <div class="panel-group">
        <%
        	String query = "select * from transactionstable";
        	ResultSet rs = st.executeQuery(query);
        	while(rs.next()){
        %>
        	
    		<div class="panel panel-default">
        		<div class="panel-heading">
        			<label>Transaction ID : <%= rs.getString("tid")%></label>
        			<label class="pull-right">Status order : 
        				<%= rs.getString("status").equals("waiting") ? "Waiting for approval" : "Order Complete" %>
        			</label>        			
        		</div>
        		<div class="panel-body">        			
	        		<div class="description">
	        			<%
	        				query = "select * from transactiondetailstable a join productstable b on a.pid = b.pid where tid=" + rs.getString("tid");
	        				ResultSet rs2 = stmt.executeQuery(query);
	        				int count = 1;
	        				while(rs2.next()){

	        			%>
	        				<label><%= count++%>.  <%= rs2.getString("name")%> - Rp. <%= rs2.getString("subtotalprice")%>,- (Rp. <%= rs2.getString("price")%> x <%= rs2.getString("qty")%> Pcs)  </label><br/>
	        			<%}%>
	        		</div>
	        		<%if( rs.getString("status").equals("waiting") ){%>
                        <div class="col-md-offset-10">
                            <a href="controller/doApprove.jsp?tid=<%= rs.getString("tid") %>">
                                <button class="btn btn-primary">Approve</button>
                            </a>
                        </div>  

                    <%}%>	        		
        		</div>
        	</div>        	
        <%}%>
        <%
        	rs.beforeFirst();
        	if(!rs.next()){
        %>
        	<div class="panel panel-default">
	        	<div class="panel-heading">No Product in your cart</div>
	        </div>
        <%}%>

        </div>
    </div>
</div>
<%@include file="master/footer.jsp"%>