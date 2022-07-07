<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* container */
    .container{
        width: 300vw;
        transition: transform 0.5s;
    }
    .inner{
        width: 100vw;
        float: left;
    }
    .inner img{
        width:100%;
    }
</style>
</head>
<body>
    <div style="overflow:hidden">
        <div class="container">
            <div class="inner">
                <img src="pic1.jpg">
            </div>
            <div class="inner">
                <img src="pic2.jpg">
            </div>
        
            <div class="inner">
                <img src="pic3.jpg">
            </div>
        </div>
    </div>

    <button class="버튼1">1</button>
    <button class="버튼2">2</button>
    <button class="버튼3">3</button>

    <script>
        document.querySelector('버튼2').addEventListener('click', function(){
            document.querySelector('.container').style.transform = 'translate(-100vw)';
        });
        document.querySelector('버튼3').addEventListener('click', function(){
            document.querySelector('.container').style.transform = 'translate(-200vw)';
        });
    </script>
</body>
</html>