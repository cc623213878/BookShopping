<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="book">
	<c:forEach items="${books}" var="book" varStatus="st"  >
	    <div class="bookitem">
	        <div class="bookimg"><img height="235px" alt="" src="book_img/${book.img}"></div>
	        <div class="bookcost">￥${book.price}</div>
	        <div class="bookname_author"><a href="">${book.bookname}---(${book.author})</a></div>
	        <div class="bookintroduct">${book.introduction}</div>
	    </div>
    </c:forEach>
</div>
</body>
</html>