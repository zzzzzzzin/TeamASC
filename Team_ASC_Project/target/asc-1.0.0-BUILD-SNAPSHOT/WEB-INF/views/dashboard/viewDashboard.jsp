<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var percent = document.getElementById("progress").value;
	var completeFunction = document.getElementById("completeFunc").value;
	var countFunction = document.getElementById("func").value;
	var ratio = (Math.round((completeFunction/countFunction)*100)/100)*100;
	  draw(percent, '.pie-chart1', '#0F2859');
	  draw(ratio, '.pie-chart2', '#0F2859');
	});

	function draw(max, classname, colorname){
	   var i=1;
	    var func1 = setInterval(function(){
	      if(i<max){
	          color1(i,classname,colorname);
	          i++;
	      } else{
	        clearInterval(func1);
	      }
	    },10);
	}
	function color1(i, classname,colorname){
	   $(classname).css({
	        "background":"conic-gradient("+colorname+" 0% "+i+"%, #ddd "+i+"% 100%)"
	   });
	}
	

</script>
<style type="text/css">
#sm4{
   background-color:#0F2859;
   border-radius: 5px;
   color:white;
   opacity:1.0;
   font-weight: bold;
}
.dashboard {
    text-align:center;
    width: 100%;
    height: 800px;
    text-decoration: none;
}

.dashboardUp {
    width: 100%;
    height: 45%;
    text-align:center;
    margin-left:70px;
}

.project {
    width: 550px;
    height: 100%;
    background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    vertical-align:middle;
    margin-top: 10px;
    border-radius: 10px;
    float:left;
    margin-left:10px;
}

.team {
    width: 400px;
    height: 100%;
    background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    vertical-align:middle;
    margin-top: 10px;
    border-radius: 10px;
    float:left;
    margin-left:10px;
}

.one {
	width: 400px;
	height: 100%;
	clear: both;
    float:left;
}

.today {
    width: 400px;
    height: 75%;
    background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    margin-top: 10px;
    border-radius: 10px;
    
}
.d_day {
    width: 400px;
    height: 20%;
    background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    margin-top: 10px;
    border-radius: 10px;
}

.dashboardMid {
    width: 100%;
    height: 15%;
    text-align:center;
    margin-top: 10px;
  }
  .delay-task {
    width: 400px;
    height: 100%;
    background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    vertical-align:middle;
    margin-top: 10px;
    border-radius: 10px;
}
  .count-issue {
    width: 400px;
    height: 100%;
    background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    vertical-align:middle;
    margin-top: 10px;
    border-radius: 10px;
}

.count-edit {
    width: 400px;
    height: 100%;
    background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    vertical-align:middle;
    margin-top: 10px;
    border-radius: 10px;
}

.dashboardDown {
    width: 100%;
    height: 35%;
    text-align:center;
    margin-top: 10px;
}

.error {
    width: 603px;
    height: 100%;
    background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    vertical-align:middle;
    margin-top: 7px;
    border-radius: 10px;
}

.document {
    width: 603px;
    height: 100%;
    background-color:rgba(119, 134, 165, 0.2);
    display:inline-block;
    vertical-align:middle;
    margin-top: 7px;
    border-radius: 10px;
}

.title {
    text-align: left;
    margin-top: 10px;
    margin-left: 10px;
    margin-bottom: 5px;
    font-family: "고딕체";
    font-weight: bold;
}
.issue-table {
   display:block;
   border-collapse: collapse;
   width:95%;
   height: 300px;
   table-layout: fixed;
   overflow: auto;
   margin-left: auto;
   margin-right: auto;
   text-decoration: none;
}
.issue-table th {
   border-bottom: 2px solid gray;
}
.issue-table td {
   /* border-bottom: 1px solid gray; */
}
   .table-title {
      display: block;
      overflow:hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      vertical-align: middle;
      max-width: 230px;
      height: 25px;
   }
   .text-deco {
      text-decoration : none;
      color : black;
   }
   .issue-table-short {
      width: 100px;
   }
   .issue-table-long {
      width: 230px;
   }
   
.pie-chart {
  position: relative;
  display:inline-block;
  width: 200px;
  height: 200px;
  border-radius: 50%;
  transition: 0.3s;
}
span.center{
  background: #e9ecef;
  display : block;
  position: absolute;
  top:50%; 
  left:50%;
  width:100px; 
  height:100px;
  border-radius: 50%;
  text-align:center; 
  line-height: 100px;
  font-size:20px;
  transform: translate(-50%, -50%);
  font-weight: bold;
}
.progressChart {
	display:inline-block;
}
.progress {
	width : 80%;
	vertical-align: baseline;
  --bs-progress-height: 1.4rem;
  --bs-progress-font-size: 0.75rem;
  --bs-progress-bg: #ddd;
  --bs-progress-border-radius: 0.375rem;
  --bs-progress-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.075);
  --bs-progress-bar-color: #fff;
  --bs-progress-bar-bg: #0F2859;
  --bs-progress-bar-transition: width 0.6s ease;
  /* display: flex; */
  display : inline-block;
  height: var(--bs-progress-height);
  overflow: hidden;
  font-size: var(--bs-progress-font-size);
  background-color: var(--bs-progress-bg);
  border-radius: var(--bs-progress-border-radius);
}

