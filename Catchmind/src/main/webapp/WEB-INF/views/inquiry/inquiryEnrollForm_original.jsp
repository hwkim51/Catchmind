<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Catchmind</title>
        <!-- 부트스트랩에서 제공하고 있는 스타일 -->
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
        <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
        <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
        <style>
        
        body{
            margin: auto;
            box-sizing: border-box;
        }
        
        .content{
            width:90%;
            height: 800px;
            margin: auto;
           /* border: 1px solid blue;*/
        }
        
        .innerContent{
            /*border: 1px solid red; */
            margin-top:50px;
        }

        #inquiryTable{
            margin:auto;
            /*border: 1px solid green;*/
            border-collapse: separate;
	        border-spacing: 25px;
        }

        .filebox label {
           
            padding: .5em .70em;
            color: white;
            font-size: inherit;
            line-height: normal;
            vertical-align: middle;
            background-color: skyblue;
            cursor: pointer;
            border: 1px solid #ebebeb;
            border-bottom-color: #e2e2e2;
            border-radius: .25em;
            }

        .filebox input[type="file"] {  /* 파일 필드 숨기기 */
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip:rect(0,0,0,0);
            border: 0;
        }

        #btn1{
            background-color: orange;
            color: white;
            width:100px;
            height:40px;
            border-radius: .25em;
            cursor: pointer;
            border: 1px solid #ebebeb;
            border-bottom-color: #e2e2e2;
            font-size:medium;          
        }

        #btn1:hover{
            cursor:pointer;
            opacity: 0.7;
        }

        #notLogin{
            font-size:13px;
            color:rgb(21, 21, 246);
        }
        </style>
        </head>
        <body>
            <%-- header 영역 --%>
            <jsp:include page="../common/header.jsp"/>

            <div class="content">
            <br>
            <h2>1 : 1문의 </h2>
            <hr>
        	
            <div class="innerContent"> 
              <form action="insert.in" method="post">  
                <input type="hidden" name="qaWriter" value="${loginUser.userNo}">
                <table id="inquiryTable" class=".table-bordered" text-align="center"> 
                    <tr>
                        <td></td>
                        <td><b>* 캐치마인드 관리자에게 문의사항이 있을 경우 아래 작성해주시면 친절하게 답변드리겠습니다.</b></td>
                    </tr>  
                    <tr>
                        <td></td>
                        <td><b>* 문의 내역 및 답변은 마이 페이지 > 내 글 관리에서 확인 가능합니다 :)</b></td>
                    </tr>  
                    <tr></tr> 
                    <tr>
                        <th> 제목 </th>      
                        <td>
                            <input type="text" name="qaTitle" class="form-control" required placeholder="제목을 입력해 주세요." size="90">
                        </td>               
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="qaContent" class="form-control" style="resize:none;" cols="92" rows="10" required placeholder="문의 내용을 작성해 주세요."></textarea>
                        </td>
                    </tr>
                    <!--
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <div class="filebox">
                                    <label for="ex_file">업로드</label>
                                    <input type="file" id="ex_file" name="file">
                                </div>
                            </td>
                        </tr>
                    -->
                    <tr>
                        <td colspan="2" align="center">
                            <c:choose>
                                <c:when test="${not empty loginUser}">
                                    <button type="submit" id="btn1">문의하기</button>  
                                </c:when>
                                <c:otherwise>
                                    <button type="submit" disabled class="btn btn-secondary">문의하기</button><br>
                                    <div id="notLogin">💡 로그인 후 이용 가능한 서비스입니다. </div>
                                </c:otherwise>
                            </c:choose>                        
                        </td>
                     </tr>   
                   </table>
                </form>
              <br><br>
       	    </div>
          </div>

          <%-- footer 영역 --%>
          <jsp:include page="../common/footer.jsp"/>
          
   </body>
</html>