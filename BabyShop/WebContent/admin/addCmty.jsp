<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品</title>
</head>
<body>
	<div>
		<form action="${pageContext.request.contextPath}/admin/addCmty.action" method="post">
			<table border="1">
				<caption><h2>添加商品</h2></caption>
				<tr>
					<td> 商品名:</td><td><input type="text" size="20" name="name" required></td>
				</tr>
				<tr>
					<td> 类别:</td><td><input type="text" size="20" name="category" required></td>
				</tr>
				<tr>
					<td> 价格:</td><td><input type="text" size="20" name="price" required></td>
				</tr>
				<tr>
					<td><td colspan="2"><input type="submit" value="添加商品" name="subbutton" ></td>
				</tr>
			</table>

		</form>
	</div>
	<div>${msg }</div>

</body>
</html>