.progress-bar {
  /* display: flex; */
  display : inline-block;
  float:left;
  flex-direction: column;
  justify-content: center;
  overflow: hidden;
  color: var(--bs-progress-bar-color);
  text-align: center;
  white-space: nowrap;
  background-color: var(--bs-progress-bar-bg);
  transition: var(--bs-progress-bar-transition);
  height: var(--bs-progress-height);
}
.task-page {
	height: 300px;
	margin-left: 15px;
	/* border: 3px solid red; */
}

.arrow-prev, .arrow-next {
    width:60px;
    height:60px;
    float: left;
    margin-top: 120px;
}

.arrow-prev:after {
    left: 35px; 
    top: 20px;
    content: '';
    width: 20px; /* 사이즈 */
    height: 20px; /* 사이즈 */
    border-top: 5px solid #0F2859; /* 선 두께 */
    border-right: 5px solid #0F2859; /* 선 두께 */
    transform: rotate(225deg); /* 각도 */
    display: inline-block;
    margin-top: 15px;
}

.arrow-next:after {
    left: 10px; 
    top: 12px;
    content: '';
    width: 20px; /* 사이즈 */
    height: 20px; /* 사이즈 */
    border-top: 5px solid #0F2859; /* 선 두께 */
    border-right: 5px solid #0F2859; /* 선 두께 */
    transform: rotate(45deg); /* 각도 */
    display: inline-block;
    margin-top: 15px;
}

.task {
	width: 250px;
	height: 100%;
	float: left;
}

.task-member {
	margin-top:20px;
	font-size: 20px;
	height: 20%;
}
.task-task{
	margin-top:20px;
	font-size: 20px;
	height: 80%;
}

</style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet"> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  


