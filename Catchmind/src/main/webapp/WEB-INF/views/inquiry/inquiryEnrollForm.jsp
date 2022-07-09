<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Catchmind</title>
        <!-- 부트스트랩에서 제공하고 있는 스타일 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
        
        body{
            margin: auto;
            box-sizing: border-box;
        }
        
        .content{
            width:90%;
            height: 800px;
            margin: auto;
           /* border: 1px solid blue;*/
        }
        
        .innerContent{
            /*border: 1px solid red; */
            margin-top:50px;
        }

        #inquiryTable{
            margin:auto;
            /*border: 1px solid green;*/
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
            width:100px;
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
            <%-- header 영역 --%>
            <jsp:include page="../common/header.jsp"/>

            <div class="content">
            <br>
            <h2>1 : 1문의 </h2>
            <hr><br>
        	
            <div class="innerContent"> 
              <form action="insert.in" method="post">       
                
                <!-- input type="hidden" 으로 작성자 userNo 값 같이 전달-->
                <input type="hidden" name="qaWriter" value="${loginUser.userNo}">
                <table id="inquiryTable" class=".table-bordered" text-align="center">     
                    <tr>
                        <th> 제목 </th>      
                        <td>
                            <input type="text" name="qaTitle" required placeholder="제목을 입력해 주세요." size="95">
                        </td>               
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="qaContent" style="resize:none;" cols="97" rows="10" required placeholder="문의 내용을 작성해 주세요."></textarea>
                        </td>
                    </tr>
                    <!--
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <div class="filebox">
                                    <label for="ex_file">업로드</label>
                                    <input type="file" id="ex_file" name="file">
                                </div>
                            </td>
                        </tr>
                    -->
                    <tr>
                        <td colspan="2" align="center">
                            <button type="submit" id="btn1">문의하기</button>                          
                        </td>
                     </tr>   
                   </table>
                </form>
              <br><br>
       	    </div>
            <script>
                   

            </script>
        
          </div>

          <%-- footer 영역 --%>
          <jsp:include page="../common/footer.jsp"/>
        </body>
</html>