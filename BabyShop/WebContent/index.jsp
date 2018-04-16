<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
	name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" media="screen">

<title>Welcome</title>
</head>
<body>
	<script src="${pageContext.request.contextPath }/easyUI/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>

	<jsp:include page="user/util.jsp" />
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

				<div class="row clearfix" style="margin-top: 10%;">
					<div class="col-md-12 column">
						<div class="carousel slide" id="carousel-306408">
							<ol class="carousel-indicators">
								<li class="active" data-slide-to="0"
									data-target="#carousel-306408"></li>
								<li data-slide-to="1" data-target="#carousel-306408"></li>
								<li data-slide-to="2" data-target="#carousel-306408"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img alt=""
										src="${pageContext.request.contextPath }/image/book.jpg" />
									<div class="carousel-caption">
										<h4>在这</h4>
										<p>你可以找到你心仪的商品。</p>
									</div>
								</div>
								<div class="item">
									<img alt=""
										src="${pageContext.request.contextPath }/image/book.jpg" />
									<div class="carousel-caption">
										<h4>在这</h4>
										<p>你可以很获得很简单明了的购物体验。</p>
									</div>
								</div>
								<div class="item">
									<img alt=""
										src="${pageContext.request.contextPath }/image/book.jpg" />
									<div class="carousel-caption">
										<h4>在这</h4>
										<p>一切免费！！！</p>
									</div>
								</div>
							</div>
							<a class="left carousel-control" href="#carousel-306408"
								data-slide="prev"><span
								class="glyphicon glyphicon-chevron-left"></span></a> <a
								class="right carousel-control" href="#carousel-306408"
								data-slide="next"><span
								class="glyphicon glyphicon-chevron-right"></span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>