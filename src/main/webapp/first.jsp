<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="tool.DBConn" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.Board" %>


<%  String type=request.getParameter("type"); 
	String keyword=request.getParameter("keyword");
	request.setAttribute("type", type); 
	request.setAttribute("keyword", keyword);

	List<Board> boardList;
	if (keyword == null) {
	boardList = DBConn.selectBoardList();
	} else {
	boardList = DBConn.selectBoardList(type, keyword);
	}
	request.setAttribute("boardList", boardList);
%>
	<!--세션에서 uid 이름으로 사용자 ID값  -->
	<% String id=(String)session.getAttribute("uid"); if(id==null) {
		response.sendRedirect("ilogin.jsp"); } %>
		<sql:query var="rs" dataSource="jdbc/mydb">
			select num, title, writer, date, hit from board
		</sql:query>
		<!-- 오늘 몇건 -->
		<sql:query var="todaypost" dataSource="jdbc/mydb">
			select COUNT(date) as count from board where
			date_format(date,'%Y-%m-%d')=curdate();
		</sql:query>
		<c:forEach var="today" items="${todaypost.rows}">
			<c:set var="tdpost" value="${today.count}" />
		</c:forEach>
		<!-- 총 몇건  -->
		<sql:query var="atotalpost" dataSource="jdbc/mydb">
			select COUNT(*) as count from board;
		</sql:query>
		<c:forEach var="total" items="${atotalpost.rows}">
			<c:set var="attpost" value="${total.count}" />
		</c:forEach>
		<!DOCTYPE html>
		<html>
		<head>
			<meta charset="UTF-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<link rel="stylesheet" href="css/bootstrap.css" />
			<link rel="stylesheet" href="style.css">
			<title>캡스톤 디자인</title>
</head>
	<body>
			<div class="header">
				<h2>
					<a href="first.jsp">캡스톤 디자인</a>
				</h2>
			</div>
			<div class="login_fun">
				<%= id %>님 환영합니다!
			</div>
			<!-- 메뉴바 바꾸는 nav 클래스 -->
			<nav class="navbar navbar-expand-sm bg-light">
				<%-- 카테고리 --%>
					<div class="sub7_tab_menu" style="text-align: center;">
						<a class="sub7_tab" href="introduce.jsp"
							style="display: inline-block;">소개</a> <a class="sub7_tab check"
							href="./first.jsp?page=1"
							style="display: inline-block;">공지사항</a> <a class="sub7_tab"
							href="#" style="display: inline-block;">서식</a> <a
							class="sub7_tab" href="outcome.jsp"
							style="display: inline-block;">성과</a>
					</div>
					<ul class="nav navbar-nav navbar-right">
						<!-- dropdown 기능: 어떤 메뉴를 클릭하면 하위메뉴가 나옴 -->
						<li class="dropdown"><a href="#" class="dropdown toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">로그아웃<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="active"><a href="logout.jsp">로그아웃</a></li>
								<!-- <li><a href="register.jsp">회원가입</a></li> -->
							</ul>
						</li>
					</ul>
					
			</nav>
			<div class="container">
				<!-- <div class="col-lg-4"></div> -->
				<div class="col-lg-6">
					<div class="jumbotron" style="padding-top: 20px">
						<select id="type" name="noption">
							<option value="title" <c:if
								test='${type!=null && type=="title"}'>selected</c:if>>제목
							</option>
							<option value="memo" <c:if test='${type!=null && type=="memo"}'>
								selected</c:if>>내용</option>
							<option value="writer" <c:if
								test='${type!=null && type=="writer"}'>selected</c:if>>작성자
							</option>
						</select> <input id="keyword" type="text" value="${keyword}" />
						<button id="search__button" class="btn btn-danger"
							type="button">검색</button>
						<div class="page-info">
							<span>오늘 : <strong> ${tdpost} </strong> 건
							</span> <span>총 : <strong> ${attpost} </strong> 건
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<table class="table">
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
						<th>첨부파일</th>
					</tr>
					<c:forEach var="row" items="${boardList}">
						<tr>
							<td>${row.num}</td>
							<%-- <td> <a href="./post.jsp?db=first&num=${row.num}">
									${row.title}</a></td> --%>
								<td><a href="boardread.jsp?num=${row.num}" />${row.title}
								</td>
								<td>${row.writer}</td>
								<td>${row.date}</td>
								<td>${row.hit}</td>
								<td><a href="file_download.jsp?num=${row.num}">${row.fileName}
										<img src="./image/disk.png" width="15px" ; />
									</a></td>
						</tr>
					</c:forEach>
				</table>
				<div style="display: flex; justify-content: flex-end; margin-bottom: 50px;">
					<button id="write__button" class="btn btn-danger"
						type="button">글쓰기</button>
				</div>
			</div>
			<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
			<script src="js/bootstrap.js"></script>
			<script>
				//글쓰기버튼클릭이벤트
				function write() {
					location.href = 'boardwrite.jsp';
				}
				document.querySelector("#write__button").addEventListener("click", write);
				//검색버튼클릭이벤트
				function search() {
					var type = document.querySelector("#type").value;
					var keyword = document.querySelector("#keyword").value;
					location.href = 'first.jsp?type=' + type + '&keyword=' + keyword;
				}
				document.querySelector("#search__button").addEventListener("click", search);
			</script>
		</body>
		</html>