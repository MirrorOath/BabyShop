<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>购物车</title>
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
				<form
					action="${pageContext.request.contextPath}/order/placeOrder.action"
					method="post">

					<input type="checkbox" name="choseAll" onclick="checkAll()"
						style="margin-left: 25%;" />全选 <input type="submit" value="结算"
						name="settlement" />
					<table class="table table-condensed table-hover table-bordered"
						id="cartTable">
						<thead>
							<tr>
								<th></th>
								<th>商品预览</th>
								<th>商品名书名</th>
								<th>类别</th>
								<th>价格</th>
								<th>数量</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cart" items="${cartInfo }" varStatus="sta">
								<tr>

									<td id="cbo"><div id="cb">
											<input type="checkbox" name="cartBook"
												value="${cart.cmty.id }" />
										</div></td>
									<td><div>
											<img alt="Error" src="../${cart.cmty.imageSrc }">
										</div></td>
									<td>${cart.cmty.name }</td>
									<td>${cart.cmty.category }</td>
									<td>${cart.cmty.price }</td>
									<td>${cart.count }</td>
									<td><a
										href="${pageContext.request.contextPath}/cart/delCart.action?cmtyId=${cart.cmty.id }">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>