<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
	<title>后台管理</title>
	<base href="${context}/">
	<meta charset="utf-8" />
	<link rel="stylesheet" href="css/admin.css" />

</head>
<script>
	window.addEventListener("load", function () {
		let navigation = "${category.navigation}";
		document.getElementById("navigation").checked = navigation == "y";
		let deleted = "${category.deleted}";
		document.getElementById("deleted").checked = deleted == "y";
	})

</script>
<body>
<div class="container">
	<div id="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div id="admin_left">
		<ul class="submenu">
			<jsp:include page="left.jsp"></jsp:include>
		</ul>
		<div id="copyright"></div>
	</div>

	<div id="admin_right">
		<div class="headbar">
			<div class="field">
				<table class="list_table">
					<col width="50px" />
					<col width="100px" />
					<col width="100px"/>
					<col width="100px"/>
					<thead>
					<tr>
						<th>分类名称</th>
						<th>是否导航</th>
						<th>是否删除</th>
						<th>操作</th>
					</tr>
					</thead>
				</table>
			</div>
		</div>

		<div class="content">
			<form action="admin/category" >
				<input type="hidden" name="opr" value="update">
				<input type="hidden" name="id" value="${category.id}">
			<table id="list_table" class="list_table">
				<col width="50px" />
				<col width="100px" />
				<col width="100px"/>
				<col width="100px"/>
				<tbody>
				<tr>
					<td>
						<input type="text" name="name" value="${category.name}">
					</td>
					<td>
						<input type="checkbox" name="navigation" value="y" id="navigation">
					</td>
					<td>
						<input type="checkbox" name="deleted" value="n" id="deleted">
					</td>
					<td>
						<input type="submit" value="修改">
					</td>
				</tr>
				</tbody>
			</table>
			</form>
		</div>

	</div>
	<div id="separator"></div>
</div>
</body>
</html>
