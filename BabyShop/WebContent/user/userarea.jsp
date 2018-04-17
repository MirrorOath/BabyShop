<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人空间</title>
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
			<div class="col-md-2 column">
				<dl>
					<dt>用户名</dt>
					<dd>${userInfo.userName }</dd>
					<dt>密码</dt>
					<dd>${userInfo.password }</dd>
					<dt>年龄</dt>
					<dd>${userInfo.age }</dd>
					<dt>注册日期</dt>
					<dd>${userInfo.date }</dd>
				</dl>
			</div>
			<div class="col-md-6 column">
				<div class="panel-group" id="panel-92507">
					<c:forEach var="order" items="${orders }" varStatus="sta">
						<div class="panel panel-default">
							<div class="panel-heading formStyle">
								<a class="panel-title collapsed orderIdStyle"
									data-toggle="collapse" data-parent="#panel-92507"
									href="#panel-element-${order.id }">订单号:${order.id }</a> <a
									id="del"
									href="${pageContext.request.contextPath}/order/delForm.action?formId=${order.id }">删除</a>
								<a id="detail"
									href="${pageContext.request.contextPath}/order/seeDetail.action?formId=${order.id }"
									target=_blank>详细</a>
							</div>
							<div id="panel-element-${order.id }"
								class="panel-collapse collapse">
								<div class="panel-body">
									总价:${order.totalPrice }<br />
									<c:forEach var="detail" items="${details }" varStatus="ss">
										<c:if test="${detail.formId == order.id}">
										详单号:${detail.id }
										商品名:${detail.cmty.name }类别:${detail.cmty.category }价格:${detail.cmty.price }
										数量:${detail.count }
										<br />
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-4 column">
				<form role="form"
					action="${pageContext.request.contextPath}/user/update.action"
					method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">帐号</label><input name="username"
							class="easyui-validatebox form-control" id="exampleInputEmail1"
							type="text" required="true" validType="userName" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">密码</label><input name="pwd"
							class="form-control" id="exampleInputPassword1" type="password"
							required="true" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">年龄</label><input name="age"
							class="form-control" id="exampleInputPassword1" type="text"
							required="true" />
					</div>
					<button type="submit" class="btn btn-default">修改信息</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>