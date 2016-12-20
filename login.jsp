<%@include file="master/header.jsp"%>

<% 
	String user = "";
	String pass = "";
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){			
			if(cookies[i].getName().equals("username")){
				user = cookies[i].getValue();
			}else if(cookies[i].getName().equals("password")){
				pass = cookies[i].getValue();
			}
			
		}
	}
%>

<div class="container-fluid">
    <div class="row">
        <h3>Login</h3>

        <form action="controller/doLogin.jsp" method="POST" class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-2">Username</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="txtUsername" placeholder="Enter Username" value="<%= user != null ? user : ""%>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="txtPassword" placeholder="Enter Password" value="<%= pass != null ? pass : ""%>">
				</div>
			</div>	
			<div class="form-group">
				<label class="control-label col-sm-2"></label>
				<div class="col-sm-5">
					<label><input type="checkbox" name="cbRememberme"/> Remember me</label>
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
					<input type="submit" value="Login" class="btn btn-primary form-control" />
				</div>
			</div>
        </form>
    </div>
</div>


<%@include file="master/footer.jsp"%>