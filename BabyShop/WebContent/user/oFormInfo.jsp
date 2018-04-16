<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>订单信息</title>
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

	<div>
		<table border=1 style="margin-left: 25%">
			<tr>
				<th>订单号</th>
				<th>总价</th>
				<th>地址</th>
				<th>日期</th>
			</tr>
			<tr>
				<td>${form.id }</td>
				<td>${form.totalPrice }</td>
				<td>${form.address }</td>
				<td>${form.date }</td>
			</tr>
		</table>
		<table border=1 style="margin-left: 15%">
			<tr>
				<th>详单单号</th>
				<th>图书预览</th>
				<th>书名</th>
				<th>出版社</th>
				<th>作者</th>
				<th>数量</th>
			</tr>
			<c:forEach var="detail" items="${details }" varStatus="sta">
				<tr>
					<td>${detail.id }</td>
					<td><img alt="Error" src="../${detail.bookInfo.imageSrc }"></td>
					<td>${detail.bookInfo.bookName }</td>
					<td>${detail.bookInfo.press }</td>
					<td>${detail.bookInfo.author }</td>
					<td>${detail.bookCount }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>