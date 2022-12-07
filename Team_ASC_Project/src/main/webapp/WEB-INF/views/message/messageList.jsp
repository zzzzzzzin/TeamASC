<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>messageList</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap');
	
	#msWrap {
		width: 70%;
		height: 100%;
		margin-left: 5%;
		/* border: 3px solid black;  */
	}
	h1 {
		height: 60px;
		padding: 10px 0;
		text-align: center;
		/* border: 1px solid black; */
	}
	.msSearch {
		float: left;
		/* border: 1px solid black; */
	}
	.msKeyword {
		width: 200px;
		height: 30px;
		margin-right: 10px;
		border-radius: 5px;
		border: 1px solid lightgray;
		
	}
	.msKeyword:focus {
		outline: 3px solid #0F2859;
		opacity: 0.5;
	}
	.searchBtn {
		width: 50px;
		height: 30px;
	}
	.msbDiv {
		float: right;
		margin-bottom: 30px;
		/* border: 1px solid black; */
	}
	.msBtn {
		width: 100px; 
		height: 40px; 
		border: 2px solid #384D59;
		border-radius: 5px; 
		font-size: 15px; 
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
		color: #384D59;
		background-color: white;
	}
	table{
		margin: auto;
		width: 100%;
		color: #384D59;
		border-collapse: collapse;
		border-radius: 10px;
 		border-style: hidden;
		box-shadow: 1px 1px 5px 1px lightgray;
		text-align: center;
	}
	td {
		border: 1px solid lightgray;
	}
	.msName {
		width: 100px;
	}
	.msContent {
		width: 400px;
		text-align: left;
	}
	.msContent>a {
		text-decoration: none;
		display: block;
		color: #384D59;
		padding: 40px 0 40px 10px;

	}
	.msContent>a:hover {
		text-decoration: none;
		display: block;
		color: #384D59;
		background-color: #F1F3F5;
		padding: 40px 0 40px 10px;

	}
	.msTime {
		width: 100px;
		color: gray;
	}
	.msPaging {
		margin-top: 80px;
		margin-bottom: 80px;
		text-align: center;
	}
	.msPaging>li {
		display: inline-block;
		text-decoration: none;
	}
	.msPaging>li>a {
		display: inline-block;
		justify-content: center;
		text-decoration: none;
		font-size: 14px;
		width: 25px;
		height: 25px;
		color: #384D59;
		border: 1px solid gray;
	}
</style>
</head>
<body>
<div id="msWrap">
	<h1>메세지 리스트</h1>
	<%-- <div class="msSearch">
		<form action="../message/searchMessage?toUserSeq=${message.toUserSeq}" method="GET">
			<input type="hidden" name="toUserSeq" value="${message.toUserSeq}">
			<input type="text" name="keyword" value="${message.keyword}" class="msKeyword">
			<input type="submit" value="검색" class="searchBtn">
		</form>
	</div> --%>
<!-- 	<div class="msbDiv">
		<button class="msBtn" onclick="location.href='viewCreateMessage'">
			메세지 작성
		</button>
	</div> -->
	<table>
		<c:forEach var="message" items="${list}">
			<tr>
				<td class="msName"><c:if test="${message.readCount eq 0}">❗</c:if>${message.fromUserName}</td>
				<td class="msContent"><a href="/asc/message/readMessage?messageSeq=${message.messageSeq}">${message.content}</a></td>
				<td class="msTime">${message.sendTime}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="msPaging">
		<c:forEach var="num" items="${pageRange}" varStatus="status">
			<li>
				<a href="./messageList?toUserSeq=${message.toUserSeq}&keyword=${message.keyword}&pageNum=${status.count}&totalMessageNum=${page.totalBoardNum}" name="pageNum">${status.count}</a>
			</li>
		</c:forEach>
	</div>
</div>
</body>
</html>