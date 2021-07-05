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

        <div class="write-board">
            <form name="board2write" style="margin:0;" onSubmit="return chkForm(this)"  method='post' action='apost.jsp'>
      <input type=hidden name='db' value='capstoneresult'> 
      <input type=hidden name='mode' value='write'> 
      <input type=hidden name='phpsess' value='nckpatirctcvkfvuij4ji'>

      <div class="wrName">
        <input type="number" name="num" placeholder="작성번호">
<!--         <input type="password" name="passwd" value="" placeholder="비밀번호">--> 
     </div>

     <div class="wrName">
      <input type="date" name="date" placeholder="날짜">
   </div>

     <div class="wrName">
        <input type="text" name="writer" placeholder="작성자" required size="10">
<!--         <input type="password" name="passwd" value="" placeholder="비밀번호">--> 
     </div>
     <div class="wrSubject">
        <input type="text" name="title" value="" placeholder="제목" required>
<!--
        <input type="checkbox" name="html" value="" class="chkbox">
        <b>HTML</b> 
--> 
     </div>
     <div class="wrContent">
        <textarea id="contents" name="content" required>
           
        </textarea>
        <script src="/spb3/scommon/js/ckeditor443/ckeditor.js"></script> 
        <script>
           CKEDITOR.replace( 'contents' );
        </script> 
     </div>
        <div class="wrFile"> <span class="fileTitle">썸네일이미지</span>
           <input type="file" name="file1">
        </div>
        <div class="wrFile"> <span class="fileTitle">첨부파일1</span>
           <input type="file" name="file2">
        </div>

     <div class="boardWriteBtn"> <a href="apost.jsp">
        <button id="write"><i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</button>
        </a>
        <a href="outcome.jsp">
        <button id="cancel" type="button"><i class="fa fa-list" aria-hidden="true"></i>목록으로</button>
        </a> </div>

</form>
</div>

        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    	<script src="js/bootstrap.js"></script>
   </body>
</html>