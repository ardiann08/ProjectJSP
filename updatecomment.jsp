<%@include file="helper/connect.jsp"%>
<%@include file="master/header.jsp"%>
<%
	if(session.getAttribute("role")==null){
        response.sendRedirect("error.jsp");
    }else{
        if(session.getAttribute("role").equals("member")==false){
            response.sendRedirect("error.jsp");
        }
    }
%>
<%
	ResultSet  rs =st.executeQuery("select * from commentstable where cid = "+request.getParameter("cid")+" and uid = "+session.getAttribute("uid"));
	if(rs.next()){
%>

<div class="container-fluid">
    <div class="row">
        <h3>Update Comment</h3>

        <form action="controller/doUpdateComment.jsp" method="POST" class="form-horizontal">
        	<input type="hidden" name="txtCid" value="<%=rs.getString("cid")%>">
        	<input type="hidden" name="txtPid" value="<%=rs.getString("pid")%>">
			<div class="form-group">
				<label class="control-label col-sm-2">Comment</label>
				<div class="col-sm-5">
					<textarea name="txtBody" class="form-control"><%=rs.getString("body")%></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Rating</label>
				<div class="col-sm-5">
					<select name="ddlStar">
    					<option value="1"<%if(rs.getString("star").equals("1"))out.print("selected");%>>1</option>
    					<option value="2"<%if(rs.getString("star").equals("2"))out.print("selected");%>>2</option>
    					<option value="3"<%if(rs.getString("star").equals("3"))out.print("selected");%>>3</option>
    					<option value="4"<%if(rs.getString("star").equals("4"))out.print("selected");%>>4</option>
    					<option value="5"<%if(rs.getString("star").equals("5"))out.print("selected");%>>5</option>
    				</select>
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