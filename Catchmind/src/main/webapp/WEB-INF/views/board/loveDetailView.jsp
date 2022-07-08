<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
      /* ################### 임시 ################### header영역 넓이 */
      .header{
          width: 100%;
          height: 100px;
          background-color: aquamarine;
      } 

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

      /* ################### sub_body 설정 영역 ################### */
      .sub_body{
          height: 100%;
          background-color: #eaeaea;
          padding: 25px 25px 25px 25px;
      } /* 게시판의 영역 설정 */

      /* ########## 글제목, 작성일자, 작성자 설정 영역 ########## */
      .sub_body>.wr_title{
        display: inline-block;
        width: 1200px;
        font-weight: 800;
        font-size: 30px;
        margin-bottom: 5px;
      } /* 글제목 설정 */
      .sub_body>.wr_date{
        display: inline-block;
        width: 400px;
        font-weight: 800;
        font-size: 30px;
      } /* 작성일자 설정 */
      .sub_body>.wr_writer{
        width: 1200px;
        font-weight: 800;
        font-size: 30px;
        margin-bottom: 20px;
      } /* 작성자 설정 */

      /* ########## 글내용 설정 영역 ########## */
      .sub_body>.wr_content{
        height: 100%;
        font-size: 20px;
        border-bottom: 1px solid #cccccc;
        padding-bottom: 20px;
      } /* 글 내용 설정 */

      /* ########## 댓글 입력 설정 영역 ##########*/
      .sub_body>.wr_reply{
        padding-top: 20px;
        text-align: center;
      } /* 글내용과 댓글입력 창 사이 공간 설정 */
      .sub_body>.wr_reply input{
        width: 700px;
        height: 30px;
        border: none;
        outline: none;
        border-radius: 4px;
        padding: 10px 10px 10px 10px;
        font-size: 17px;
      } /* 댓글 입력하는 창 설정 */
      .sub_body>.wr_reply button{
        background-color: black;
        border: none;
        border-radius: 4px;
        height: 50px;
        width: 100px;
        color: white;
        font-size: 17px;
        transform: translateY(2px); /* 입력창과 높이 맞춤 */
        margin-left: 30px;
      } /* 댓글 입력 버튼 설정 영역 */
      
      /* ########## 입력된 댓글 설정 영역 ########## */
      .sub_body table{
        padding-top: 20px;
        font-size: 17px;
      } /* 댓글입력 창과 댓글 리스트 사이 공간 및 댓글 크기 */
      .sub_body table .rep_count{
        width: 100px;
        text-align: left;
      } /* 댓글 카운트 */
      .sub_body table .rep_content{
        width: 1200px;
        text-align: left;
      } /* 실제 댓글 내용 */
      .sub_body table .rep_writer{
        width: 400px;
        text-align: left;
        vertical-align: top; /* 댓글이 길어져도 작성자 상단 고정 */
      } /* 댓글 작성자 */
      /* ################### sub_foot 설정 영역 ################### */
      .sub_foot{
        text-align: center;
        font-size: 30px;
        border: none;
        padding-bottom: 100px;
        padding-top: 20px;
      }
      .sub_foot>.btn_list{
        cursor:pointer;
        color:black;
        text-decoration: none;
      }

      /* ################### 임시 ################### header영역 넓이 */
      .footer{
          position: fixed;
          left: 0px;
          width: 100%;
          height: 50px;
          bottom: 0px;
          background-color: aquamarine;
      } 
      
    </style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />
        
    <div class="body">
        <div class="inner_body">
            <div class="sub_head">
                <div class="title">연애의 발견</div>
            </div>
            <div class="sub_body">
                <div class="wr_title">글제목 : 얄리얄리얄라셩 얄랼리얄랴</div>
                <div class="wr_date">작성일자 : 2020-02-02</div> <br>
                <div class="wr_writer">작성자 : 마법주문</div> <br>
                <div class="wr_content">내용이 들어갈 자리</div>
                <div class="wr_reply">
                    <form action="">
                        <input type="text" placeholder="댓글을 입력해주세요">
                        <button type="submit">작성</button>
                    </form>
                </div>
                <table>
                    <!-- 유동적으로 보여주기 -->
                    <!-- 댓글없다 -->
                    <tr class="wrap_rep">
                        <th class="rep_count">댓글(0)</th>
                        <td class="rep_content">작성된 댓글이 없습니다.</td>
                        <td class="rep_writer"></td>
                    </tr>
                    <!-- 댓글있다 -->
                    <tr>
                        <th class="rep_count">댓글(2)</th>
                        <td class="rep_content">솰라솰라</td>
                        <td class="rep_writer">얄라얄라</td>
                    </tr>
                    <tr>
                        <td class="rep_count"></td>
                        <td class="rep_content">솰라솰라</td>
                        <td class="rep_writer">얄라얄라</td>
                    </tr>
                </table>
                
            <div class="sub_foot">
                <a class="btn_list" href="javascript:history.back()">목록으로 ▶ </a>
            </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>