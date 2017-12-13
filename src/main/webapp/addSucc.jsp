<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>入库登记</title>
<link rel="stylesheet" href="<%=path %>/model.css">
<style>
#form {
	margin-top: 30px;
	margin-left: 50px;
}

.c1 {
	margin: 20px 10px;
}

.c2 {
	width: 200px;
	height: 25px;
	margin: 20px 0;
}

.dianji {
	width: 50px;
	height: 20px;
	margin: 20px 40px 0;
}
</style>
</head>
<body>
<c:if test="${not empty list }">
	<c:forEach items="${list }" var="list">
		${list }
	</c:forEach>
</c:if>
	<div id="wrap">
		<div id="title">书记库存登记系统(V1.0)</div>
		<div id="details">
			<div id="handle">
				<div id="wrap_box">
					<p class="box">
						<a class="menu" href="index.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a>
					</p>
					<p class="box">
						<a class="menu" href="addbook.jsp">入库登记</a>
					</p>
					<p class="box">
						<a class="menu" href="limitAction?page=1">库存列表</a>
					</p>
				</div>
			</div>
			<div id="right">
				<h2>添加书籍${name }成功</h2>
			</div>
		</div>
	</div>
</body>
</html>