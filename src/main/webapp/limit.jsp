<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jnmd.ssh.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库存列表</title>
<link rel="stylesheet" href="<%=path %>/model.css">
<style>
table{
	width:700px;
	border:1px solid #ccc;
	margin-left:20px;
	border-collapse: collapse;
}
table tr th,table tr td{
	border:1px solid #ccc;
}
a{
	font-weight:normal;
	font-style:normal;
	text-decoration:none;
}
a:hover{
	text-decoration:underline;
	color:#B16666;
}
a:visited{
	color:blue;
}
#cent{
	position: absolute;
	bottom:50px;
	left:500px;
}
</style>
</head>
<body>
<div id="wrap">
	<div id="title">书记库存登记系统(V1.0)</div>
	<div id="details">
		<div id="handle">
			<div id="wrap_box">
				<p class="box"><a class="menu" href="index.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a></p>
				<p class="box"><a class="menu" href="addbook.jsp">入库登记</a></p>
				<p class="box"><a class="menu" href="limitAction?page=1">库存列表</a></p>
			</div>
		</div>
		<div id="right">
			<table>
				<tr>
					<th>编号</th>
					<th>书名</th>
					<th>作者</th>
					<th>价格</th>
					<th>数量</th>
					<th></th>
					<th></th>
				</tr>
				<c:forEach items="${books }" var="s">
					<tr>
						<th>${s.id }</th>
						<th>${s.name }</th>
						<th>${s.author }</th>
						<th>${s.price }</th>
						<th>${s.count }</th>
						<th><a href="getBookAction?id=${s.id }">详情</a></th>
						<th><a href="deleteAction?id=${s.id }">删除</a></th>
					</tr>
				</c:forEach>
			</table>
			<center id="cent">
					<a href="limitAction?page=1">首页</a>&nbsp;&nbsp;
					
					<c:if test="${page == 1 }">
						上一页&nbsp;&nbsp;
					</c:if>
					<c:if test="${page != 1 }">
						<a href="limitAction?page=${page-1 }">上一页</a>&nbsp;&nbsp;
					</c:if>
					
					<c:if test="${page == pageSum }">
						下一页&nbsp;&nbsp;
					</c:if>
					<c:if test="${page != pageSum }">
						<a href="limitAction?page=${page+1 }">下一页</a>&nbsp;&nbsp;
					</c:if>
					<a href="limitAction?page=${pageSum }">尾页</a><br/><br/>
				</center>
		</div>
	</div>
</div>
</body>
</html>