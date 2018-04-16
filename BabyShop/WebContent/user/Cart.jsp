<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
	name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" media="screen">

<title>cart</title>
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
								<th>图书预览</th>
								<th>书名</th>
								<th>出版社</th>
								<th>作者</th>
								<th>数量</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cart" items="${cartInfo }" varStatus="sta">
								<tr>

									<td id="cbo"><div id="cb">
											<input type="checkbox" name="cartBook"
												value="${cart.bookInfo.bookId }" />
										</div></td>
									<td><div>
											<img alt="Error" src="../${cart.bookInfo.imageSrc }">
										</div></td>
									<td>${cart.bookInfo.bookName }</td>
									<td>${cart.bookInfo.press }</td>
									<td>${cart.bookInfo.author }</td>
									<td>${cart.bookCount }</td>
									<td><a
										href="${pageContext.request.contextPath}/cart/delectCart.action?bookId=${cart.bookInfo.bookId }">删除</a></td>
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