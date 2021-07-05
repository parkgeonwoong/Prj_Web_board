<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("UTF-8"); %>

<sql:query dataSource="jdbc/mydb" var="rs">
    select * from board where num = ?
    <sql:param value="${param.num}"/>
</sql:query>


<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.css" />
<title>삭제</title>
</head>
<body>

   <c:catch var = "exception">
    <sql:update dataSource="jdbc/mydb" var="updatedTable">
     update board set title=?, writer=?, memo=?  where num =?
     <sql:param value="${param.title}"/>
     <sql:param value="${param.writer}"/>
     <sql:param value="${param.memo}"/>
     <sql:param value="${param.num}" />
     </sql:update>
     
     <c:if test="${updatedTable >= 1 }">
     	<c:forEach var="row" items="${rs.rows }">
 	<script>
            alert("수정 완료!");
    </script>
    </c:forEach>
    </c:if>
    </c:catch>
	<div align="center">
	<a href="first.jsp"><button class="btn btn--primary type="button">메인 페이지 이동</button></a>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>	
</body>
</html>

