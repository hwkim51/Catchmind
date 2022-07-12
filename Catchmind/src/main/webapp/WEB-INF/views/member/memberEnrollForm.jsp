<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #enrollForm{
        border-radius: 10px;
        background-color: rgba(211, 211, 211, 0.326);
        width: 700px;
        height: 520px;
        text-align: center;
        font-size: larger;
        position: absolute;
        margin: auto;
        top: 140px;
        left: 0px;
        right: 0px;
        font-size: 16px;
    }
    div[id*="enrollStep"]{
        height: 500px;
    }
    .enrollTitle{
        text-align: left;
        font-size: 19px;
        font-weight: 600;
        margin: 25px 40px;
        
    }
    .terms{
        width: 400px;
        font-size: 12px;
        resize: none;
        margin-bottom: 10px;
    }
    input[name*="terms"]{
        left:-20px;
    }
    .btn-terms{
        width: 180px;
        height: 40px;
        border: 0;
        border-radius: 30px;
        font-weight: 600;
        color:white;
        background-color: rgb(63, 63, 63);
    }
    .btn-terms:disabled{
        background-color: gray;
    }
    .status{
        margin: auto;
        margin-top: 1vh;
        height: 5px;
        border-radius: 40px;
        width: 50%;
        background-color: rgba(211, 211, 211);
    }
    .statusBar{
        border-radius: 40px;
        height: 100%;
        width: 33%;
        background-color: orange;
    }
    #enrollStep2,#enrollStep3{
        display: none;
    }
    .check_font{
        padding: 0px 0px 10px 60px;
        font-size: 10px;
    }
    input[name="phone"]{
        width:50px;
    }
    #upfilePicPreview{
        background-image:url('https://cdn-icons-png.flaticon.com/512/3525/3525130.png');
        background-size: contain;
        background-color: rgba(0, 0, 0, 0.865);
    }
    #upfilePicPreview:hover{
        cursor: pointer;
        background-image:url('./resources/images/pic2.png');
        background-size: contain;
        background-color: rgba(0, 0, 0, 0.865);
    }
</style>
</head>

<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>

    <hr>
    <!-- *ID, *PW, *PW확인, 이름, 생년월일, 성별, *전화번호, *이메일-->
    <form action="insert.me" method="post" id="enrollForm" enctype="multipart/form-data">
        <div id="enrollStep1">
            <div class="enrollTitle">회원가입 - 이용약관 동의</div>
           
            <label for="terms1">캐치마인드 서비스 이용 약관 동의(필수)</label>
            <input type="checkbox" id="terms1" name="terms1" checked><br>
            <textarea class="terms" rows="4">
제1장 서비스 이용 계약
제1조 이용계약의 체결 및 적용
1. CATCHMIND 계정(이하 '계정')이란 여러분이 서비스를 사용하는 데 필요한 이메일 주소 및 ID, 패스워드 기반 혹은 제삼자가 제공하는 오픈 아이디를 통한 로그인 계정을 의미합니다.
2. 계정은 회원이 약관에 동의하고 회원의 이메일 주소를 입력하고 패스워드를 등록한 후 필요한 경우 전화번호를 인증한 후 승낙하거나 기타 외부 서비스 계정을 통한 로그인 절차로 생성됩니다. 회원이 본 서비스의 계정을 생성하면 본 약관에 동의하는 것으로 간주합니다.
3. 회사는 회원의 상태와 이용 기간, 이용 횟수 등에 따라 회사의 합리적인 기준을 통해 서비스 범위에 차등을 둘 수 있으며, 회원은 상기 내용에 따라 서비스 이용에 제약을 받을 수 있습니다.

