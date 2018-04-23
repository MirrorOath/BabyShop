<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<Link href="${pageContext.request.contextPath }/css/unit.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="../jquery-easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="../jquery-easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="../jquery-easyui/demo/demo.css">
<script type="text/javascript" src="../jquery-easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="../jquery-easyui/jquery.easyui.min.js"></script>
<title>userInfo</title>
</head>
<body>
	<div id="navigation">
		<ul>
			<li class="selected"></li>
			<li><a
				href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=index">首页</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admin/control.jsp">Admin首页</a></li>
			<li></li>
		</ul>
	</div>
	<div>
		<a href="${pageContext.request.contextPath }/admin/queryUsers.action">刷新</a>
		<table>
			<tr>
				<th>用户ID</th>
				<th>用户名</th>
				<th>用户密码</th>
				<th>用户年龄</th>
				<th>用户注册日期</th>
			</tr>
			<c:forEach var="user" items="${users }" varStatus="sta">
				<tr>
					<td>${user.id }</td>
					<td>${user.userName }</td>
					<td>${user.password }</td>
					<td>${user.age }</td>
					<td>${user.date }</td>
					<td><a
						href="${pageContext.request.contextPath }/admin/delUser.action?userId=${user.id }">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table id="dg" title="My Users" style="width: 550px; height: 250px"
			toolbar="#toolbar" idField="id" rownumbers="true" fitColumns="true"
			singleSelect="true">
			<thead>
				<tr>
					<th field="firstname" width="50"
						editor="{type:'validatebox',options:{required:true}}">First
						Name</th>
					<th field="lastname" width="50"
						editor="{type:'validatebox',options:{required:true}}">Last
						Name</th>
					<th field="phone" width="50" editor="text">Phone</th>
					<th field="email" width="50"
						editor="{type:'validatebox',options:{validType:'email'}}">Email</th>
				</tr>
			</thead>
		</table>
		<div id="toolbar">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
				onclick="javascript:$('#dg').edatagrid('addRow')">New</a> <a
				href="#" class="easyui-linkbutton" iconCls="icon-remove"
				plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">Destroy</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save"
				plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">Save</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo"
				plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">Cancel</a>
		</div>
	</div>
</body>
</html>