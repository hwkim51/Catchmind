<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catchmind</title>
<style>
div{
	box-sizing : border-box;
    margin : 0px;
    padding : 0px;  
}

.wrap{
    width:1200px;
    height:1000px;
    margin-left:80px;
}

.body{
    width:100%;
}
.left{
    width:12.5%;
    height:100%;
    float:left;
}

.right {
    width : 87.5%;
    height : 100%;
    float:left;
}

.body-content{
   margin:auto;
   width:80%;
   height:100%;
   background-color: rgb(250, 243, 235);
}

#title {
    font-size : 30px;
    font-weight : bolder;
    padding-left : 20px;
}

#toMain {
    font-size : 35px;
    font-weight : bolder;
    color : orange;
    float : right;
    padding-right : 20px;
}

#reportDetail{
    margin:auto;
    margin-top:50px;
    width:80%;
    height:800px;
    text-align: center;
    border-collapse: separate;
    border-spacing: 0 20px;
}

#reportDetail textarea{
    border: 1px solid gray;
    box-sizing: border-box; 
    width:100%;
    margin: auto;
    padding:3%;
    -webkit-transform:scale(0.9);  
    height:450px;
}

#reportDetail thead th{
    width:15%;
}

#reportDetail thead td{
    width: 35%;
}

#reportDetail textarea::-webkit-scrollbar{
    display: none;
}

#reportDetail pre{
 	white-space: pre-wrap;
    word-break: break-all;
    overflow: auto;
}

.rep{
    margin-left: 65px;
    padding-top: 20px;
    font-size: 15px;
    } 

.rep .rep_count{
    width: 100px;
    text-align: left;
} 

.rep .rep_date{
    width: 130px;
    text-align:center;
    font-weight:bold;
}

.rep .rep_writer{
	width: 100px;
	text-align:center;
	font-weight:bold;
}

.rep .rep_content{
    width: 450px;
    text-align: left;
} 

.rep pre{
    margin:auto;
    white-space: pre-wrap;
    word-break: break-all;
    overflow: auto;
    
}
</style>
</head>
<body>
    <div class="wrap">
       <div class="body left">
        <!-- adminHeader.jsp 파일 include 하는 공간-->
            <jsp:include page="../admin/adminHeader.jsp"/>
        </div>
        <div class="body right">
            <br>
            <!-- 메뉴 별 제목 작성하는 곳! -->
            <span id="title">신고내역 상세 조회</span>
            <a href="/catchmind/"><span id="toMain">CATCHMIND</span></a>
            <br>
                <div class="body-content">
                    <table align="center" id="reportDetail">
                        <thead>
                            <tr>
                                <th>글제목</th>
                                <td colspan="3">${p.postTitle }</td>
                            </tr>
                            <tr>
                                <th>작성일자</th>
                                <td>${p.postDate }</td>
                                <th>작성자번호</th>
                                <td>${p.postWriter }</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>내용</th>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <c:if test="${ !empty a }">
                                        <img src="${ a.attChange }" style="width:90%; height:300px;"><br><br>
                                    </c:if>
                                    <pre>${p.postContent}</pre>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="rep">
                        <c:choose>
                            <c:when test="${not empty rlist}">
                            	<c:forEach var="r" items="${rlist }">
	                                 <tr>
	                                   <td class="rep_content"><pre>${r.replyContent }</pre></td> 
	                                   <td class="rep_writer"><p>${r.replyNickName }</p></td>
	                                   <td class="rep_date"><p>${r.replyDate }</p></td>
	                                   <td><button class="btn-sm btn-secondary">삭제</button></td>
	                                   <td class="reNo"><input type="hidden" value="${r.replyNo }"></td>
	                                </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr class="wrap_rep">
                                     <th class="rep_count">답변(0)</th>
                                     <td class="rep_content">작성된 댓글이 없습니다.</td>
                                 </tr>
                            </c:otherwise>
                         </c:choose>
                     </table> 
                    <div align="center">
                    <br>
                        <a class="btn btn-danger btn-sm" onclick="postFormSubmit(1);">게시글 삭제하기</a>
                    </div>
                    <form action="" method="post" id="reportForm">
                        <input type="hidden" name="postNo" value="${p.postNo}">
                        <input type="hidden" name="filePath" value="${ a.attChange }">
                    </form>
                    <br><br>
                </div>
            </div>
        </div>
    
    <script>
       function postFormSubmit(num){
          
            if(num == 1){  //삭제
                $("#reportForm").attr("action", "deletePo.ad").submit();
            }
       }
       
   
      $(function(){
    	 
    	      $(".btn-secondary").click(function(){
    		  var postNo = $(this).parent().siblings(".reNo").children().val();
    		  console.log(replyNo);
    		  location.href="deleteReply.ad?postNo="+postNo;
    	  })
      });
    </script>
  </div>
</body>

</html>