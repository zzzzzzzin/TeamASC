<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
   .board-main {
      width:68%;
      position:relative;
      left:18%;
      float:center;
      top:5%;
      height: 100%;
   }
   .table { 
      display:block;
      border-collapse: collapse;
      width:700px;
      height: 85%;
      table-layout: fixed;
      overflow: auto;
   }
   .table tr,td {      
      border: 1px solid gray;
      word-break:break-all;   
   }
   .button {
      color:white;
      background-color: #384D59;
      border:0;
      padding: 8px 15px;
      margin-left:15px;
      border-radius:5px;
      font-weight: bold;
      margin-top: 5px;
   }
   .table-title {
      width:10%;
      height:40px;
      text-align: center;
      font-weight: bold;
   }
   .button-option {
      position:absolute;
      left:25%;
   }
   .table-content {
      height : 500px;
      overflow: auto;
   }
   .table-short {
      text-align: center;
      width: 15%;
   }
   .text-padding {
      padding-left: 15px;
      padding-right: 15px;
   }
   .button-option-list {
      position:relative;
      left:58%;
   }
   .image-file {
      width:400px;
      height:400px;
      position:relative;
      margin-left: 13%;
   }
   .reply-table {
      width:670px;
      border-collapse: collapse;
   }

   .reply-button {
      width:100px;
   }
   .reply-button {
      color:white;
      background-color: #384D59;
      padding: 8px 15px;
      border:0;
      border-radius:5px;
      font-weight: bold;
   }
   .reply-table tr,td {      
      border: 0px solid gray;
      word-break:break-all;   
   }
   .reply-writer {
      width:150px;
      font-weight: bold;
      font-size: 20px;
   }
   .reply-content {
      border-bottom : 1px gray solid;
      padding-bottom: 20px;
      padding-top: 10px;
      font-size: 15px;
      padding-left: 15px;
   }
   .reply-date {
      font-size: 12px;
      width: 425px;
   }
   .reply-edit-button {
      color:white;
      background-color: #384D59;
      padding: 5px 7px;
      border:0;
      border-radius:5px;
      font-weight: bold;
   }
   .reply-edit-button-1 {
      color:white;
      background-color: #384D59;
      padding: 5px 7px;
      border:0;
      border-radius:5px;
      font-weight: bold;
   }
   .content-input {
      border:0;
      font-size:15px;
   }
   .viewReply {
      border:none;
      resize: none;
   }
   textarea {
      resize: none;
   }
   .button-div {
   		display: inline-block;
   }
</style>

