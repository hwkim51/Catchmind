<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CATCHMIND | 캐치마인드</title>
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
        margin-left: 20px;
        text-align: center;
        border-collapse: separate;
        border-spacing: 0 30px;
    }

    #followTable tr{
        height:50px;
    }

    #followTable td{
        background-color: rgb(229, 229, 229);
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
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-size: 22px;
    }
    .myPage-menu {
        display : table-cell;
        height : 50px;
        width : 200px;
        font-weight: 600;
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
        <div class="myPage-menu"><a href="#" onclick="javascript:document.myCoupleForm.submit();">커플관리</a></div>
        <div class="myPage-menu"><a href="myBoard.po">내글관리</a></div>
        <hr>
    </div>
    
    <form name="myCoupleForm" action="myCouple.me" method="post">
       <input type="hidden" name="userNo" value="${ loginUser.userNo }">
    </form>

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
                console.log(result);
    			
    			if(result==""){
    				var resultStr = "";

                    resultStr += "<div style='text-align : center;'>"
                               + 	"<b>현재 팔로우 중인 회원이 없습니다. </b><br>"
                               + 	"<b>팔로우 상대를 찾고 싶다면?💡 </b><br><br>"
                               +	"<a href='matchList.ch' style='font-size:15px; color:dimgrey; font-weight: 500;'>팔로우 상대 둘러보기 · · · · · ▷ click</a>"
                               + "</div>"
                               
                    console.log("팔로우리스트존재안함");          
                    $("#followTable>tbody").html(resultStr);

    			} else {
    				console.log("followList 존재함");
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
	    							   resultStr += "<img class='profile' src='resources/images/user.png' style='filter:brightness(0.4);'>"
	    						   }
	    						   else{ //사진 없고 접속 중
	    							   resultStr += "<img class='profile' src='resources/images/user.png'>"
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
	                    		   +    "<td id='chatButton'>";
	                    		   if(result[i].status == 4){
	                    		   		// 현재 접속하지 않은 경우
	                    		   		resultStr += "<button type='button' disabled class='btn btn-secondary'>대화하기</button>";
	                    		   } else if(result[i].status == 5){
	                    			    // 현재 접속한 경우
	                    			    resultStr += "<button type='button' class='btn btn-success'>대화하기</button>";
	                    		   }
	                    		   
	                    resultStr += "</td>"
	                    		   + "<td id='ufButton'><a class='btn btn-secondary'>팔로우 취소</a></td>"
	                			   + "<td class='ufno' style='visibility: hidden; display:none;'>"+result[i].userNo+"</td>"
	                    		   + "</tr>"
	    			
	    			
	    				$("#followTable>tbody").html(resultStr);
	    			}
                 }
    			
    		},
    		error : function(){
    			console.log("ajax 통신으로 팔로우 리스트 조회 실패");
    		}
        });
    }
    
    // 팔로우 취소
    $(document).on("click", "#ufButton", function(event){
    	console.log($(this).next().text()); //해당 회원 번호
    	location.href="unfollow.me?foedUser="+$(this).next().text();
    });
   
    // 대화하기
     $(document).on("click", "#chatButton", function(event){
    	//console.log($(this).next().next().text());
    	chatPage = 1;
    	console.log("클릭");
    	alert("상대에게 채팅 신청 메시지를 보냈습니다.\n 잠시 기다려 주세요.");
    	$.ajax({
    		url : "sendRequest.ch",
    		data : {
    			userNo : ${loginUser.userNo},
    			requestTo : $(this).next().next().text()
    		},
    		success : function(data) {
    			if(data > 0) {
    				alert("상대가 채팅 신청을 수락하였습니다.");
    				location.href = "/catchmind/chat.do?roomNo=" + data;
    			}
    			else {
    				
    				if (data == -1) {
    					alert("상대가 이미 다른 상대와 채팅 중입니다.");
    				}
    				else if (data == -2) {
    					alert("상대가 다른 상대의 채팅 신청을 고민하고 있습니다.");
    				}
    				else if (data == -3) {
    					alert("상대가 채팅할 수 있는 상태가 아닙니다.");
    				}
    				else if (data == -4) {
    					alert("상대가 채팅할 수 있는 상태가 아닙니다.");
    				}
    				else if (data == 0) {
    					alert("상대가 채팅 신청을 거부했습니다.");
    				}
    				
    				chatPage = 0;
    				interval = setInterval(loginSignal, 2000);
    			}
    		},
    		error : function() {
    			console.log("Ajax : sendRequest failed");
    		}
    	});
    });
   
    </script>
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>
 
</body>
</html>