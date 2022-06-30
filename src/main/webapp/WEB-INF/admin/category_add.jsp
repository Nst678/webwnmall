<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<title>后台管理</title>
<base href="${context}/">
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
			<div class="content_box">

				<div class="content form_content">
					<form action="admin/category" method="post">
						<input type="hidden" name="opr" value="add" />
						<table class="form_table" cellpadding="0" cellspacing="0">
							<col width="150px" />
							<col />
							<tr>
								<th>分类名称：</th>
								<td><input class="normal" name="name" type="text" value=""><label>*
										必选项</label></td>
							</tr>
							<tr>
								<th>是否导航：</th>
								<td><input  name="navigation" type="checkbox" value="y"><label>*
										必选项</label></td>
							</tr>
							<tr>
								<td></td>
								<td><button class="submit" type="submit">
										<span>确 定</span>
									</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="separator"></div>
	</div>
</body>
</html>
