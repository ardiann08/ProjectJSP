<%@include file="master/header.jsp"%>
<%@include file="../helper/connect.jsp"%>
<%
   if(session.getAttribute("role")==null){
        response.sendRedirect("error.jsp");
    }else{
        if(session.getAttribute("role").equals("admin")==false){
            response.sendRedirect("error.jsp");
        }
    }
%>

<div class="container-fluid">
    <div class="row">
    	<h3>Your Transaction</h3>
    	<span style="color: red">
    		<%= request.getParameter("message") != null ? request.getParameter("message") : ""  %>
    	</span>
        <div class="panel-group">
        <%
        	String query = "select * from transactionstable";      
            int limit=5;
            int currentpage=1;
            int offset=0;
            int lastpage=0;
            if(request.getParameter("page")!=null){
                currentpage=Integer.parseInt(request.getParameter("page"));
                offset=(limit*(currentpage-1));
            }
            query+=" limit "+limit+" offset "+offset;
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
        <div class="col-md-12" style="text-align: center;">
            <%  
                ResultSet rs3 = st.executeQuery("select count(*) as counter from transactionstable");
                int counter=0;
                if(rs3.next()){
                    counter=Integer.parseInt(rs3.getString("counter"));
                    lastpage=counter/limit;
                    if(counter%limit!=0){
                        lastpage++;
                    }   
                }
            %>
            <%
                if(currentpage!=1){
            %>
            <div class="btn-group">
                <a href="transactionadmin.jsp?page=<%=currentpage-1%>"  class="btn btn-default"><</a>
            </div>
            <%}%>
            
            <div class="btn-group">
                <%
                    for(int i=1;i<lastpage+1;i++){
                %>
                <a href="transactionadmin.jsp?page=<%=i%>"  class="btn btn-default"><%=i%></a>
                <%}%>
            </div>
            

            <%
                if(currentpage!=lastpage){
            %>
            <div class="btn-group">
                <a href="transactionadmin.jsp?page=<%=currentpage+1%>"  class="btn btn-default">></a>
            </div>
            <%}%>
        
        </div>
    </div>
</div>
<%@include file="master/footer.jsp"%>