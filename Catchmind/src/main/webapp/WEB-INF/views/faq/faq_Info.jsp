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
    margin:0;
    box-sizing: border-box;
}

.faq_Info {
    margin-top: 80px;
    margin-left: 200px;
    margin-right: 150px;
    position: relative;
}

.faq_Info p{
    font-family: 'IBM Plex Sans KR', sans-serif;
    font-weight: bolder;
    font-size: 80px;
}

.faq_Info span{
    margin:180px;
}

#btn1{
    font-family: 'IBM Plex Sans KR', sans-serif;
    margin-top: 20px;
    background-color: orange;
    color: white;
    width:300px;
    height:55px;
    border-radius: 50px;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    font-size:medium;
}
#btn1:hover{
    color: white;
    background: linear-gradient(to right, rgb(236, 3, 194) 10%, orange);
}
#faqImg{
    position: absolute;
    top: 200px;
    right: 200px;
}

</style>
</head>
<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>
    <hr>
    <article class="faq_Info" data-aos="fade-left" data-aos-duration="1000">
      
        <p>    
        지금, 간편하게<br>
        캐치톡톡<br>
        궁금증을 해결하세요<br>
        </p>  

        <span data-aos="fade-left" data-aos-duration="800"
                style="transition-delay: 0.3s;">
            <input type="button" id="btn1" value="캐치톡 START" style="font-size:25px;" onclick="catchTalkClick();"> 
        </span>
        <span >    
            <img src="resources/images/catchTalk.png" id="faqImg">
        </span>
    </article>

    <script>
        
        AOS.init();
        
        function catchTalkClick(){

            location.href="catchTalkChat.faq";

        };
    </script>


    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>