</head>
<body>
<div class="board-main">
<input type="hidden" name="projectSeq" value="${project.projectSeq }">
<br><br>
   <table class="table">
      <tr>
         <td class="table-title">분류</td><td class="table-short">${board.boardCategory }</td>
         
         <td class="table-title">작성자</td><td class="table-short">${member.id}</td>
         <td class="table-title">완료여부</td>
            <c:choose>
               <c:when test="${board.completeYn eq 'N' }">
               <td class="table-short">진행중</td></c:when>
            <c:otherwise>
               <td class="table-short">완료</td></c:otherwise>
            </c:choose>
      </tr>
      <tr>
         <td class="table-title">제목</td><td class="text-padding" colspan="5">${board.boardTitle}</td>
         
      </tr>
      <tr>
         <td class="table-title">내용</td><td class="table-content text-padding" colspan="5">
         <c:if test="${not empty ext }">
            <img class="image-file" src="./getImage?fileName=${board.fileName}" alt="fileName=${board.fileName}" />
         </br></br>
         </c:if>
         ${board.boardContent}</td>
      </tr>
      <tr>
         <td class="table-title">첨부파일</td>
            <c:if test="${board.fileName ne null}">
         <td class="text-padding" colspan="5">
            <a href="./fileDownload?fileName=${board.fileName}&realFileName=${board.realFileName}">
               ${board.realFileName}
            </a>
         </td>
         </c:if>
      </tr>
      </table>

   
         <c:choose>
         <c:when test="${member.userSeq == board.userSeq && board.completeYn eq 'N' || member.id eq 'admin' 
                     || project.teamLeaderSeq == member.userSeq && board.completeYn eq 'N'}">
      <div class="button-option">
               <a href="../board/viewUpdateBoard?boardSeq=${board.boardSeq}"><input  class="button" type="button"  value="수정"></a>
               <a href="../board/deleteBoard?boardSeq=${board.boardSeq}&projectSeq=${project.projectSeq }"><input class="button" type="button" onclick="return confirm('게시글을 삭제하시겠습니까?');" value="삭제"></a>
      </div>      
               <a class="button-option-list" href="./boardListPaging?projectSeq=${project.projectSeq }&pageNum=1"><input class="button" type="button"  value="리스트"></a>
         
         </c:when>
         <c:otherwise>
            <a class="button-option-list" href="./boardListPaging?projectSeq=${project.projectSeq }&pageNum=1"><input class="button" type="button"  value="리스트"></a>
         </c:otherwise> 
         </c:choose>
   </br></br>
   <div>
      <div>
      <form action="./writeReply" method="POST">
      <input type="hidden" name="projectSeq" value="${project.projectSeq }">
      <input type="hidden" name="userSeq" value="${member.userSeq }">
      <input type="hidden" name="boardSeq" value="${board.boardSeq }">
         <table class="reply-table">
            <tr><td><textarea rows="5" cols="77" placeholder="댓글을 입력하세요" name="replyContent"></textarea> </td>
               <td><input class="reply-button" type="submit"  value="댓글작성"></td></tr>
         </table>
      </form>
      </div>
         </br>
      <form id="form1" method="POST">
      <input type="hidden" name="boardSeq"  value="${board.boardSeq }">
      <input type="hidden" name="replySeq"  value="${reply.replySeq }">
      
      <div>
         <table class="reply-table">
         <c:forEach var="reply" items="${replyList}">
         <div>
            <tr>
               <td class="reply-writer" style="width=5%;">${reply.id}</td>
               <td class="reply-date">${reply.createDate}</td>
               <c:choose>
                  <c:when test="${member.userSeq eq reply.userSeq }">
                  <td rowspan="2" class="reply-edit" id="btn_${reply.replySeq }">
                  <div  class="button-div" id="editReplyBtn_${reply.replySeq }">
                 	<button type="button" class="reply-edit-button-1" onmouseover="whatIsSeq(${reply.replySeq});" id="editReply_${reply.replySeq}">수정</button>
                  </div>
                  <button type="button" class="reply-edit-button" onclick="deleteReply(${reply.replySeq});">삭제</button> 
                     </tr>
                  <tr>
                        <td colspan="2" class="reply-content">
                        <div id="editReplyContent_${reply.replySeq}">
                        	<textarea class="viewReply" rows='3' cols='75' name="replyContent" id="td_${reply.replySeq }" readonly="readonly">${reply.replyContent}</textarea>
                  		</div>
                  		</td>
                  </tr>
                  </c:when>
                  <c:otherwise>
               <td rowspan="2" class="reply-edit" id="btn_${reply.replySeq }">
               </td>
               </tr>
            
               <tr>
                  <td colspan="2" class="reply-content">
                 <div id="editReplyContent_${reply.replySeq }">
                  <textarea class="viewReply" rows='3' cols='75' name="replyContent" id="td_${reply.replySeq }" readonly="readonly">${reply.replyContent}</textarea></td>
              	</div>
               </tr>
               </c:otherwise>
               </c:choose>
            </div>
         </c:forEach>
         
         </table>
      </div>
      </form>
      </div>
   </div>
</div>
<script type="text/javascript">
whatIsSeq = function(replySeq) {
	console.log("seq");
	console.log(replySeq);
	$('#editReplyBtn_'+replySeq).on('click',function() {
		let html = "";
		let data = document.getElementById('td_'+replySeq).value;
		console.log(data);
		html += '<textarea style="border:1px solid gray;"class="viewReply" rows="3" cols="75" name="replyContent" id="td_';
		html += replySeq;
		html += '">';
		html += data;
		html += '</textarea>';
		document.getElementById('editReplyContent_'+replySeq).innerHTML = html;

		let html2 = "";
		html2 += '<button type="button" class="reply-edit-button-1" onclick="up(';
		html2 += replySeq;
		html2 += ',${board.boardSeq });" >수정</button>';	
		document.getElementById('editReplyBtn_'+replySeq).innerHTML = html2;
		document.getElementById('editReplyContent_'+replySeq).focus()
	})
	}

function up(seq,boardId) {
      if(confirm("수정하시겠습니까?")) {
      var editReplyContent = $('#td_'+seq).val();
      this.form1.action="./updateReply?replySeq="+seq+"&replyContent="+editReplyContent;
      this.form1.submit();
       }
   }; 
   
	function deleteReply(seq) {
		let message = confirm("댓글을 삭제하시겠습니까?");
		if(message){
		$.ajax({
			type:'delete',
			url:'./deleteReply/'+seq,
			
			success:function(data,response){
				let jsonBoolean = JSON.parse(data);
                if(jsonBoolean){
				console.log("success "+jsonBoolean);
				location.reload();
				}
			},
			error:function(e) {
				console.log("error");
			},
			complete:function(response) {
				console.log("comlete");
			}
		});//ajax
		}
	};//deleteReply
   </script>
</body>
</html>