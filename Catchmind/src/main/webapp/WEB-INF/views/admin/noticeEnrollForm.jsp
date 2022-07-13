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
    text-decoration: none;
    background-color: black;
    border: none;
    border-radius: 4px;
    color: white;
    font-size: 18px;
    margin-left: 15px;
}

#noticeTable {
    margin: auto;
    margin-top: 50px;
    border-collapse: separate;
    border-spacing: 25px;
}

.filebox label {
    
    padding: .5em .70em;
    color: white;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: skyblue;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

#btn1{
    background-color: orange;
    color: white;
    width: 95px;
    height:40px;
    border-radius: .25em;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    font-size:medium;          
}
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
            <span id="title">공지사항 작성</span>
            <span id="toMain">CATCHMIND</span>
            <br>
                <div class="body-content">
                    <form action="insertNotice.ad" method="post" enctype="multipart/form-data">
                        <table id="noticeTable" class=".table-hover">
                            <tr>
                                <th> 제목 </th>      
                                <td>
                                    <input type="text" name="noticeTitle" required placeholder="제목을 입력해 주세요." size="95">
                                </td>               
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td>
                                    <textarea name="noticeContent" style="resize:none;" cols="97" rows="10" required placeholder="문의 내용을 작성해 주세요."></textarea>
                                </td>
                            </tr>
                                <tr>
                                    <th>첨부파일</th>
                                    <td>
                                        <div class="filebox">
                                            <label for="ex_file">업로드</label>
                                            <input type="file" id="ex_file" name="upfile" required>
                                        </div>
                                    </td>
                                </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <button type="submit" id="btn1">작성하기</button>   
                                    <button type="reset" class="btn btn btn-secondary">취소하기</button>                       
                                </td>
                            </tr>  
                        </table>
                    </form>
                </div>
            </div>
        </div>
    
    <script>
        $("#inquiryTable>tbody>tr>#detail").click(function(){
        	location.href="detailNotice.ad?nno="+$(this).siblings(".nno").text();
       })
    </script>
  </div>
</body>

</html>