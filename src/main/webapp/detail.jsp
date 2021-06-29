<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>

<% String num = request.getParameter("num");
 session.setAttribute("num", num);
 %>


<%
	String id =(String)session.getAttribute("uid");
	if(id==null) {
		response.sendRedirect("ilogin.jsp");
	}
%>

<c:forEach var="row" items="${rs.rows}">
    <c:set var="num" value="${row.num}"/>
</c:forEach>


<sql:query var="rs" dataSource="jdbc/mydb"> 
   select num, title, memo, writer, date, hit, file_name, file1, file2
   from form1
   Where num = ?
   <sql:param value = "${param.num}"/>
</sql:query>



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
        <div  class="login_fun">
          <%= id %>님 환영합니다!
        </div>
        <hr color="#e6e6e6" size="0px">
        
        <%-- 카테고리 --%>
        <div class="sub7_tab_menu" style="text-align: center;">
          <a class="sub7_tab" href="introduce.jsp" style="display: inline-block;">소개</a> 
          <a class="sub7_tab" href="first.jsp" style="display: inline-block;">공지사항</a>
          <a class="sub7_tab" href="#" style="display: inline-block;">서식</a>
          <a class="sub7_tab check" href="outcome.jsp" style="display: inline-block;">성과</a>
        </div>

        <div class="board-view">
            <div class="viewBoard">
              <c:forEach var="row" items="${rs.rows}">
               <div class="viewSubject">${row.title}</div>
               <div class="viewInfo"> <span>제목 : ${row.title}</span> <span>작성자 : ${row.writer}</span> <span>작성일 : ${row.date}</span> <span>조회수 : 0</span></div>
               <div class="viewContent"> 
                  <div class="viewContent-body cke_editable ">
                     <center><a href='./upload/${row.file1}' target=_blank><img src='./upload/${row.file1}'  width="354" height="500"  class="sboard3readimage" border='0' alt='첨부파일명: ${row.file2}'></a><br><br><br></center>
                          ${row.memo}
                      </div>
                  <hr class="hr1"> - 첨부파일<br><a href="./upload/${row.file1}" target="_self" download> <img src="./image/disk.png">&nbsp;<font color="#999999">${row.file1}</font></a>&nbsp;
                      <br><a href="./upload/${row.file2}" target="_self" download> <img src="./image/disk.png">&nbsp;<font color="#999999">${row.file2}</font></a>&nbsp;<br> <hr class="hr2">
               
                         
                  </div>
               <div class="viewWrite"> <span class="viewListBtn">
                  <a href="./outcome.jsp"><i class="fa fa-list" aria-hidden="true"></i> 목록</a> </span> <span class="viewBtn">
                  
                  <a href="./modify.jsp?num=${row.num}"><i class="fa fa-cog" aria-hidden="true"></i> 수정하기</a> 
                  <a href="./delete_4.jsp?num=${row.num}" onClick="javascript: return confirm('정말 삭제하시겠습니까?');"><i class="fa fa-trash-o" aria-hidden="true"></i> 삭제하기</a>  </span> </div>
              </c:forEach>
              </div>
         </div>
      </div>
      </div>




        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    	<script src="js/bootstrap.js"></script>
   </body>
</html>