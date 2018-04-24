<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商品信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
	name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" media="screen">

</head>
<body>
	<script src="${pageContext.request.contextPath }/easyUI/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>

	<jsp:include page="util.jsp" />
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand"
						href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=index">首页</a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a
							href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=login">${uname }${userInfo.userName }</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=register">${unameNext }</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath }/user/more.jsp">更多</a></li>
						<li><a
							href="${pageContext.request.contextPath }/user/aboutUs.jsp">关于我们</a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">更多<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.request.contextPath}/cart/seeCart.action"
									target=_blank>查看购物车</a></li>
							</ul></li>
					</ul>
					<form class="navbar-form navbar-left" role="search"
						action="${pageContext.request.contextPath}/cmty/searchByName.action"
						method="post">
						<div class="form-group">
							<input class="form-control" type="text" maxlenght=100
								name="commodityName" />
						</div>
						<button type="submit" class="btn btn-default">搜索</button>
					</form>
				</div>
				</nav>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-8 column"></div>
					<div class="col-md-4 column">
						<div class="row clearfix">
							<div class="col-md-8 column">
								<a type="button" class="btn btn-default btn-block btn-warning"
									href="${pageContext.request.contextPath}/cart/addcmty.action?userId=${userInfo.id }&cmtyId=${cmty.id }">加入购物车</a>
								<a type="button" class="btn btn-default btn-success btn-block"
									href="${pageContext.request.contextPath}/cart/seeCart.action?userId=${userInfo.id }"
									target=_blank>查看购物车</a>
							</div>
							<div class="col-md-4 column"></div>
						</div>
					</div>
				</div>
				<table class="table table-condensed table-hover table-bordered">
					<thead>
						<tr>
							<th>商品预览</th>
							<th>商品名</th>
							<th>类别</th>
							<th>价格</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img alt="Error" src="../${cmty.imageSrc }"></td>
							<td>${cmty.name }</td>
							<td>${cmty.category }</td>
							<td>${cmty.price }</td>
						</tr>
					</tbody>
				</table>
				<p>
				    ${cmty.note }
				</p>
			</div>
		</div>
	</div>
</body>
</html>