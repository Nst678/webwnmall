<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<base href="${context}/" /><%--动态上下文内容，灵活导入css样式--%>
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/admin.css" />
</head>
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
				<div class="searchbar">
					<form action="admin/goods" method="get" id="form1"'>
						<input type="hidden" name="opr" value="list" />
						<input type="hidden" name="p" id="p" value="1" />
						<select class="auto" name="categoryId" id="category">
 							<option value="0">选择分类</option>
						</select> 商品名： <input class="small" name="name" id="name" type="text" value="${goods.name}">
						销售价:<input class="small" name="minPrice" id="name" type="text" value="">至<input class="small" name="maxPrice" id="name" type="text" value="">
						<input class="small" name="minPrice" id="test1" type="text" value="">
						
						<button class="btn" type="submit">
							<span class="sel">筛 选</span>
						</button>
					</form>
				</div>

				<div class="field">
					<table class="list_table">
						<col width="40px" />
						<col width="400px" />
						<col width="120px" />
						<col width="70px" />
						<col width="70px" />
						<col width="70px" />
						<thead>
							<tr>
								<th>选择</th>
								<th>商品名称</th>
								<th>分类</th>
								<th>销售价</th>
								<th>库存</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<form action="" method="post" name="orderForm">
				<div class="content">
					<table class="list_table">
						<col width="40px" />
						<col width="400px" />
						<col width="120px" />
						<col width="70px" />
						<col width="70px" />
						<col width="70px" />
						<tbody>
							<c:forEach items="${pageBean.data}" var="goods">
								<tr>
									<td><input name="" type="checkbox" value="1" /></td>
									<td><a href="" target="_blank" >${goods.name}</a></td>
									<td>${goods.category.name}</td>
									<td></td>
									<td></td>
									<td><a href=""><img
											class="operator" src="images/admin/icon_edit.gif" alt="编辑" /></a>
										<a href="javascript:void(0)""><img
											class="operator" src="images/admin/icon_del.gif" alt="删除" /></a></td>
								</tr>
								</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
			</div>
		</div>
		<div id="separator"></div>
	</div>
</body>
</html>