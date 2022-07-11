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
        margin-top:50px;
    }

    #blockTable{
        width:85%;
        margin: auto;
        text-align: center;
        border-collapse: separate;
        border-spacing: 0 25px;
    }

    #blockTable tr{
        height:50px;
    }

    #blockTable td{
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
        width: 95%;
        height: 95%;
        border-radius: 70%;
        object-fit: cover;
        filter:brightness(50%);
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
        <div class="myPage-menu"><a href="">회원정보수정</a></div>
        <div class="myPage-menu"><a href="myFollow.me">팔로우리스트</a></div>
        <div class="myPage-menu"><a href="myBlock.me">차단리스트</a></div>
        <div class="myPage-menu"><a href="">커플관리</a></div>
        <div class="myPage-menu"><a href="">내글관리</a></div>
        <hr>
    </div>
    
    <%-- myPage BlockList 영역 --%>
    <div class="content">
        <div class="innerContent">
            <table align="center" id="blockTable">
                <tbody>
                   
                </tbody>
            </table>
        </div>
    </div>
    
    <script>
    $(function(){
    	selectBlockList();
    	
    	setInterval(selectBlockList, 2000);
    	
    	
    	$("#blockTable>tbody>tr").on("click", "#button", function(){
        	
    		var blockedUser = $("#blockedUser").text();
    		location.href="deleteBlock.me?blockNo="+blockedUser;	
    	});
    });
    
    function selectBlockList(){
    	
    	$.ajax({
    		url: "bList.me",
    		data : {userNo : ${loginUser.userNo}},
    		success : function(result){
    			
    			var resultStr = "";
    			
    			for(var i in result){
    				
    				resultStr += "<tr>"
    						   + 	"<th class='box' style='background: white;'>"
    						   + 		"<img class='profile' src='"+ result[i].pic +"'>"
                    		   + 	"</th>"
                    		   +    "<td>"+ result[i].mbti +"</td>"
                    		   +    "<td>"+ result[i].nickname +"</td>"
                    		   +    "<td>"+ result[i].profile +"</td>"
                    		   +    "<td><button type='button' id='button' class='btn btn-secondary'>차단해제</button></td>"
                    		   +    "<td><input type='hidden' value='"+ result[i].userNo +"' id='blockedUser'></td>"
                			   + "</tr>"
    			}
    			
    			$("#blockTable>tbody").html(resultStr);
    		},
    		error : function(){
    			console.log("ajax 통신으로 팔로우 리스트 조회 실패");
    		}
       });
    }
    
    </script>
    
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>