<title>Insert title here</title>
</head>
<body>
<div class="body">
    <div class="dashboard">
        <div class="dashboardUp">
	        <div class="one">
		       	 <div class="d_day">
			       	 <div class="title">D-day</div>
				       	 
				       		 <font style="text-align : center; margin-bottom: 5px; font-size:30px; font-weight:bold;">D - ${dDay }</font>
				       	 
		       	 </div>
	         	<div class="today">
	                <div class="title">오늘의 할일</div>
	                <c:forEach var="member" items="${memberName }" varStatus="status">
	                <input type="hidden" value= "${f:length(memberName)}" id="length">
	                	<input type="hidden" value="${status.first }" id="statusFirst_${status.index }">
	                	<input type="hidden" value="${status.last }" id="statusLast_${status.index }">
	                	<input type="hidden" value="${member }" id="member_${status.index }">
	                	<input type="hidden" value="${memberTask[status.index] }" id="task_${status.index }">
	                </c:forEach>
	                <div class="task-page" id="taskPage">
		                <input type="hidden" value="${page[0] }" id="page">
			                <div class="arrow-prev" onclick='count(0);'></div>
			                <div class="task" style="display: inline-block;">
				               	<div class="task-member">
				               	<input type="hidden" value="${memberName[0] }" id="memberName">
				                	${memberName[0] }<br><br><br>
				                </div>
				                <div class="task-task">
				                <input type="hidden" value="${memberTask[0] }" id="memberTask">
					                ${memberTask[0] }
					            </div>
					        </div>
				            <div class="arrow-next" onclick='count(1);'></div>
		            </div>
	            </div>
	            </div>
            <div class="project">
                <div class="title">프로젝트 진행률</div>
	                <div class="progressChart">
	               <div>전체 진행률</div>
	               <br>
	               		<div class="pie-chart pie-chart1"><span class="center" ><input type="hidden" id="progress" value="${progressRate }">${progressRate }%</span></div>
	                </div>
	                <div class="progressChart" style="padding-left:50px;">
                	 <div>완성 기능수</div>
                	    <br>
	                	<div class="pie-chart pie-chart2"><span class="center" ><input type="hidden" id="completeFunc" value="${completeFunction }">${completeFunction }/${countFunction }</span></div>
	                	<input type="hidden" id="func" value="${countFunction }">
	                </div>
          	 </div>
            <div class="team">
                <div class="title">팀원별 진행률</div>
    			 <div style="font-size: 5px;">&nbsp</div>
                <div style="height:100%;">
                 <c:forEach var="member" items="${teamMemberList }" varStatus="status">
                	<div>
                	<div style="font-size: 15px;">${member.name }  |  진행률 : ${memberProgressRate[status.index] }%  |  기능 : ${memberCompleteFunction[status.index] }/${memberFunction[status.index]  } </div>
                	<div style="font-size: 10px;">&nbsp</div>
                	<div class="progress">
                		<c:if test="${memberProgressRate[status.index]==0 }">
							${memberProgressRate[status.index] }%
						</c:if>
					 	<div class="progress-bar" style="width:${memberProgressRate[status.index] }%; " role="progressbar" aria-valuenow="" aria-valuemin="0" aria-valuemax="100">${memberProgressRate[status.index] }%</div>
					</div>
						<div>
						</div>
						<div class="progress">
						<c:if test="${memberFunctionRate[status.index]==0 }">
							${memberFunctionRate[status.index] } (${memberCompleteFunction[status.index] }/${memberFunction[status.index]  })
						</c:if>
						  <div class="progress-bar" style="width:${memberFunctionRate[status.index] }%;" role="progressbar" aria-valuenow="" aria-valuemin="0" aria-valuemax="100">${memberFunctionRate[status.index] }% (${memberCompleteFunction[status.index] }/${memberFunction[status.index]  })</div>
						</div>
                	</div>
                	<br>
                </c:forEach>
                </div>
            </div>
        </div>
        
        <div class="dashboardMid">
        	<div class="delay-task">
        		 <div class="title">딜레이 일정</div>
        		 <div class="">
        		 		
	        			${delayTask }건
	        		</div>
        	</div>
        	<div class="count-issue">
        		<div class="title">진행중 이슈 수</div>
	        		<div class="">
	        		에러 :	${countError }건 <br>
	        		논의 :	${countIssue }건
	        		</div>
        	</div>
        	<div class="count-edit">
        		<div class="title">일정 수정횟수</div>
        	</div>
        </div>
        
        <div class="dashboardDown">
            <div class="error">
                <div class="title">이슈 리스트</div>
                <div>
                   <input type="hidden" name="projectSeq" value="${project.projectSeq }">
               <table class="issue-table">
                  <tr align="center">
                     <th class="issue-table-short">분류</th><th class="issue-table-long">제목</th><th class="issue-table-short">작성자</th><th class="issue-table-short">작성일자</th><th class="issue-table-short">완료여부</th>
                  </tr>
                  <c:forEach var="board" items="${errorList}" begin="0" step="1" >
                  <tr align="center">
                     <td>${board.boardCategory}</td>
                     <td class="table-title"><a class="text-deco" href="../board/readBoard?boardSeq=${board.boardSeq}">${board.boardTitle}</a></td>
                     <td>${board.id}</td>
                     <td>${board.createDate}</td>
                     <c:choose>
                        <c:when test="${board.completeYn eq 'N' }"><td>진행중</td></c:when>
                        <c:otherwise><td>완료</td></c:otherwise>
                     </c:choose>
                  </tr>
                  </c:forEach>   
               </table>
                </div>
            </div>
            <div class="document">
                <div class="title">문서 목록</div>
                <div class="" align="center">
               <c:forEach var="documents" items="${documentsList}" varStatus="index">
                  <label>
                     <a href="../documents/readPlan?projectSeq=${documents.projectSeq}&pageNum=${documents.pageNum}" class="none">
                        ${documents.documentsName}
                     </a>
                     <input type="hidden" value="${documents.documentsSeq}">
                  </label>
               </c:forEach>
            </div>
            </div>
        </div>
    </div>    
</div>
<script type="text/javascript">
function count(type)  {
var pageNum = document.getElementById('page').value;
console.log(pageNum);
var first = document.getElementById('statusFirst_'+pageNum).value;
var last = document.getElementById('statusLast_'+pageNum).value;
var length = document.getElementById('length').value;
console.log("first="+first);
console.log("last="+last);
console.log("length="+length);

// 더하기/빼기
if(first === "true") {
	if(type === 1) {
		  pageNum = parseInt(pageNum) + 1;
	  }else if(type === 0)  {
		  pageNum = parseInt(length)-1;
	  }
} else if(last === "true") {
	if(type === 1) {
		  pageNum = 0;
	  }else if(type === 0)  {
		  pageNum = parseInt(pageNum) - 1;
	  }
} else {
	 if(type === 1) {
		  pageNum = parseInt(pageNum) + 1;
	  }else if(type === 0)  {
		  pageNum = parseInt(pageNum) - 1;
	  }
}
console.log("pageNum="+pageNum);

var html = "";
var memberNamePage = document.getElementById('member_'+pageNum).value;
console.log(memberNamePage);
var memberTaskPage = document.getElementById('task_'+pageNum).value;
console.log(memberTaskPage);

html += '<input type="hidden" value="';
html += pageNum;
html += '" id="page">';
html += '<div class="arrow-prev" onclick=';
html += '"count(0)"></div>';
html += '<div class="task" style="display: inline-block;">';
html += '<div class="task-member">';
html += memberNamePage;
html += '<br><br><br>';
html += '</div>';
html += '<div class="task-task">';
html += memberTaskPage;
html += '</div>';
html += '</div>';
html += '<div class="arrow-next" onclick=';
html += '"count(1)"></div>';

document.getElementById('taskPage').innerHTML = html;
}	
</script>
</body>
</html>