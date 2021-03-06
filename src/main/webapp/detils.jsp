<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jnmd.ssh.controller.BookAction,com.jnmd.ssh.domain.Book,java.util.*"%>
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
			<ul style="list-style:none;">
				<li>ID:${book.id }<br/></li>
				<li>书名:${book.name }<br/></li>
				<li>类型:${book.author }<br/></li>
				<li>折扣:${book.discount }<br/></li>
				<li>价格:${book.price }<br/></li>
				<li>数量:${book.count }<br/></li>
				<li>描述:${book.account }<br/></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>