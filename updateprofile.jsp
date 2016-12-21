<%@include file="helper/connect.jsp"%>
<%@include file="master/header.jsp"%>

<%
	ResultSet  rs =st.executeQuery("select * from userstable where uid = "+session.getAttribute("uid"));
	if(rs.next()){
%>

<div class="container-fluid">
    <div class="row">
        <h3>Update Profile</h3>

        <form action="controller/doUpdateProfile.jsp" method="POST" class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-2">Old Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="txtOld" placeholder="Enter Old Password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">New Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="txtNew" placeholder="Enter New Password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Confirm Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="txtCPassword" placeholder="Enter Confirm Password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Phone</label>
				<div class="col-sm-5">
					<input type="number" class="form-control" min="0" max="99999999999" name="txtPhonenumber" placeholder="Enter phone number" value="<%=rs.getString("phone")%>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Email</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="txtEmail" placeholder="Enter phone number" value="<%=rs.getString("email")%>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Address</label>
				<div class="col-sm-5">
					<textarea class="form-control" cols="5" name="txtAddress" placeholder="Enter Address"><%=rs.getString("address")%></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-2">
					<label class="pull-right">Photo</label>
				</div>	
				<div class="col-sm-5">
					<input type="file" name="fPhoto">
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
					<input type="submit" value="Update" class="btn btn-primary form-control" />
				</div>
			</div>
        </form>
    </div>
</div>
<%}%>

<%@include file="master/footer.jsp"%>