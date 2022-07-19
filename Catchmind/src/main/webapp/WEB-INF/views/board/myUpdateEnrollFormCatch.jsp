<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
      .body{
          margin: auto;
          width: 1200px;
      } /* 전체틀 가운데 정렬 및 넓이 설정 */

      /* ################### sub_head 설정 영역 ################### */
      .sessionTitle{
        	margin-left:38px !important;
        	margin-bottom:50px;
        }

      /* ################### sub_body 설정 영역 ################### */
      .sub_body{
        margin-left: 100px;
      }
      .sub_body .form-title,.form-content,.form-file{
        margin: auto;
        padding: auto;
        resize: none;
        outline: none;
      }
      .sub_body label{
        width: 58px;
      }
      
      .sub_body #title{
      	width: 600px;
    	}

      .sub_body #content{
          width: 600px;
          height: 300px;
      }
      /* ################### sub_foot 설정 영역 ################### */
      .sub_foot{
        margin: auto;
        padding: auto;
      }
      .sub_foot .btn-primary{
        text-align: center;
        font-size: 20px;
        background-color: rgb(17, 199, 231);
        color: white;
        border: none;
        border-radius: 5px;
        width: 100px;
        height: 33px;
        margin-left: 350px;
        margin-bottom : 34px;
      }
      #erollFormPost{
        width: 70%;
        margin: auto;
        font-family: 'IBM Plex Sans KR', sans-serif;
        padding-left: 20px;
      }
      #erollFormPost td{
        padding-left: 20px;
      }
      #erollFormPost th, #erollFormPost td{
        padding-bottom: 20px;
      }
	</style>
</head>
<body style="overflow-x: hidden">

    <jsp:include page="../common/header.jsp" />
        
    <div class="body">
        <div class="inner_body">
            <nav class="sessionTitle">
                <nav class="sessionTitle">
                    <h3 style="margin-bottom: 8px;"><b style="font-family: 'IBM Plex Sans KR', sans-serif; font-size: 28px;">연애의 발견</b></h3>
                    <hr>
                  </nav>
            <div class="sub_body">
                <form id="erollFormPost" method="post" action="myUpdate.ca" enctype="multipart/form-data">
                    <table algin="center">
                    <input type="hidden" name="catchWriter" value="${ loginUser.userNo }">
                    <input type="hidden" name="catchNo" value="${ c.catchNo }">
                    <c:if test="${ !empty alist }">
                    	<c:forEach var="a" items="${ alist }">
                    <input type="hidden" name="attCatch" value="${ a.attCatch }">
                    <input type="hidden" name="attNo" value="${ a.attNo }">
                    	</c:forEach>
                    </c:if>
                        <tr>
                            <th><label class="form-title" for="title">제목</label></th>
                            <td><input class="form-title" type="text" id="title" name="catchTitle" value="${ c.catchTitle }" required></td>
                        </tr>
                        <tr>
                            <th><label class="form-content" for="content">내용</label></th>
                            <td><textarea class="form-content" id="content" name="catchContent" required>${ c.catchContent }</textarea></td>
                        </tr>
                        <tr>
                            <th><label class="form-file" for="upfile">첨부파일</label></th>
                            <td><input class="form-file" type="file" id="upfile" name="reupfile" multiple></td>
                            <c:if test="${ not empty alist }">
                            	<c:forEach var="a" items="${ alist }">
		                            <input class="form-file" type="hidden" name="attOrigin" value="${ a.attOrigin }"> <!-- 기존파일 검사활용 -->
		                            <input class="form-file" type="hidden" name="attChange" value="${ a.attChange }"> <!-- 기존파일 삭제활용 -->
	                            </c:forEach>
		                    </c:if>
                        </tr>
                        <tr>
	                        <th class="form-file">기존파일</th>
	                        
                            <c:if test="${ not empty alist }">
			                    	<td>
			                    	<c:forEach var="a" items="${ alist }">
			                    	<a class="form-file" href="${ a.attChange }">${ a.attOrigin }</a>
				                    </c:forEach>
				                   <br> 기존의 파일은 무조건 삭제되니 주의해주시기 바랍니다.
				                    </td>
		                    </c:if>
                        </tr>
                    </table>
                    
		            <div class="sub_foot">
		                <button type="submit" class="btn-primary">작성</button>
		            </div>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>