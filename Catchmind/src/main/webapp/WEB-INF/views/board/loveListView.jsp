<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        .body{
            margin: auto;
            width: 1720px;
        } /* 전체틀 가운데 정렬 및 넓이 설정 */

        /* ################### sub_head 설정 영역 ################### */
        .sub_head{
            position: relative;
            height: 130px;
        } /* 게시판 타이틀 및 작성 영역 설정 */

        .sub_head>.title{
            position: absolute;
            font-size: 50px;
            width: 450px;
            left:0px; /* 왼쪽 정렬 */
            padding-bottom: 9px;
            border-bottom: 1px solid black;
        } /* 게시판 타이틀 설정 */

        .sub_head>.btn_write{
            position: absolute;
            font-size: 15px;
            cursor: pointer;
            color: white;
            right:0px; /* 오른쪽 정렬 */
            top: 50px;
            width: 130px;
            height: 37px;
            border-radius: 4px;
            background-color: black;
            text-decoration: none;
            text-align: center;
            vertical-align: middle;
            padding-top: 8px;
        } /* 작성 설정 */

        /* ################### sub_body 설정 영역 ################### */
        .sub_body{
            height: 100%;
        } /* 리스트형 게시판의 영역 설정 */
        .sub_body *{
            border: 1px solid #cccccc;
            border-collapse: collapse;
            text-align: center;
        } /* 테두리 선에 대한 설정 */
        .list_area {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .list_items{
            width: 500px;
            height: 300px;
            border: 1px red solid;
            margin-bottom: 10px;
        }

        .list_items>.list_img{
            width: 100%;
        }

        .list_items>.data_area>.info{
            overflow: hidden;
            width: 60px;
            height: 20px;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        
        /* ################### sub_foot 설정 영역 ################### */
        .sub_foot{
            text-align: center;
            font-size: 30px;
            border: none;
        }
    </style>
</head>
<body>

    <jsp:include page="../common/header.jsp"/>
    
    <div class="body">
        <div class="inner_body">
            <div class="sub_head">
                <div class="title">연애의 발견</div>
                <a class="btn_write" href="detail.to">작성</a>
            </div>
            <div class="sub_body">
                <div class="list_area">
                
                    <div class="list_items">
                        <a class="list_img" href=""><img src="" alt="이미지 박스입니다."></a>
                        <div class="data_area">
                            <div class="title">제목자리</div>
                            <div class="info">설명자리입니다만</div>
                        </div>
                    </div>
                    
                </div>
                  <div class="sub_foot">
                      pagination
                  </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>