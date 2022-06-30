<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<title>后台管理</title>
<base href="${context}/">
<meta charset="utf-8" />
<link rel="stylesheet" href="css/admin.css" />
<script>
    function toUpdate(id) {
        location.href = "admin/category?opr=initUpdate&id=" + id;
    }

    function toDelete(id) {
        if (confirm("确定删除?")) {
            location.href = "admin/category?opr=delete&id=" + id;
        }
    }

	function toRecover(id) {
		location.href = "admin/category?opr=recover&id=" + id;
	}
</script>
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
				<div class="field">
					<table class="list_table">
						<col width="50px" />
						<col width="100px" />
						<col width="100px"/>
						<col width="100px"/>
						<col width="100px"/>
						<thead>
							<tr>
								<th>选择</th>
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
				<table id="list_table" class="list_table">
						<col width="50px" />
						<col width="100px" />
						<col width="100px"/>
						<col width="100px"/>
						<col width="100px"/>
					<tbody>
						<tr>
                            <c:forEach items="${categories}" var="category">
						    <td><input type="checkbox" name="ids" value="${category.id}"/></td>
							<td>${category.name}</td>
							<td>
                                <c:if test="${category.navigation=='y'}">是</c:if>
                                <c:if test="${category.navigation=='n'}">否</c:if>
                            </td>
							<td>
                                <c:if test="${category.deleted=='y'}">是</c:if>
                                <c:if test="${category.deleted=='n'}">否</c:if>
                            </td>
							<td><img class="operator" src="images/admin/icon_edit.gif"
                                     alt="修改" title="修改" onclick="toUpdate(${category.id})"/>
                                <img class="operator" src="images/admin/icon_del.gif"
                                     alt="删除" title="删除" onclick="toDelete(${category.id})"/>
								<input type="button" value="恢复已删除" onclick="toRecover(${category.id})">
                            </td>
						</tr>
                        </c:forEach>
                        <tr>
                            <td colspan="5" align="center">
                                <input type="checkbox" >全选
                                <input type="button" value="删除">
                                <input type="button" value="恢复">
                            </td>
                        </tr>
					</tbody>
				</table>
			</div>

		</div>
		<div id="separator"></div>
	</div>
</body>
</html>
