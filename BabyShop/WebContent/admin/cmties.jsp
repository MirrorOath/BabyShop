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
<script type="text/javascript"
	src="../jquery-easyui/plugins/jquery.datagrid.js"></script>
<script type="text/javascript"
	src="http://www.w3cschool.cc/try/jeasyui/datagrid-detailview.js"></script>
<script type="text/javascript"
	src="http://www.w3cschool.cc/try/jeasyui/jquery.edatagrid.js"></script>
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
    $(function() {
        $('#dg').edatagrid({
            url : '../cmty/easyUIGetCmties.action',
            updateUrl : '../cmty/easyUIUpdateCmty.action',
            destroyUrl : '../cmty/easyUIDelCmty.action'
        });
    });
</script>
<title>管理商品</title>
</head>
<body>
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
	<div>
		<div class="demo-info" style="margin-bottom: 10px">
			<div class="demo-tip icon-tip">&nbsp;</div>
			<div>双击进行修改.</div>
		</div>

		<table id="dg" title="管理商品" style="width: 700px; height: 250px"
			toolbar="#toolbar" pagination="true" idField="id" rownumbers="true"
			fitColumns="true" singleSelect="true">
			<thead>
				<tr>
					<th field="name" width="50"
						editor="{type:'validatebox',options:{required:true}}">商品名</th>
					<th field="category" width="50"
						editor="{type:'validatebox',options:{required:true}}">类别</th>
                    <th field="imageSrc" width="50"
                        editor="{type:'validatebox',options:{required:true}}">图片路径</th>
                    <th field="note" width="50"
                        editor="{type:'validatebox',options:{required:true}}">详细信息</th>
					<th field="price" width="50" editor="text">价格</th>
				</tr>
			</thead>
		</table>
		<div id="toolbar">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
				onclick="">添加</a> <a href="#" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true"
				onclick="javascript:$('#dg').edatagrid('destroyRow')">删除</a> <a
				href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"
				onclick="javascript:$('#dg').edatagrid('saveRow')">保存</a> <a
				href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true"
				onclick="javascript:$('#dg').edatagrid('cancelRow')">取消</a>
		</div>
	</div>
</body>
</html>