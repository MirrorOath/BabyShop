<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<Link href="${pageContext.request.contextPath }/css/unit.css" rel="stylesheet" type="text/css">
			<link rel="stylesheet" type="text/css" href="../jquery-easyui/themes/default/easyui.css">
			<link rel="stylesheet" type="text/css" href="../jquery-easyui/themes/icon.css">
			<link rel="stylesheet" type="text/css" href="../jquery-easyui/demo/demo.css">
			<script type="text/javascript" src="../jquery-easyui/jquery.min.js"></script>
			<script type="text/javascript" src="../jquery-easyui/jquery.easyui.min.js"></script>
			<script type="text/javascript" src="../jquery-easyui/plugins/jquery.datagrid.js"></script>
			<script type="text/javascript" src="http://www.w3cschool.cc/try/jeasyui/datagrid-detailview.js"></script>
			<script type="text/javascript" src="http://www.w3cschool.cc/try/jeasyui/jquery.edatagrid.js"></script>
			<style type="text/css">
				form {
					margin: 0;
					padding: 0;
				}

				.dv-table td {
					border: 0;
				}

				.dv-table input {
					border: 1px solid #ccc;
				}
			</style>
			<script type="text/javascript">
				$(function () {
					$('#dg').edatagrid({
						url: '../admin/easyUIGetUsers.action',
						saveUrl: 'save_user.php',
						updateUrl: 'update_user.php',
						destroyUrl: 'destroy_user.php'
					});
				});
			</script>
			<title>userInfo</title>
		</head>

		<body>
			<div id="navigation">
				<ul>
					<li class="selected"></li>
					<li>
						<a href="${pageContext.request.contextPath }/user/rg_lg_do.action?rorl=index">首页</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/admin/control.jsp">Admin首页</a>
					</li>
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
							<td>
								<a href="${pageContext.request.contextPath }/admin/delUser.action?userId=${user.id }">删除</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<div class="demo-info" style="margin-bottom: 10px">
					<div class="demo-tip icon-tip">&nbsp;</div>
					<div>Double click the row to begin editing.</div>
				</div>

				<table id="dg" title="My Users" style="width: 700px; height: 250px" toolbar="#toolbar" pagination="true" idField="id" rownumbers="true"
				 fitColumns="true" singleSelect="true">
					<thead>
						<tr>
							<th field="userName" width="50" editor="{type:'validatebox',options:{required:true}}">用户名</th>
							<th field="password" width="50" editor="{type:'validatebox',options:{required:true}}">密码</th>
							<th field="age" width="50" editor="text">年龄</th>
							<th field="date" width="50" editor="{type:'validatebox',options:{validType:'time'}}">注册日期</th>
						</tr>
					</thead>
				</table>
				<div id="toolbar">
					<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg').edatagrid('addRow')">New</a>
					<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">Destroy</a>
					<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">Save</a>
					<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">Cancel</a>
				</div>
			</div>
		</body>

		</html>