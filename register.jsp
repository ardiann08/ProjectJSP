<%@include file="master/header.jsp"%>



<div class="container-fluid">
    <div class="row">
        <h3>Register</h3>

        <form action="doRegister.jsp" method="POST" class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-2">Fullname</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="txtFullname" placeholder="Enter Fullname">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Username</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="txtUsername" placeholder="Enter Username">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="txtPassword" placeholder="Enter Password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Confirm Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="txtCPassword" placeholder="Enter Confirm Password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Gender</label>
				<div class="col-sm-5">
					<label><input type="radio" name="rbGender" value="male">Male</label>
					<label><input type="radio" name="rbGender" value="female">Female</label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Date of Birth</label>
				<div class="col-sm-5">
					<input type="date" class="form-control" name="dob">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Address</label>
				<div class="col-sm-5">
					<textarea class="form-control" cols="5" name="txtAddress">Your Address</textarea>
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
					<input type="submit" value="Register" class="btn btn-primary form-control" />
				</div>
			</div>
        </form>
    </div>
</div>


<%@include file="master/footer.jsp"%>