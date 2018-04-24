<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
	name="viewport" content="width=device-width, initial-scale=1.0">
<Link href="${pageContext.request.contextPath }/css/unit.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">

<title>添加商品</title>
</head>
<body>
	<script src="${pageContext.request.contextPath }/easyUI/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>

    <div id="navigation">
        <ul>
            <li class="selected"></li>
            <li><a
                href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=index">首页</a></li>
            <li><a
                href="${pageContext.request.contextPath }/admin/userInfo.jsp">管理用户</a></li>
            <li><a
                href="${pageContext.request.contextPath }/admin/cmties.jsp">管理商品</a></li>
            <li><a
                href="${pageContext.request.contextPath }/admin/addCmty.jsp">添加商品</a></li>
            <li></li>
        </ul>
    </div>

	<div>${msg }</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span4"></div>
			<div class="span4">
				<form
					action="${pageContext.request.contextPath}/admin/addCmty.action"
					method="post" enctype="multipart/form-data">
					<h3>添加商品</h3>
					<p class="help-block">选择图片</p>
					<input type="file" name="image" />
					<p class="help-block">商品名</p>
					<input type="text" size="20" name="name" required />
					<p class="help-block">类别</p>
					<input type="text" size="20" name="category" required />
                    <p class="help-block">详情</p>
                    <input type="text" size="20" name="note" required />
					<p class="help-block">价格</p>
					<input type="text" size="20" name="price" required />
					<button type="submit" class="btn">提交</button>
				</form>
			</div>
			<div class="span4"></div>
		</div>
	</div>

</body>
</html>