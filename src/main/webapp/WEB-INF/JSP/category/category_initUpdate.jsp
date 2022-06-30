<%-- Created by IntelliJ IDEA. User: NST Date: 2022/6/30 Time: 10:47 To change this template use File | Settings | File
  Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
    window.addEventListener("load", function () {
        let navigation = "${category.navigation}";
        document.getElementById("navigation").checked = navigation == "y";
        let deleted = "${category.deleted}";
        document.getElementById("deleted").checked = deleted == "y";
    })

</script>
<head>
    <title>Title</title>
</head>

<body>
<form action="category">
    <input type="hidden" name="opr" value="update">
    <input type="hidden" name="id" value="${category.id}">
    <input type="text" name="name" value="${category.name}"> <br>
    <input type="checkbox" name="navigation" value="y" id="navigation"> <br>
    <input type="checkbox" name="deleted" value="n" id="deleted"> <br>
    <input type="submit" value="修改">
</form>
</body>

</html>