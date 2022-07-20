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
    margin-left:80px;
}

.body{
    width:100%;
}
.left{
    width:12.5%;
    height:100%;
    float:left;
    /*border:1px solid yellow;*/
}

.right {
    width : 87.5%;
    height : 100%;
    float:left;
    /*border: 1px solid red;*/
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

.body-content{
   margin:auto;
   width:80%;
   height:80%;
   background-color: rgb(250, 243, 235);
}

#inquiryDetail{
    margin:auto;
    margin-top: 50px;
    width:90%;
    text-align: center;
    border-collapse: separate;
    border-spacing: 0 15px;
}

#inquiryDetail p{
    margin-top: 15px;
    height: 200px;
}

.reply{
    width:100%;
    padding-top: 20px;
    text-align: center;   
}
.reply input{
    width: 600px;
    height: 40px;
    border: none;
    outline: none;
    border-radius: 4px;
    padding: 10px 10px 10px 10px;
    font-size: 17px;
}

.reply-write{
    margin-left: 65px;
    padding-top: 20px;
}

.reply button{
    background-color: black;
    border: none;
    border-radius: 4px;
    height: 40px;
    width: 80px;
    color: white;
    font-size: 15px;
    margin-left: 15px;
    vertical-align: middle;
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
    width: 100px;
    text-align:center;
    font-weight:bold;
}

.rep .rep_content{
    width: 580px;
    text-align: left;
} 

.rep pre{
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
            <span id="title">1:1 문의 상세 조회</span>
            <a href="/catchmind/"><span id="toMain">CATCHMIND</span></a>
         	<div class="body-content">
             <table align="center" id="inquiryDetail">
               <tr>
                   <th>글제목</th>
                   <td>${in.qaTitle }</td>
                   <th>글번호</th>
                   <td>${in.qaNo }</td>
               </tr>
               <tr>
                   <th>작성자</th>
                   <td>${in.qaWriter }</td>
                   <th>작성일자</th>
                   <td>${in.qaDate }</td>
               </tr>
               <tr>
                   <th>내용</th>
               </tr>
               <tr>
                   <td colspan="4">
                      <p>${in.qaContent}</p>
                   </td>
               </tr>
             </table>
             <!-- 답변 영역 -->
             <div class="reply">
                <table class="reply-write" align="center">
                    <form action="updateInquiry.ad" method="post">
                        <input type="hidden" value="${in.qaNo }" name="qaNo">
                        <!--<input type="text" placeholder="답변을 입력해주세요" name="anContent" required>-->
                        <tr>
                            <td>
                                <textarea name="anContent" required placeholder="답변을 입력해주세요." cols="75" rows="4" style="resize:none;"></textarea>
                            </td>
                            <td>
                                <button type="submit">작성</button>
                            </td>
                        </tr>
                    </form>
                </table>
                 <table class="rep">
                     <c:choose>
                         <c:when test="${not empty in.anContent}">
                              <tr>
                                <td class="rep_content"><pre>${in.anContent }</pre></td> 
                                <td class="rep_date"><p>${in.qaAnswerDate }</p></td>
                             </tr>
                         </c:when>
                         <c:otherwise>
                             <tr class="wrap_rep">
                                  <th class="rep_count">답변(0)</th>
                                  <td class="rep_content">작성된 댓글이 없습니다.</td>
                              </tr>
                         </c:otherwise>
                      </c:choose>
                  </table>    
                  <br><br>
              </div>
            </div>
          </div>
    
    <script>



    </script>       
  </div>
</body>

</html>