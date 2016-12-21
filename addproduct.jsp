<%@include file="helper/connect.jsp"%>
<%@include file="master/header.jsp"%>
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
        <h3>Add Product</h3>

        <form action="controller/doAddProduct.jsp" method="POST" class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-2">Product Name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="txtName" placeholder="Enter Product Name">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Product Price</label>
				<div class="col-sm-5">
					<input type="number" min="1" class="form-control" name="txtPrice" placeholder="Enter Product Price">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Product Weight</label>
				<div class="col-sm-5">
					<input type="number" min="1" class="form-control" name="txtWeight" placeholder="Enter Product Weight">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Product Stock</label>
				<div class="col-sm-5">
					<input type="number" class="form-control" min="1" name="txtStock" placeholder="Enter Product Stock">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-2">
					<label class="pull-right">Product Image</label>
				</div>	
				<div class="col-sm-5">
					<input type="file" name="fImage">
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
					<input type="submit" value="Add" class="btn btn-primary form-control" />
				</div>
			</div>
        </form>
    </div>
</div>

<%@include file="master/footer.jsp"%>