제2조 이용 신청의 승낙과 제한
1. 서비스의 안정적인 운영을 위해 회원 가입시 가입 승인을 위한 모니터링이 이루어지며, 가입 승인 이후에도 회원 프로필에 대한 모니터링이 이루어집니다.
2. 회사는 관련 법률, 본 약관 또는 사용자 가이드라인 등을 위반하거나 부적절 또는 불건전한 콘텐츠를 감지하기 위하여 법률과 기술이 허용되는 범위 내에서 자동화된 방법, 인적인 방법 기타 다양한 방법으로 회원의 콘텐츠에 대한 모니터링을 실시하고 있습니다. 회원은 영상통화 화면을 포함하여 회원이 본 서비스를 통해 전송하거나 공유하는 일체의 콘텐츠에 대하여 회사가 모니터링하거나 검토할 수 있다는 점을 이해하고 이에 동의합니다.
3. 프로필 관리 목적에 필요한 경우 프로필의 작성내용이 수정 및 삭제될 수 있으며, 다음 각호에 해당하는 신청에 대해서는 승낙하지 않거나 사후에 이용계약을 해지할 수 있습니다.
    1. 가입 신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우
    2. 제3자의 전자우편 및 개인 정보를 이용하여 신청한 경우
    3. 회원이 작성한 닉네임이나 기타 프로필 내용에 허위 사실이 있는 경우
    4. 개인정보 유출 우려가 있거나 반사회적 또는 미풍양속에 어긋날 경우
    5. 회사와 회사의 운영자로 오인될 우려가 있는 경우
    6. 작성과정 상의 문제로 인해 제대로 입력되어 있지 않은 경우
    7. 부정한 용도로 서비스를 사용하고자 하는 경우
    8. 비정상적인 방법을 통하여 아이디 및 도메인을 대량으로 생성하는 행위


