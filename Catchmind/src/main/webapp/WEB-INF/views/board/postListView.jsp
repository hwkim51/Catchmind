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
        .sub_body tr{
            font-size: 20px;
            height: 50px;
        } /* 리스트형 게시판 각 열 넓이 및 폰트 크기 */
        .sub_body .table_title{
            width: 1300px;
        } /* 제목 행에 대한 넓이 */
        .sub_body .table_writer{
            width: 300px;
        } /* 작성자 행에 대한 넓이 */
        .sub_body .table_date{
            width: 150px;
        } /* 작성일 행에 대한 넓이 */
        
        .sub_body>.table>thead{
            background-color: #eaeaea;
            border-spacing: 0px;
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
                <div class="title">에브리타임</div>
                <a class="btn_write" href="detail.po">작성</a>
            </div>
            <div class="sub_body">
                <table class="table">
                    <thead>
                      <tr>
                        <th class="table_title">글 제목</th>
                        <th class="table_writer">작성자</th>
                        <th class="table_date">작성일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>더미제목1</td>
                        <td>Dooley</td>
                        <td>2022-02-02</td>
                      </tr>
                      <tr>
                        <td>더미제목2</td>
                        <td>Dooley</td>
                        <td>2022-02-02</td>
                      </tr>
                      <tr>
                        <td>더미제목3</td>
                        <td>Dooley</td>
                        <td>2022-02-02</td>
                      </tr>
                      <tr>
                        <td>더미제목4</td>
                        <td>Dooley</td>
                        <td>2022-02-02</td>
                      </tr>
                      <tr>
                        <td>더미제목5</td>
                        <td>Dooley</td>
                        <td>2022-02-02</td>
                      </tr>
                      <tr>
                        <td>더미제목6</td>
                        <td>Dooley</td>
                        <td>2022-02-02</td>
                      </tr>
                      <tr>
                        <td>더미제목7</td>
                        <td>Dooley</td>
                        <td>2022-02-02</td>
                      </tr>
                      <tr>
                        <td>더미제목8</td>
                        <td>Dooley</td>
                        <td>2022-02-02</td>
                      </tr>
                      <tr>
                        <td>더미제목9</td>
                        <td>Dooley</td>
                        <td>2022-02-02</td>
                      </tr>
                      <tr>
                        <td>더미제목10</td>
                        <td>Dooley</td>
                        <td>2022-02-02</td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="sub_foot">
                      pagination
                  </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>