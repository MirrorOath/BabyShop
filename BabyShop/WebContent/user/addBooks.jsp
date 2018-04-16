<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addBooks</title>
</head>
<body>
	<div>
		<form action="${pageContext.request.contextPath}/admin/addBook.action" method="post">
			<table border="1">
				<caption><h2>添加图书</h2></caption>
				<tr>
					<td> 书名：</td><td><input type="text" size="20" name="bookName" required></td>
				</tr>
				<tr>
					<td> 出版社名：</td><td><input type="text" size="20" name="press" required></td>
				</tr>
				<tr>
					<td> 作者名：</td><td><input type="text" size="20" name="author" required></td>
				</tr>
				<tr>
					<td><td colspan="2"><input type="submit" value="添加Book" name="subbutton" ></td>
				</tr>
			</table>

		</form>
	</div>
	<div>${msg }</div>

</body>
</html>