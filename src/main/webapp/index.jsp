<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="model.css">
<style>
.xiangmumubiao{
	margin-left:50px;
	font-size:22px;
}
</style>
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
			<p class="xiangmumubiao" style="margin-top:50px">项目目标</p>
			<ul class="xiangmumubiao">
				<li>仿真实现一个基于B/S的书籍库存登记系统</li>
				<li>增量式开发，循序渐进完成项目</li>
				<li>掌握Web应用程序编程和调试技巧</li>
				<li>主要涉及以下主要知识点：
					<ul class="xiangmumubiao">
						<li>Model 2架构的实现</li>
						<li>使用Servlet实现控制器，JSP实现视图</li>
						<li>表单的各种组件的处理</li>
						<li>使用DAO模式，通过DataSource访问数据</li>
						<li>在Web应用程序中整合MySQL数据库</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>