<%--
  Created by IntelliJ IDEA.
  User: NST
  Date: 2022/6/29
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script>
    function toUpdate(id) {
        location.href = "category?opr=initUpdate&id=" + id;
    }

    function toDelete(id) {
        if (confirm("确定删除?")) {
            location.href = "category?opr=delete&id=" + id;
        }
    }

    function toRecover(id) {
        location.href = "category?opr=recover&id=" + id;
    }

</script>
<head>
    <title>Title</title>
</head>
<body>
<form action="category">
    <table>
        <tr>
            <td>全选</td>
            <td>名称</td>
            <td>是否导航</td>
            <td>是否已删除</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${categories}" var="category">
            <%-- var属性用于指定将当前迭代的元素保存到page域中的名称
                 items属性用于指定将要迭代的集合对象--%>
            <tr>
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
                <td>
                    <input type="button" value="修改" onclick="toUpdate(${category.id})"/>
                </td>
                <td>
                    <input type="button" value="删除" onclick="toDelete(${category.id})">
                </td>
                <td>
                    <input type="button" value="恢复已删除" onclick="toRecover(${category.id})">
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4" align="center">
                <input type="submit" value="删除">
                <input type="submit" value="恢复">
            </td>
        </tr>
    </table>
    <input type="hidden" name="opr" value="oprMany">
</form>
</body>
</html>
