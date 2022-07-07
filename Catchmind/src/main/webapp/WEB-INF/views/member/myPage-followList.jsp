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
        /*border: 1px solid red; */
        margin-top:50px;
    }

    #followTable{
        width:75%;
        margin: auto;
        text-align: center;
        /*border: 1px solid green;*/
        border-collapse: separate;
        border-spacing: 0 20px;
    }

    #followTable tr{
        height:50px;
    }

    #followTable td{
        background-color: lightgray;
        font-size: medium;
        font-weight: 500;
    }

    .box {
        width: 70px;
        height: 70px; 
       
        overflow: hidden;
    }
    
    .profile {
        width: 100%;
        height: 100%;
        border-radius: 70%;
        object-fit: cover;
    }
    </style>
</head>
<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>

    <%-- myPage header 영역 --%>

    <%-- myPage followList 영역 --%>
    <div class="content">
        <div class="innerContent">
            <table align="center" id="followTable">
            <!-- 동적으로 구성 예정 -->
           		<tr>
           			<th class="box" style="background: white;">
                        <img class="profile" src="resources/images/potato.jpg">
                    </th>
                    <td>ENFP</td>
                    <td>캔디현우</td>
                    <td>저랑 진지하게 만나보실 분</td>
                    <td><button type="button" class="btn btn-success" onclick="">대화하기</button></td>
                    <td><button type="button" class="btn btn-secondary" onclick="">팔로우 취소</button></td>                    
	                </tr>
                <tr>
                    <th class="box" style="background: white;">
                        <img class="profile" src="resources/images/chicken.png">
                    </th>
                    <td>ISTP</td>
                    <td>치매정인</td>
                    <td>귀여운 강아지 상만~</td>
                    <td><button type="button" class="btn btn-success">대화하기</button></td>
                    <td><button type="button" class="btn btn-secondary">팔로우 취소</button></td>
                </tr>
                <tr>
                    <th class="box" style="background: white;">
                        <img class="profile" src="resources/images/tiger.jpg">
                    </th>
                    <td>ISTJ</td>
                    <td>영웅유진</td>
                    <td>SEXY BOY만 연락해</td>
                    <td><button type="button" class="btn btn-secondary" onclick="">대화하기</button></td>
                    <td><button type="button" class="btn btn-secondary" onclick="">팔로우 취소</button></td>
                </tr>
                <tr>
                    <th class="box" style="background: white;">
                        <img class="profile" src="resources/images/catchTalk.png">
                    </th>
                    <td>ENFP</td>
                    <td>캔디현우</td>
                    <td>저랑 진지하게 만나보실 분</td>
                    <td><button type="button" class="btn btn-secondary" onclick="">대화하기</button></td>
                    <td><button type="button" class="btn btn-secondary" onclick="">팔로우 취소</button></td>
                </tr>
                <tr>
                    <th class="box" style="background: white;">
                        <img class="profile" src="resources/images/catchTalk.png">
                    </th>
                    <td>ENFP</td>
                    <td>캔디현우</td>
                    <td>저랑 진지하게 만나보실 분</td>
                    <td><button type="button" class="btn btn-secondary" onclick="">대화하기</button></td>
                    <td><button type="button" class="btn btn-secondary" onclick="">팔로우 취소</button></td>
                </tr>
                <tr>
                    <th class="box" style="background: white;">
                        <img class="profile" src="resources/images/catchTalk.png">
                    </th>
                    <td>ENFP</td>
                    <td>캔디현우</td>
                    <td>저랑 진지하게 만나보실 분</td>
                    <td><button type="button" class="btn btn-secondary" onclick="">대화하기</button></td>
                    <td><button type="button" class="btn btn-secondary" onclick="">팔로우 취소</button></td>
                </tr>
            </table>
        </div>
    </div>
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>