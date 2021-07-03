<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="style_introduce.css">
<title>목포대학교 링크플러스사업단</title>
</head>

<body>

	<div id="content">
		<div class="sub-right">
			<h3>캡스톤디자인</h3>
			<hr color="#e6e6e6" size="0px">
			<%-- 카테고리 --%>
			<div class="sub7_tab_menu" style="text-align: center;">
				<a class="sub7_tab check" href="introduce.jsp" style="display: inline-block;">소개</a> 
				<a class="sub7_tab" href="first.jsp" style="display: inline-block;">공지사항</a>
				<a class="sub7_tab" href="#" style="display: inline-block;">서식</a>
				<a class="sub7_tab" href="outcome.jsp" style="display: inline-block;">성과</a>
			</div>
			<%-- 소개문 --%>
            <div class="sub-right-content"> 
                <div class="sub-right-title"><img class="headermarker" src="./image/headermarker.png" alt="headermarker">캡스톤디자인</div>	
                <div class="sub-sec-title"><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div>기업/기관의 어려움을 창의적으로 해결해 드립니다.</div>
                <div class="sub-div-st intro">
                    <table class="sub-inner-div-st capstone table intro" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="4%">
                            <col width="96%">
                        </colgroup>
                        <tr class="sub-sec-list">
                            <td><div class="square"></div></td>
                            <td>기업/기관의 요구사항을 반영하여 교수와 학생들의 기획-설계-제작을 통해 창의적인 해결책을 도출하는 교과과정</td>
                        </tr>
                        <tr class="sub-sec-list">
                            <td><div class="square"></div></td>
                            <td>학기 중 상시 운영</td>
                        </tr>
                        <tr class="sub-sec-list">
                            <td><div class="square"></div></td>
                            <td>기업/기관 혜택 : 기업/기관에 필요한 창의적 해결책, 전문가 자문비 지원 등</td>
                        </tr>
                    </table>
                    <div class="sub-inner-div-st capstone img intro">
                        <img src="./image/sub2_3_picture1.jpg" alt="picture1">
                    </div>
                </div>
                <div class="sub-sec-title"><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div>지원대상</div>
                <ul class="sub-sec-list" >
                    <li>LINC+ 참여학과 3~4학년</li>
                </ul>
                <div class="sub-sec-title"><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div>지원자격</div>
                <ul class="sub-sec-list" >
                    <li>학과에서 개설한 교과목 중 종합설계 또는 Capstone Design으로 표기된 교과목을 수강하는 학부생 3인 이상으로 구성된 팀</li>
                </ul>
                <div class="sub-sec-title"><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div>지원내용</div>
                <ul class="sub-sec-list" >
                    <li>과제 수행에 필요한 경비(회의비, 재료비, 시제품제작비 등)</li>
                    <li>특허 출원&middot;등록 비용(지원금 외 별도 지원)</li>
                </ul>
                <div class="sub-sec-title"><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div>지원절차</div>
                <div class="sub-inner-div-st capstone img">
                        <img src="./image/support_process.jpg" alt="process">
                    </div>
                <div class="sub-sec-title" style="margin-bottom:0;"><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div>유형</div>
                <div class="sub-div-st linner">
                    <div class="sub-inner-div-st capstone img">
                        <img src="./image/sub2_3_picture2.png" alt="picture2">
                    </div>
                    <table class="sub-inner-div-st capstone table" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="4%">
                            <col width="96%">
                        </colgroup>
                        <tr class="sub-sec-list">
                            <td><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div></td>
                            <td class="table-sub-title">기업/지역사회연계형 캡스톤디자인</td>
                        </tr>
                        <tr class="sub-sec-list">
                            <td></td>
                            <td>기업/지역사회에서 제안한 주제에 대한 작품제작을 추진하고 기업/지역사회 전문가와 함께 작품을 지도하는 캡스톤 디자인</td>
                        </tr>
                    </table>
                </div>
                <div class="sub-div-st linner">
                    <div class="sub-inner-div-st capstone img">
                        <img src="./image/sub2_3_picture3.png" alt="picture3">
                    </div>
                    <table class="sub-inner-div-st capstone table" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="4%">
                            <col width="96%">
                        </colgroup>
                        <tr class="sub-sec-list">
                            <td><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div></td>
                            <td class="table-sub-title">성과집중형 캡스톤디자인</td>
                        </tr>
                        <tr class="sub-sec-list">
                            <td></td>
                            <td>직접적 성과 창출이 가능한 주제를 선정하여 특허, 기술이전, 창업 등 성과를 도출하는 성과집중형 캡스톤디자인<br><strong>특허출원, 기술이전, 시제품 등 성과 필수</strong></td>
                        </tr>
                    </table>
                </div>
                <div class="sub-div-st linner">
                    <div class="sub-inner-div-st capstone img">
                        <img src="./image/sub2_3_picture4.png" alt="picture4">
                    </div>
                    <table class="sub-inner-div-st capstone table" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="4%">
                            <col width="96%">
                        </colgroup>
                        <tr class="sub-sec-list">
                            <td><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div></td>
                            <td class="table-sub-title">창의적아이디어형 캡스톤디자인</td>
                        </tr>
                        <tr class="sub-sec-list">
                            <td></td>
                            <td>창의적인 아이디어나 창업 아이템을 도출하는 캡스톤디자인</td>
                        </tr>
                    </table>
                </div>
                <div class="sub-div-st">
                    <div class="sub-inner-div-st capstone img">
                        <img src="./image/sub2_3_picture5.png" alt="picture5">
                    </div>
                    <table class="sub-inner-div-st capstone table" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="4%">
                            <col width="96%">
                        </colgroup>
                        <tr class="sub-sec-list">
                            <td><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div></td>
                            <td class="table-sub-title">미래연계형 캡스톤디자인</td>
                        </tr>
                        <tr class="sub-sec-list">
                            <td></td>
                            <td>기존 캡스톤디자인 결과를 업그레이드하여 진행하는 캡스톤디자인</td>
                        </tr>
                    </table>
                </div>
            </div>
            <p style="width:100%;text-align: center;color: #2d2d2d;">담당자 : LINC+사업단 박은진 &nbsp;&nbsp;&nbsp; 연락처 : 061)450-6407&nbsp;&nbsp;&nbsp; 이메일 : capstone@mokpo.ac.kr</p>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
