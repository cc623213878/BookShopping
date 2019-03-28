<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Utf-8">
<link rel="stylesheet" href="./css/style.css">
<title>购物车</title>
</head>
<body>
<div align="center">
	<table border="1px">
		<tr>
			<td>订单号</td>
			<td>书名</td>
			<td>数量</td>
			<td>单价</td>
			<td>总额</td>
		</tr>
		<c:forEach items="${orders}" var="order" varStatus="st">
			<c:if test="${order.paid==false }">
				<tr>
					<td>${order.orderno }</td>
					<td>${order.bookname }</td>
					<td>${order.number }</td>
					<td>${order.price }</td>
					<td>${order.number*order.price }</td>
					
				</tr>
			</c:if>
		</c:forEach>
		<tr>
			<td colspan="5" align="center">
				<a id="allcost" href="/shoppingcost">结算</a>
			</td>
		</tr>
	</table>
</div>
</body>
</html>