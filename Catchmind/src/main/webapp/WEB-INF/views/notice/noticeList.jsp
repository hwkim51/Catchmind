<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catchmind</title>
<style>

body{
    margin:auto;
    padding: 0%;
}

.content{
    width:1200px;
    height: 800px;
    margin-left: 13%;
}

.innerContent{
   /* border: 1px solid red; */
   /*cursor: pointer;*/
}

#mainNotice{
    height: 350px;
    width: 100%;
    position: relative;
    overflow: hidden;
    cursor: pointer;
}
#noticeList>thead>tr, #noticeList>tbody>tr {
    text-align:center;
}

#noticeList>tbody>tr{
    text-align:center;
    cursor: pointer;
}

#mainNotice, #noticeList{
    width:100%;
}

#pagingArea{
    width:fit-content; 
    margin:auto;
}

</style>
</head>
<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>


    <div class="content">
    <br>
    <h1>공지사항</h1>
    <hr><br>

    <div class="innerContent" align="center">
    <!--  <h2 align="center">❣ CATCH MIND ❣</h2> -->
		
	        <!-- Q. 상단의 이미지 클릭 시 보이는 공지사항만 사진게시판 형태 + 다른 공지사항은 일반 게시판 형태 ? -->
	        <div id="mainNotice" align="center">
	        	<!-- 이미지 경로 동적으로 구성 예정 -->
	            <img src="resources/images/dosomethinggreat.jpeg" id="noticeImg" style="width:100%; height:100%; object-fit:cover;">
	        </div>
	        <br><br>

        <table id="noticeList" align="center" class="table table-hover">
            <thead>
                <tr>
                    <th style="width:10%;">
                        글번호
                    </th>
                    <th style="width:45%;">
                        글제목
                    </th>
                    <th style="width:15%;">
                        작성자
                    </th>
                    <th style="width:10%;">
                        조회수
                    </th>
                    <th style="width:20%;">
                        작성일
                    </th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="no" items="${list }">
            	<!-- 동적으로 구성할 예정 -->
                    <tr>
                        <td class="nno">1</td>
                        <td>공지사항</td>
                        <td>admin</td>
                        <td>44</td>
                        <td>2022-06-28</td>
                    </tr>
                </c:forEach>
                
                
                    <tr>
                        <td class="nno">2</td>
                        <td>공지사항2</td>
                        <td>admin</td>
                        <td>44</td>
                        <td>2022-06-28</td>
                    </tr>
                    <tr>
                        <td class="nno">3</td>
                        <td>공지사항3</td>
                        <td>admin</td>
                        <td>44</td>
                        <td>2022-06-28</td>
                    </tr>
            </tbody>
        </table>
        <br><br>

        <script>
            $(function(){
                
                //동적으로 만들어진 요소는 on 메소드 써서 이벤트를 걸어야 함(주의)
                $("#noticeList>tbody>tr").click(function(){
                    
                    //console.log($(this).children(".nno").text());
                    location.href="detail.no?nno="+$(this).children(".nno").text();
                });
                
            });

            // 이미지 배너가 노출되는 공지사항 클릭 시 실행 함수
            $(function(){

                $("#noticeImg").click(function(){

                    //console.log($("#noticeList>tbody>tr").eq(0).children(".nno").text());
                    location.href="detail.no?nno="+$("#noticeList>tbody>tr").eq(0).children(".nno").text();
                });

            });
        </script>

        <!-- 페이징 바 영역 -->
        <div id="pagingArea">
           
        </div>
      </div>
    </div>
    <br><br>

    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>

</body>

</html>