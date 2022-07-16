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
        width:1000px;
        height: 800px;
        margin-left: 13%;
    }

    .innerContent{
        /*border: 1px solid red; */
        margin-top:50px;
    }

    #followTable{
        width:85%;
        margin: auto;
        text-align: center;
        /*border: 1px solid green;*/
        border-collapse: separate;
        border-spacing: 0 25px;
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

    .myPage-nav {
        width: 1000px;
        margin-left: 150px;
    }
    .myPage-menu {
        display : table-cell;
        height : 50px;
        width : 150px;
        text-align: center;
    }
    .myPage-menu a {
        text-decoration: none !important;
        color : black !important;
        font-size : 20px;
        display : block;
        width : 100%;
        height : 100%;
        line-height : 50px;
    }
    </style>
</head>
<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>

    <%-- myPage header 영역 --%>
    <div class="myPage-nav">
        <div class="myPage-menu"><a href="myPage.me">회원정보수정</a></div>
        <div class="myPage-menu"><a href="myFollow.me">팔로우리스트</a></div>
        <div class="myPage-menu"><a href="myBlock.me">차단리스트</a></div>
        <div class="myPage-menu"><a href="myCouple.me">커플관리</a></div>
        <div class="myPage-menu"><a href="">내글관리</a></div>
        <hr>
    </div>

    <%-- myPage followList 영역 --%>
    <div class="content">
        <div class="innerContent">
            <table align="center" id="followTable">
            <!-- ajax : 동적으로 구성 예정 -->
            	<tbody>
            		
            	</tbody>
            </table>
        </div>
    </div>
    <script>
    $(function(){
    	selectFollowList();
    	
    	setInterval(selectFollowList, 2000);
    });
    
    function selectFollowList(){
    	
    	$.ajax({
    		url: "fList.me",
    		data : {userNo : ${loginUser.userNo}},
    		success : function(result){
    			
    			var resultStr = "";
    			
    			for(var i in result){
    				
    				resultStr += "<tr>"
    						   + 	"<th class='box' style='background: white;'>";
    						   if(result[i].pic != null && result[i].recentLogout != null){//사진 있고 접속 중 x
    							   resultStr += "<img class='profile' style='filter:brightness(0.4);' src='"+ result[i].pic +"'>"
    						   }
    						   else if(result[i].pic != null && result[i].recentLogout == null){ //사진 있고 접속 중
    							   resultStr += "<img class='profile' src='"+ result[i].pic +"'>"
    						   }
    						   else if(result[i].pic == null && result[i].recentLogout != null){ //사진 없고 접속 중 x
    							   resultStr += "<img class='profile' src='resources/images/user.png' style='filter:brightness(0.4); border: 1px solid #e0e1e2;'>"
    						   }
    						   else{ //사진 없고 접속 중
    							   resultStr += "<img class='profile' src='resources/images/user.png' style='border: 1px solid #e0e1e2;'>"
    						   }
    				resultStr +=    "</th>"
                    		   +    "<td>"+ result[i].mbti +"</td>"
                    		   +    "<td>"+ result[i].nickname +"</td>"
                    		   +    "<td>";
			         		   if(result[i].profile != null){
			         			   resultStr += result[i].profile
			         		   }
			         		   else{
			         			   resultStr += "작성된 소개 글이 없어요!"
			         		   }
			        resultStr  +=   "</td>"
                    		   +    "<td>";
                    		   if(result[i].recentLogout != null){
                    		   		// 현재 접속하지 않은 경우
                    		   		resultStr += "<button type='button' id='chatButton' class='btn btn-secondary'>대화하기</button>";
                    		   } else {
                    			    // 현재 접속한 경우
                    			    resultStr += "<button type='button' id='chatButton' class='btn btn-success'>대화하기</button>";
                    		   }
                    		   
                    resultStr += "</td>"
                    		   + "<td><button type='button' id='ufButton' class='btn btn-secondary' onclick='unfollow("+result[i].userNo+");'>팔로우 취소</button></td>"
                    		   + "<td><input type='hidden' value='"+ result[i].userNo +"' id='unfollowUser'></td>"
                			   + "</tr>"
    			}
    			
    			$("#followTable>tbody").html(resultStr);
    			
    		},
    		error : function(){
    			console.log("ajax 통신으로 팔로우 리스트 조회 실패");
    		}
        });
    }
    
    function unfollow(foedUser){
    	location.href="unfollow.me?foedUser=" + foedUser;
    }
   
    
    </script>
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>
 
</body>
</html>