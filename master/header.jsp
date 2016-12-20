<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Bluejack Store</title>

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/sb-admin.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="assets/css/style.css">

</head>

<body>
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Bluejack Store</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">                   
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> 
                        <%= session.getAttribute("fullname") != null ? session.getAttribute("fullname")  : "Guest" %>
                    <b class="caret"></b></a>
                    <%if(session.getAttribute("fullname") != null){%>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="profile.jsp"><i class="fa fa-fw fa-user"></i> Profile</a>
                            </li>   
                            <li class="divider"></li>
                            <li>
                                <a href="controller/doLogout.jsp"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </ul>
                    <%}%>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <% if(session.getAttribute("uid") != null ){ %>
                    <ul class="nav navbar-nav side-nav">
                        <li>
                            <a href="index.jsp"><i class="glyphicon glyphicon-home"></i> Home</a>
                        </li>
                        <li>
                            <a href="product.jsp"><i class="glyphicon glyphicon-list-alt"></i> product</a>
                        </li>
                        <li>
                            <a href="member.jsp"><i class="glyphicon glyphicon-leaf"></i> Member</a>
                        </li>
                        <li>
                            <a href="transaction.jsp"><i class="glyphicon glyphicon-modal-window"></i> Transaction</a>
                        </li>
                        <%if(session.getAttribute("role").equals("member")){%>
                            <li>
                                <a href="cart.jsp"><i class="glyphicon glyphicon-shopping-cart"></i> Cart</a>
                            </li>     
                        <%}%>                   
                    </ul>
                <%}else{%>
                    <ul class="nav navbar-nav side-nav">
                        <li>
                            <a href="index.jsp"><i class="glyphicon glyphicon-home"></i> Home</a>
                        </li>
                        <li>
                            <a href="register.jsp"><i class="glyphicon glyphicon-pencil"></i> Register</a>
                        </li>
                        <li>
                            <a href="login.jsp"><i class="glyphicon glyphicon-log-in"></i> Login</a>
                        </li>                        
                    </ul>
                <%}%>                
            </div>
        </nav>

        <div id="page-wrapper">

            
        
