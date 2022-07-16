<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catchmind</title>
<style>
div{
	box-sizing : border-box;
    margin : 0px;
    padding : 0px;  
}

.wrap{
    width:1200px;
    height:1000px;
    margin-left:80px;
}

.body{
    width:100%;
}
.left{
    width:12.5%;
    height:100%;
    float:left;
}

.right {
    width : 87.5%;
    height : 100%;
    float:left;
}

#title {
    font-size : 30px;
    font-weight : bolder;
    padding-left : 20px;
}

#toMain {
    font-size : 35px;
    font-weight : bolder;
    color : orange;
    float : right;
    padding-right : 20px;
}

.btn_area{
    margin-top: 20px;
    margin-left : 50px;
    width: 90%;
    text-align:right;
}

.btn_write{
    padding: 0px 5px 0px 5px;
    text-decoration:none !important;
    background-color: black;
    border: none;
    border-radius: 4px;
    color: white;
    font-size: 18px;
    margin-left: 15px;
}

.btn_write:hover{
    text-decoration:none !important;
    color:white;
}

#noticeTable {
    margin-left : 20px;
    margin-top:20px;
    width:95%;
    text-align:center;
 	border-color: lightgray;
    font-size:14px;
}

#noticeTable>thead {
    background-color : lightgrey;
}

#noticeTable>thead>tr>th {
    padding-left : 15px;
    height:40px;
}

#id {
    width : 50px;
}

#ntitle {
    width : 280px;
}

#ndate {
    width : 70px;
}

#status{
    width:50px;
}

#detailmenu {
    width : 50px;
}

.admin-menu a{ 
    text-decoration: none;
    color: black;
}

#btn1{
    background-color: orange;
    color: white;
    width:5px;
    height:20px;
    border-radius: .25em;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    font-size:medium;          
}
.body-content{
    padding: 50px 70px;
}
.statisticsBar{
    width: 300px;
    height: 550px;
    background-color: #f2f2f2;
    border-radius: 30px;
    text-align: center;
    padding: 50px 30px;
}
#statisticsTitle{
    display: inline-block;
    font-size: 18px;
    font-weight: 600;
    text-align: center;
    margin-bottom: 0;
}
.statisticsMenu{
    width: 200px;
    margin-bottom: 20px;
    padding: 10px 20px;
    border: 2px solid #dfdfdf;
    border-radius: 5px;
    text-align: left;
}

    
#pagingArea {width:fit-content; margin:auto; margin-top:50px;}    
</style>
</head>
<body>
    <div class="wrap">
       <div class="body left">
        <!-- adminHeader.jsp 파일 include 하는 공간-->
            <jsp:include page="../admin/adminHeader.jsp"/>
        </div>
       
          <div class="body right">
            <br>
                <!-- 메뉴 별 제목 작성하는 곳! -->
                <span id="title">통계 관리</span>
                <a href="/catchmind/"><span id="toMain">CATCHMIND</span></a><hr>
            
            <div class="body-content">
            
            <article class="statisticsBar">
                <div id="statisticsTitle" class="statisticsMenu">💻 통계 관리 MENU</div>
                <hr>
                <input type="button" id="stsUser" class="statisticsMenu" value="🅾 가입유저 통계"></input><br>
                <input type="button" id="stsGender" class="statisticsMenu" value="🚻 성별 통계"></input><br>
                <input type="button" id="stsAge" class="statisticsMenu" value="🟨 연령 통계"></input><br>
                <input type="button" id="stsBoard" class="statisticsMenu" value="💹 게시글 통계"></input><br>
                <input type="button" id="stsQa" class="statisticsMenu" value="♏ 문의사항 통계"></input><br>
            </article>
            <article>
                <div class="tatisticsGraph" style="background-Color:red;">
                    
                </div>
            </article>
           
        </div>
    </div>
    
    <script>
        
    </script>
  </div>
</body>

</html>