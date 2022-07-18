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
        	margin-left:0px !important;
        	margin-bottom:50px
        }

      /* ################### sub_body 설정 영역 ################### */
    
      .sub_body .form-title,.form-content,.form-file{
        margin: auto;
        padding: auto;
        resize: none;
        outline: none;
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
        border-radius: 3px;
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
                <h3><b>에브리타임⏰</b></h3>
                <hr>
            </nav>

            <div class="sub_head"></div>

            <div class="sub_body">
                <form id="erollFormPost" method="post" action="insert.po" enctype="multipart/form-data">
                    <table algin="center">
                    <input type="hidden" name="postWriter" value="${ loginUser.userNo }">
                        <tr>
                            <th><label class="form-title" for="title">제목 </label></th>
                            <td><input class="form-title" type="text" id="title" name="postTitle" required 
                                        placeholder="제목을 입력해주세요."></td>
                        </tr>
                        <tr>
                            <th><label class="form-content" for="content">내용 </label></th>
                            <td><textarea class="form-content" id="content" name="postContent" required
                                        placeholder="캐치마인드 유저들을 위한 커뮤니티 게시판 입니다.
자유롭게 게시글을 작성해주세요.
(다만, 쾌적한 이용환경을 위하여 게시판 목적에 어긋나는
욕설, 과도한 홍보, 비방글 등의 경우 통보없이 삭제 될 수 있습니다.) "></textarea></td>
                        </tr>
                        <tr>
                            <th><label class="form-file" for="upfile">첨부파일 </label></th>
                            <td><input class="form-file" type="file" id="upfile" name="upfile"></td>
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