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


<%
	String pid = request.getParameter("pid");
	String query = "select * from productstable where pid="+pid;
	ResultSet rs = st.executeQuery(query);
	if(rs.next()){
%>



<div class="container-fluid">
    <div class="row">
        <h3>Update Product</h3>

        <form action="controller/doUpdateProduct.jsp" method="POST" class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-2">Name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="txtName" value="<%= rs.getString("name") %>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Price</label>
				<div class="col-sm-5">
					<input type="numner" class="form-control" min="1" name="txtPrice" value="<%= rs.getString("price") %>">
				</div>
			</div>	
			<div class="form-group">
				<label class="control-label col-sm-2">Weight</label>
				<div class="col-sm-5">
					<input type="number" class="form-control" min="1" name="txtWeight" value="<%= rs.getString("weight") %>">
				</div>
			</div>	
			<div class="form-group">
				<label class="control-label col-sm-2">Stock</label>
				<div class="col-sm-5">
					<input type="number" class="form-control" min="1" name="txtStock" value="<%= rs.getString("stock") %>">
				</div>
			</div>	
			<div class="form-group">
				<label class="control-label col-sm-2">Image</label>
				<div class="col-sm-2">
					<img src="assets/images/<%= rs.getString("image") %>" width="100" height="100">
				</div>
				<div class="col-sm-5">
					<input type="file" name="fimage"/>
					<input type="hidden" name="pid" value="<%= request.getParameter("pid")%>"/>
				</div>
			</div>	

			<div class="form-group">
				<label class="control-label col-sm-2"></label>
				<div class="col-sm-5">
					<span style="color: red">
						<%= request.getParameter("message") != null ? request.getParameter("message") : "" %>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2"></label>
				<div class="col-sm-5">
					<input type="submit" value="Update product" class="btn btn-primary form-control" />
				</div>
			</div>
        </form>
    </div>
</div>

<%}%>


<%@include file="master/footer.jsp"%>