제2장 서비스 이용
제3조 계정 및 이용
1. 회원은 1인 1 계정을 원칙으로 합니다.
2. 회원은 아이디와 비밀번호에 관해서 관리책임이 있습니다.
3. 회원은 아이디 및 비밀번호를 제3자가 이용하도록 제공하여서는 안 됩니다.
4. 회사는 회원이 아이디 및 비밀번호를 소홀히 관리하여 발생하는 서비스 이용상의 손해 또는 회사의 고의 또는 중대한 과실이 없는 제3자의 부정 이용 등으로 인한 손해에 대한 책임을 지지 않습니다.
5. 회원은 아이디 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 회사에 통지하고 회사의 안내에 따라야 합니다.
6. 회원은 캐치마인드의 '커뮤니티 가이드라인' 및 [라이브 커뮤니티 가이드라인](https://www.notion.so/84c88d61b89c4d48ad873b8b7ec10a16)을 준수하여야 합니다.
7. 회원은 본인 여부 확인을 위한 인증 서비스 진행 시 진실하고 정확한 정보를 등록해야 합니다.
8. 회사는 계정 정보를 통해 회원의 본인 여부 확인 및 청소년 이용자 여부 확인 등의 지속적인 회원 관리업무를 수행합니다.
9. 청소년(만 19세 미만인 자)이나 피한정후견인, 피성년후견인은 이용이 제한될 수 있습니다.

</textarea><br>
        <label for="terms2">개인정보 수집 및 이용 동의(필수)</label>
        <input type="checkbox" id="terms2" name="terms2" checked><br>
        <textarea class="terms" rows="4">
개인정보보호법에 따라 캐치마인드에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
제 4장 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 캐치마인드 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 캐치마인드는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
회원가입 시점에 캐치마인드가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
서비스 이용 과정에서 위치정보가 수집될 수 있으며, 캐치마인드개인정보보호법에 따라 캐치마인드에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
제 4조 수집하는 개인정보 이용자는 회원가입을 하지 않아도 정보 검색 등 대부분의 캐치마인드 서비스를 회원과 동일하게 이용할 수 있습니다. 
- 회원 가입 시에 ‘아이디, 비밀번호, 이름휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.


제 5장 수집한 개인정보의 이용
캐치마인드 및 캐치마인드 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 캐치마인드 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
제 5조 개인정보의 보관기간
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
- 통신비밀보호법
로그인 기록: 3개월
참고로 캐치마인드는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.
제 6조 개인정보 수집 및 이용 동의를 거부할 권리
이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.에서 제공하는 위치기반 서비스에 대해서는 '카카오API 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.

제 6장 수집한 개인정보의 이용
캐치마인드 및 캐치마인드 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 캐치마인드 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.

제 7장 개인정보 수집 및 이용 동의를 거부할 권리
이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.
</textarea><br>
            <label for="terms3">위치기반 서비스 이용 동의(필수)</label>
            <input type="checkbox" id="terms3" name="terms3" checked><br>
            <textarea class="terms" rows="4">
위치기반서비스 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 캐치마인드의 카카오API 위치기반 서비스를 이용할 수 있습니다.
제 1 조 (목적)
이 약관은 캐치마인드 주식회사 (이하 “회사”)가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.
지요구권을 행사할 수 있습니다.
제 3 조 (위치정보 이용·제공사실 확인자료 보유근거 및 보유기간)
회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집·이용·제공사실 확인자료를 위치정보시스템에 자동으로 기록하며, 6개월 이상 보관합니다.
제 4 조 (사업자 정보 및 위치정보 관리책임자)
① 회사의 상호, 문의전화, 이메일은 다음과 같습니다.
- 상호: 캐치마인드
- 문의전화 : 02-1544-9970 
- 이메일 : admin@chtchmind.am
② 회사는 다음과 같이 위치정보 관리책임자를 지정하여 이용자들이 서비스 이용과정에서 발생한 민원사항 처리를 비롯하여 개인위치정보주체의 권리 보호를 위해 힘쓰고 있습니다.
- 위치정보 관리책임자 : 캐치마인드 (개인정보 보호책임자 겸직)
</textarea><br>
        
            <input type="button" id="btn-terms1" class="btn-terms" value="NEXT &nbsp;> ">
            
        </div>


        <div id="enrollStep2">
            <div class="enrollTitle">회원가입 - 개인정보 입력</div>
                
            <label for="userId">* ID 입력 : </label>
            <input type="text" id="userId" name="userId" maxlength="15"><br>
                <div class="check_font" id="id_check">영문자, 숫자 4 ~ 15 글자 사이 입력</div>

            <label for="userPwd">* PW 입력: </label>
            <input type="password" id="userPwd" name="userPwd" maxlength="16"><br>
                <div class="check_font" id="pwd_check">영문자, 숫자, 특수기호 총 4 ~ 16글자</div>

            <label for="checkPwd">* PW 확인 : </label>
            <input type="password" id="checkPwd" name="checkPwd" maxlength="16"><br>
                <div class="check_font" id="pwd_check2"> 확인을 위해 동일한 비밀번호를 입력하세요.</div>

            <label for="userName"> 이름(본명) : </label>
            <input type="text" id="userName" name="userName" maxlength="15"><br>
                <div class="check_font"></div>

            <label for="birthDay"> 생년월일 : </label>
            <input type="date" id="birthDay" name="birthDay" style="padding-left: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;<br>
                <div class="check_font"></div>

            <label for="phone">* 휴대폰번호 : </label>
            <input type="text" id="phone1" name="phone" value="010" maxlength="3" readonly>
            -<input type="text" id="phone2" name="phone" maxlength="4">
            -<input type="text" id="phone3" name="phone" maxlength="4"><br>
                <div class="check_font"></div>

            <label for="email">* EMAIL : </label>
            <input type="email" id="email" name="email"><br>
                <div class="check_font"></div>
                <div class="check_font"></div>

            <input type="button" id="btn-terms2" class="btn-terms" value="NEXT &nbsp;> ">
        </div>

        <!-- 닉네임, 주소, 전화번호, 키, MBTI-->
        <div id="enrollStep3">
            <div class="enrollTitle">회원가입 - 프로필 만들기</div>
           
            <img id="upfilePicPreview" width="170" height="170" style="border:none; border-radius: 70%;"><br><br>
            <input type="file" id="upfilePic" name="upfilePic" onchange="loadImg(this)">
            <label for="nickname">* 닉네임: </label>
            <input type="text" id="nickname" name="nickname" maxlength="15"><br>
                <div class="check_font" id="nickname_check">닉네임으로 회원님을 소개해주세요.</div>
            <label for="mbti">MBTI : </label>
            <input type="text" id="mbti" name="mbti"><br><br>
          
            <input type="submit" id="btn-terms3" class="btn-terms" value="회&nbsp;원&nbsp;가&nbsp;입 ">
        </div><br>
        <div class="status">
            <div class="statusBar"></div>
        </div>
    </form>
       
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>

    <script>
        function loadImg(inputfile){
            if(inputfile.files.length == 1){ // 업로드할 프로필사진 선택 O (미리보기)
                var reader = new FileReader();
                reader.readAsDataURL(inputfile.files[0]);
                reader.onload = function(e){
                    $("#upfilePicPreview").attr("src", e.target.result);
                }
            }
            else{ // 업로드할 프로필사진 선택 X (미리보기 없음)
                $("#upfilePicPreview").attr("src", null);
            }
        }
        $(function(){

            $("#upfilePic").hide();

            $("#upfilePicPreview").click(function(){
                $("#upfilePic").click();
            });
            // * 약관 동의시에만 NEXT 버튼 활성화 
            $(function(){agree_terms();})
            
            $("#terms1").change(function(){agree_terms();});
            $("#terms2").change(function(){agree_terms();});
            $("#terms3").change(function(){agree_terms();});

            function agree_terms(){
                if($("#terms1").prop("checked") && $("#terms2").prop("checked") && $("#terms3").prop("checked")){
                    $("#btn-terms1").prop("disabled",false);
                } else{
                    $("#btn-terms1").prop("disabled",true);    
                }
            }
          
            // * step1 > step2 > step3 
            $("#btn-terms1").click(function(){
                $(".statusBar").css("width","70%");
                $("#enrollStep1").css("display","none");
                $("#enrollStep2").css("display","block");
            })
            $("#btn-terms2").click(function(){
                if($("#userId").val()=='' || $("#userPwd").val()=='' || $("#checkPwd").val()=='' || 
                    $("#phone1").val()=='' || $("#phone2").val()=='' || $("#phone3").val()=='' || $("#email").val()==''){
                        alertify.alert("회원가입 안내"," * 필수 항목을 모두 채워주세요.");
                        $("#btn-terms2").prop("disabled",true); 
                }
                else{
                    if( !regExpId.test($checkId.val()) || !regExpPwd.test($userPwd.val()) || ($userPwd.val() != $checkPwd.val())
                        || !regExpPhone.test($phone[1].value) || !regExpPhone.test($phone[2].value) || !regExpEmail.test($email.val()) 
                        || $("#id_check").text()!="사용 가능한 아이디입니다."){
                        alertify.alert("회원가입 안내"," * 가입항목을 다시 확인해주세요.");
                        $("#btn-terms2").prop("disabled",true);  
                    }
                    else{
                        $("#btn-terms2").prop("disabled",false); 
                        $(".statusBar").css("width","100%");
                        $("#enrollStep2").css("display","none");
                        $("#enrollStep3").css("display","block");
                    }
                }
            })
            $("#btn-terms3").click(function(){
                if($("#nickname").val()==''){
                    alertify.alert("회원가입 안내"," * 필수 항목을 모두 채워주세요.");
                    $("#nickname").focusin();
                    $("#btn-terms3").prop("disabled",true); 
                }
            })
            // * 버튼 활성화
            $("[name='phone']").blur(function(){
                $("#btn-terms2").prop("disabled",false);
            })
            $("#userName").blur(function(){
                $("#btn-terms2").prop("disabled",false);
            })
            $("#birthday").click(function(){  
                $("#btn-terms2").prop("disabled",false);
            })

            // * 유효성 체크 & 중복체크용
            var $checkId = $("#enrollStep2 input[name=userId]");
            var $userPwd = $("#enrollStep2 input[name=userPwd]");
            var $checkPwd = $("#enrollStep2 input[name=checkPwd]");
            var $email = $("#enrollStep2 input[name=email]");
            var $phone = $("#enrollStep2 input[name=phone]");
            var $nickname = $("#enrollStep3 input[name=nickname]");

            var regExpId = /^[0-9a-zA-Z]{3,14}$/; 
            var regExpPwd = /^[a-zA-Z0-9`~!@#$%^&*+=_-|₩';:₩"/?]{4,16}$/i;
            var regExpPhone = /^[0-9]{4}$/;
            var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9A-Za-z])*@[0-9a-zA-Z]([-_.]?[0-9A-Za-z])*.[a-zA-Z]{2,3}$/i;

            // * id 유효성 검사 & 중복체크
            $checkId.blur(function(){   
                if($checkId.val().length >= 4){
                    $.ajax({
                        url : 'idCheck.me',
                        data : {checkId : $checkId.val()},
                        success : function(result){
                            if(result =="NNNNN"){
                                $("#id_check").css("color","red").text("이미 사용중인 아이디입니다.");
                            } else{
                                if(!regExpId.test($checkId.val())){
                                    $("#id_check").css("color","red").text("영문자, 숫자 4 ~ 15자로 입력해주세요.");
                                }
                                else{
                                    $("#id_check").css("color","green").text("사용 가능한 아이디입니다.");
                                }
                            }},
                        error : function(){
                            console.log("아이디 중복체크 ajax 통신 실패");
                        }
                    });
                }
                else{
                    $("#id_check").css("color","red").text("영문자, 숫자 4 ~ 15자로 입력해주세요.");
                }
                
            })
            
            // * 비밀번호 유효성 체크 
            $userPwd.blur(function(){
                if($userPwd.val().length >= 1 && !regExpPwd.test($userPwd.val())){
                    $("#pwd_check").css("color","red").text("영문자, 숫자, 특수기호 4 ~ 16자로 입력해주세요.");
                }
                else{
                    if( $checkPwd.val().length >= 1 && ($userPwd.val() == $checkPwd.val())){
                        $("#pwd_check").text(" 　");
                        $("#pwd_check2").text(" 　");
                        $("#btn-terms2").prop("disabled",false);
                    }
                    else{
                        $("#pwd_check").text(" 　");
                        $("#btn-terms2").prop("disabled",false);
                    }
                }
            })

            // * 재확인 비밀번호 일치 체크
            $checkPwd.blur(function(){       
                if( $checkPwd.val().length >= 1 && ($userPwd.val() != $checkPwd.val())){
                    $("#pwd_check2").css("color","red").text("비밀번호가 일치하지 않습니다.");
                }
                else{
                    $("#pwd_check2").text(" 　");
                }
            }) 
            
            // * 휴대폰번호 유효성 체크 
            $phone.blur(function(){
                if($phone[1].value != '' && $phone[2].value != ''){
                    if(!regExpPhone.test($phone[1].value) || !regExpPhone.test($phone[2].value) ){
                        alertify.alert("회원가입 안내","유효한 휴대폰 번호가 아닙니다. 다시 입력해 주세요.");
                    }}
            });
   
            // * 이메일 유효성 체크
            $email.blur(function(){
                if( $email.val().length >= 1 &&  !regExpEmail.test($email.val())){
                        alertify.alert("회원가입 안내","유효한 이메일이 아닙니다. 다시 입력해 주세요.");
                        document.getElementById("email").value="";
                }
                else{
                    $("#btn-terms2").prop("disabled",false);
                }
            })

            // * 닉네임 중복 체크 
            $nickname.blur(function(){ 
                if($nickname.val().length >= 1){
                    $.ajax({
                            url : 'nicknameCheck.me',
                            data : {nickname : $nickname.val()},
                            success : function(result){
                                console.log("result : "+result);
                                if(result =="NNNNN"){
                                    $("#nickname_check").css("color","red").text("이미 사용중인 닉네임입니다.");
                                    $("#btn-terms3").prop("disabled",true); 
                                } else{
                                    $("#nickname_check").css("color","green").text("사용 가능한 닉네임입니다.");
                                    $("#btn-terms3").prop("disabled",false); 
                                }
                            },
                            error : function(){
                                console.log("닉네임 중복체크 ajax 통신 실패");
                            }
                        });
                }
                else{
                    $("#nickname_check").css("color","black").text("닉네임으로 회원님을 소개해주세요.");
                }
            });
        });
        
        
    </script>
</body>
</html>