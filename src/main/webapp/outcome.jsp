<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String id =(String)session.getAttribute("uid");
	if(id==null) {
		response.sendRedirect("ilogin.jsp");
	}
%>

<sql:query var="rs" dataSource="jdbc/mydb"> 
    select * from form1
</sql:query>

<!-- 오늘 몇건 -->
<sql:query var="todaypost" dataSource="jdbc/mydb">
select COUNT(date) as count from form1 where
date_format(date,'%Y-%m-%d')=curdate();
</sql:query>
<c:forEach var="today" items="${todaypost.rows}">
<c:set var="tdpost" value="${today.count}" />
</c:forEach>
<!-- 총 몇건  -->
<sql:query var="atotalpost" dataSource="jdbc/mydb">
select COUNT(*) as count from form1;
</sql:query>
<c:forEach var="total" items="${atotalpost.rows}">
<c:set var="attpost" value="${total.count}" />
</c:forEach>


<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="style_introduce.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="reset.css">
    
    <title>목포대학교 링크플러스사업단</title>
   </head>
   
   <body>
    <div id="content">
      <div class="sub-right">
        <h3>캡스톤디자인</h3>
        <hr color="#e6e6e6" size="0px">
        <div  class="login_fun">
          <%= id %>님 환영합니다!
        </div>

        <%-- 카테고리 --%>
        <div class="sub7_tab_menu" style="text-align: center;">
          <a class="sub7_tab" href="introduce.jsp" style="display: inline-block;">소개</a> 
          <a class="sub7_tab" href="first.jsp" style="display: inline-block;">공지사항</a>
          <a class="sub7_tab" href="#" style="display: inline-block;">서식</a>
          <a class="sub7_tab check" href="outcome.jsp" style="display: inline-block;">성과</a>
        </div>

        <%-- 검색 --%>
        <div class="board-search">
          <form name="board3search" style="margin:0;"  action="/webproject/menu4_search.jsp" method="get">
         <input type=hidden name='db' value='capstoneresult'>
            <div class="search-con" >
              <select name="sc_column">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="name">작성자</option>
              </select>
            </div>
            <div class="search-input">
              <input type="text" name="sc_string" value="" placeholder="검색 내용을 입력해주세요">
              <button id="btn_search" type="submit"><i class="fa fa-search"></i> 검색</button>
            </div>
            <div class="page-info">
							<span>오늘 : <strong> ${tdpost} </strong> 건
							</span> <span>총 : <strong> ${attpost} </strong> 건
							</span>
						</div>
          </form>
          <script language="JavaScript" type="text/JavaScript">
            var form_select = document.board3search.sc_column;
            var form_value             = '';
            for(var i=0;i<form_select.length;i++) {
               if(form_select.options[i].value==form_value) {
                  form_select.options[i].selected = true;
               }
            }
         </script>
      </div>
      
      <div class="board-glist">
        <div class="board-list-wrap">
          <ul class="clfix">
            
            <c:forEach var="row" items="${rs.rows}">
               <!-- /webproject/BoardDetailForm.jsp?no=${row.no}-->
                <li>
                    <a href="./detail.jsp?num=${row.num}"><div><img src="./upload/${row.file1}" alt="파일"></div></a>
                    <p class="subject"><a href="./detail.jsp?num=${row.num}">${row.title}</a></p>
                    <p class="date">${row.date}</p>
                </li>
        
            </c:forEach>
          </ul>
        
        </div>
        <div class="board-btn"> <a href="./post.jsp">
          <button id="write"><i class="fa fa-pencil" aria-hidden="true"></i>글쓰기</button>
          </a>
          </div>
    
    



        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    	<script src="js/bootstrap.js"></script>
   </body>
</html>
