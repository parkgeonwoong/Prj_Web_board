<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <% 
	String id = request.getParameter("uid");
 	session.setAttribute("uid", id); 
 %> 
 



<sql:query var="rs" dataSource="jdbc/mydb">
select uname from user where uid=? and upasswd=?
<sql:param value="${param.uid}" />
<sql:param value="${param.upasswd}" />
</sql:query>

<c:forEach var="row"  items="${rs.rows}">
    <c:set var="uname" value="${row.uname}" />
</c:forEach>

<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <title>사용자 로그인</title>
    </head>
    <body>
        <h2 align="center">사용자 로그인</h2>
        <c:choose>
            <c:when test="${uname == null}">
                <script type="text/javascript">
                    alert("사용자이름 혹은 암호가 일치하지 않습니다.");
                  </script>
                  <div align="center">
                  사용자 이름 혹은 암호가 일치하지 않습니다. <a href="ilogin.jsp"><button class="btn btn-primay" type="button">로그인 페이지</button></a>
                  </div>
            </c:when>
            <c:otherwise>
                <script type="text/javascript">
                alert("'${uname}'님 환영합니다.")
                </script>
                <div align="center">
                '${uname}'님 환영합니다.
                <a href="first.jsp"><button class="btn btn-primay" type="button">메인</button></a>
                <a href="logout.jsp"><button class="btn btn-primay" type="button">로그아웃</button></a>
                </div>
            </c:otherwise>
        </c:choose>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    </body>
</html>