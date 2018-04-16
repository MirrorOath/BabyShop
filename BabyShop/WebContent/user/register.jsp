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

<title>register</title>
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
		<div class="row clearfix" style="margin-top: 17%;">
			<div class="col-md-2 column"></div>
			<div class="col-md-6 column">
				<form class="form-horizontal" role="form"
					action="${pageContext.request.contextPath}/user/register.action"
					method="post">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">账号</label>
						<div class="col-sm-10">
							<input name="userName" class="easyui-validatebox form-control"
								type="text" required="true" validType="userName" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input name="password" class="form-control" type="password"
								required="true" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">年龄</label>
						<div class="col-sm-10">
							<input name="age" class="form-control" type="text"
								required="true" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">注册</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-4 column"></div>
		</div>
	</div>
	<div>
		<%
		    if (session.getAttribute("msg") != null) {
		        out.println("msg:" + session.getAttribute("msg") + "</br>");
		        session.removeAttribute("msg");
		    }
		%>
	</div>
</body>
</html>