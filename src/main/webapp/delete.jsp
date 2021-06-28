<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    String num = request.getParameter("num");
%>

<sql:query dataSource="jdbc/mydb" var="rs">
    select * from board where num = <%=num%>
</sql:query>

<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.css" />
<title>삭제</title>
</head>
<body>
	<!--삭제시키기 위한 쿼리문  -->
	<sql:update dataSource="jdbc/mydb" var="deletetable">
      delete from board where num = <%=num%>
	</sql:update>
	<script>
            alert("삭제 완료!");
    </script>
	
	<a href="first.jsp"><button class="btn btn--primary type="button">메인 페이지 이동</button></a>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>	
</body>
</html>

