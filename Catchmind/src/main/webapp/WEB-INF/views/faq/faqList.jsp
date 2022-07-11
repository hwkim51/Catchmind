<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CatchMind</title>
<style>
body{
    background:#eee;    
}
.outer{
    width:1200px;
    height: 800px;
    margin-left: 13%;
}
.chat-list {
    padding: 0;
    font-size: .8rem;
}

.chat-list li {
    margin-bottom: 10px;
    overflow:auto;
    color: #ffffff;
}





.chat-list .chat-img {
    float: left;
    width: 48px;
}

.chat-list .chat-img img {
    -webkit-border-radius: 50px;
    -moz-border-radius: 50px;
    border-radius: 50px;
    width: 100%;
}

.chat-list .chat-message {
    -webkit-border-radius: 50px;
    -moz-border-radius: 50px;
    border-radius: 50px;
    background: #5a99ee;
    display: inline-block;
    padding: 10px 20px;
    position: relative;
}

.chat-list .chat-message:before {
    content: "";
    position: absolute;
    top: 15px;
    width: 0;
    height: 0;
}

.chat-list .chat-message h5 {
    margin: 0 0 5px 0;
    font-weight: 600;
    line-height: 100%;
    font-size: .9rem;
}

.chat-list .chat-message p {
    line-height: 18px;
    margin: 0;
    padding: 0;
}

.chat-list .chat-body {
    margin-left: 20px;
    float: left;
    width: 70%;
}

.chat-list .in .chat-message:before {
    left: -12px;
    border-bottom: 20px solid transparent;
    border-right: 20px solid #5a99ee;
}

.chat-list .out .chat-img {
    float: right;
}

.chat-list .out .chat-body {
    float: right;
    margin-right: 20px;
    text-align: right;
}

.chat-list .out .chat-message {
    background: orange;
}

.chat-list .out .chat-message:before {
    right: -12px;
    border-bottom: 20px solid transparent;
    border-left: 20px solid orange;
}

.card .card-header:first-child {
    -webkit-border-radius: 0.3rem 0.3rem 0 0;
    -moz-border-radius: 0.3rem 0.3rem 0 0;
    border-radius: 0.3rem 0.3rem 0 0;
}

.card{
    /*border:1px solid purple;*/
    height: 600px;
}

.card .card-header {
    background: #17202b;
    border: 0;
    font-size: 1rem;
    padding: .65rem 1rem;
    position: relative;
    font-weight: 600;
    color: #ffffff;
}

.content{
    margin-top:40px;    
}


.card-body-photo{
    display: inline-block;
    width: 180px;
    height: 180px; 
    text-align: center;
    border-radius: 70%;
    overflow: hidden;
    border: 1px solid #17202b;
}

.card-body-content{
    margin-top:80px;
    text-align: center;
    /*border: 1px solid red;*/
}

.card-body-content ul{
    display: inline-block;
}

.box{
    text-align: center;
    margin-top: 50px;
}

.profile{
    margin-top: 10px;
    width: 100%;
    height: 100%;
    object-fit: cover;
}

#chatButton{
    background-color: #5a99ee;
    color: #eee;
    padding: 8px;
    font-size:large;
}

#chatQuestion{
    padding: 10px;
    cursor: pointer;
}

#chatQuestion li{
    list-style:none;
    line-height: 2; 
}

.scroll{
    height:590px;
    display:flex;
    flex-direction: column-reverse;
    overflow-y:auto;

}

#btn1{
    background-color: orange;
    color: white;
    width:90px;
    height:30px;
    border-radius: 50px;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    font-size:small;
}
</style>
</head>
<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>
	<div class="outer">
        <h1>FAQ</h1><hr>

    <div class="container content">
        <div class="row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">

                <div class="card">
                    <div class="card-header">CatchMind</div>
                    <div class="card-body height3 box">
                        <div class="card-body-photo">
                            <img class="profile" src="resources/images/catchmind.png" >
                        </div>
                        
                        <div class="card-body-content" align="center">
                            <div><h2>캐치마인드</h2></div>                       
                            <div><h4>catchmindofficial@gmail.com</h4></div>
                            <hr><br>
                            <div>
                                <span><b>관리자에게 1:1 문의하기</b></span>
                                <span><button id="btn1" onclick="inquiryClick();">문의하기</button></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                <div class="card">
                    <div class="card-header">Chat</div>
                    <div class="card-body height3 scroll">
                        <ul class="chat-list" id="chatlist-id" >
                            
                            
                        </ul>
                        <br><br>
                    </div>
                    <div id="chatButton">
                        <ul id="chatQuestion">
                            <li class="question q1" value="1">캐치마인드는 어떤 사이트인가요?</li>
                            <li class="question q2" value="2">차단 당하면 대화를 할 수 없나요?</li>
                            <li class="question q3" value="3">MBTI가 뭔가요?</li>
                            <li class="question q4" value="4">프로필 사진을 변경할 수 있나요?</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
     </div>
  </div>
    
    <script>

        // 질문 클릭 시 ajax로 데이터 조회하기
        $("#chatButton>#chatQuestion>.question").click(function(){

        	var resultStr = "";
           
        	$.ajax({
                url : "question.faq",
                data : {faqNo : $(this).val()},
                success: function(data){
                	
                	//console.log(data);
                	
                	resultStr += $(".chat-list").html();
                    
                	resultStr  +="<li class='out'>"
                				+ 	"<div class='chat-img'>"
                				+		"<img alt='Avtar' src='resources/images/user.png'>"
                				+ 	"</div>"
                				+ 	"<div class='chat-body'>"
	                			+ 		"<div class='chat-message'>"
	                			+			"<h5>User</h5>"
	                			+			"<p>" + data[0].faqTitle + "</p>"
	                			+		"</div>"
                				+	"</div>"
                				+"</li>"  
                	        	+" <li class='in'>"
                				+ 	"<div class='chat-img'>"
                				+		"<img alt='Avtar' src='resources/images/catchmind.png'>"
                				+ 	"</div>"
                				+ 	"<div class='chat-body'>"
	                			+ 		"<div class='chat-message'>"
	                			+			"<h5>CatchMind</h5>"
	                			+			"<p>" + data[0].faqContent + "</p>"
	                			+		"</div>"
                				+	"</div>"
                				+"</li>"
                
                	$(".chat-list").html(resultStr);
                  

                },
                error : function(){

                    console.log("ajax 통신으로 faq 조회 실패");
                }
            });
        });
        
        
		function inquiryClick(){
		        	
			location.href="enrollForm.in";
        }
        
        // 채팅 스크롤 하단으로 보내기 
        $("#chatlist-id").scrollTop($("#chatlist-id")[0].scrollHeight);
         
          
    </script>
    
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>