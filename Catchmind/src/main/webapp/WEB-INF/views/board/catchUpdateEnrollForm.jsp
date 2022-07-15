<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		/* ################### 임시 ################### header영역 넓이 */
      .header{
          width: 100%;
          height: 100px;
          background-color: aquamarine;
      } 

      .body{
          margin: auto;
          width: 1720px;
      } /* 전체틀 가운데 정렬 및 넓이 설정 */

      /* ################### sub_head 설정 영역 ################### */
      .sub_head{
          position: relative;
          height: 130px;
      } /* 게시판 타이틀 및 작성 영역 설정 */

      .sub_head>.title{
          position: absolute;
          font-size: 50px;
          width: 450px;
          left:0px; /* 왼쪽 정렬 */
          padding-bottom: 9px;
          border-bottom: 1px solid black;
      } /* 게시판 타이틀 설정 */

      /* ################### sub_body 설정 영역 ################### */
      .sub_body .form-title,.form-content,.form-file{
        margin: auto;
        padding: auto;
        font-size: 25px;
        resize: none;
        outline: none;
      }
      
      .sub_body #title{
      	width: 1600px;
    	}

      .sub_body #content{
          width: 1600px;
          height: 520px;
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
        border-radius: 3px;
        width: 100px;
        height: 33px;
        margin-left: 800px;
        margin-top:10px;
        margin-bottom : 34px;
      }
	</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />
        
    <div class="body">
        <div class="inner_body">
            <div class="sub_head">
                <div class="title">연애의발견</div>
            </div>
            <div class="sub_body">
                <form id="erollFormPost" method="post" action="update.ca" enctype="multipart/form-data">
                    <table algin="center">
                    <input type="hidden" name="catchWriter" value="${ loginUser.userNo }">
                    <input type="hidden" name="catchNo" value="${ c.catchNo }">
                    <input type="hidden" name="attCatch" value="${ a.attCatch }">
                    <input type="hidden" name="attNo" value="${ a.attNo }">
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