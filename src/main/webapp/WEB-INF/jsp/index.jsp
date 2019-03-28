<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>书籍</title>
    <link rel="stylesheet" href="./css/style.css">
    <script src="./js/jquery.min.js"></script>
</head>
<body>
<div><a href="shoppingcar"><img height="30px" width="30px" alt="" src="img/1.png"></a></div>
<div class="book">
	<c:forEach items="${books}" var="book" varStatus="st"  >
	    <div class="bookitem">
	        <div class="bookimg"><img height="235px" alt="" src="book_img/${book.img}"></div>
	        <div class="bookcost">￥${book.price}<img alt="" src="img/1.png" height="21px" width="21px" class="shopping" onclick="add_shopping('${book.bookid}')"></div>
	        <div class="bookname_author"><a href="">${book.bookname}---(${book.author})</a></div>
	        <div class="bookintroduct">${book.introduction}</div>
	    </div>
    </c:forEach>
</div>
</body>
<script type="text/javascript">
	function add_shopping(input_bookid){
		$.post("addshopping",
		  {
		    bookid: input_bookid,
		    number:1
		  },
		  function(data,status){
		    alert("购物车添加成功");
		  });
	}
</script>
</html>