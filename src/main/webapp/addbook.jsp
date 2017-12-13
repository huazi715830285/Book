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
				<form name="form" id="form" action="addBookAction" method="post">
					书名:<input id="name1" class="c2" type="text" name="name" value="${name }"></input>${nameError }<br> 
					类别:<input class="c1" type="checkbox" name="sort" value="科学" />科学
						<input class="c1" type="checkbox" name="sort" value="教育" />教育 
					 	<input class="c1" type="checkbox" name="sort" value="文学" />文学
					 	<input class="c1" type="checkbox" name="sort" value="生活" />生活 
					 	<input class="c1" type="checkbox" name="sort" value="其他" />其他${sortError } <br>
					作者:<input id="author" class="c2" type="text" name="author" value="${author }"></input><br>
					折扣:<input class="c1" type="radio" name="discount" value=10 />全价 
						<input class="c1" type="radio" name="discount" value=9 />9折 
						<input class="c1" type="radio" name="discount" value=8 />8折 
						<input class="c1" type="radio" name="discount" value=7 />7折
						<input class="c1" type="radio" name="discount" value=6 />6折 ${discountError }<br>
					价格:<input id="price" class="c2" type="text" name="price" value="${price }"></input>${priceError }<br> 
					数量:<input class="c2" type="text" name="count" value="${count }"></input>${countError }<br> 
					简介:<textarea id="account" style="resize: none" name="account" rows="3" cols="40" ></textarea>${accountError }
					<br> <input id="submit" class="dianji" type="submit" value="提交" /> <input
						class="dianji" type="reset" value="重置" />
				</form>
			</div>
		</div>
	</div>
<script>
var form = document.getElementById('form');
var sub = document.getElementById('submit');
var name1 = document.getElementById('name1');
sub.onclick=function(){
	if(form.name.value==""){
		form.name.value="请输入书籍名称";
	}
	if(form.author.value==""){
		form.author.value="请输入作者";
	}
	if(form.price.value==""){
		form.price.value="请输入正确的价格";
	}
	if(form.count.value==""){
		form.count.value="请输入正确的书籍数量";
	}
}
form.name.onfocus=function(){
	if(form.name.value=="请输入书籍名称"){
		form.name.value="";
	}
}
form.author.onfocus=function(){
	if(form.author.value=="请输入作者"){
		form.author.value="";
	}
}
form.price.onfocus=function(){
	if(form.price.value=="请输入正确的价格"){
		form.price.value="";
	}
}
form.count.onfocus=function(){
	if(form.count.value=="请输入正确的书籍数量"){
		form.count.value="";
	}
}
//Library/AddServlet
</script>
</body>
</html>