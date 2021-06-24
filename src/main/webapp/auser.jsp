<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>

<html>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <head><title>사용자 등록</title></head>
    <body>
        <h2 align="center">사용자 등록</h2>
        <c:catch var="exception">
            <sql:update dataSource="jdbc/mydb" var="updatedTable">
            INSERT INTO user (uid, uname, upasswd) VALUES(?,?,?)
            <sql:param value="${param.uid}" />
            <sql:param value="${param.uname}" />
            <sql:param value="${param.upasswd}" />
            </sql:update>
            <c:if test="${updatedTable >= 1}">
                <script type="text/javascript">
                    alert("${param.uname} 사용자가 성공적으로 등록되었습니다.");
                </script>
                <div align="center">
                ${param.uname} 사용자가 성공적으로 등록되었습니다.
                <a href="ilogin.jsp"><button class="btn btn-primay" type="button">로그인 페이지</button></a>
                </div>
            </c:if>
        </c:catch>
        <c:if test="${exception!=null}" >
            <script type="text/javascript">
            alert(" ID ${param.uid}의 사용자 등록이 실패하였습니다."); 
            </script>
            <div align="center">
            ID ${param.uid}의 사용자 등록이 실패하였습니다.
            <a href="ilogin.jsp"><button class="btn btn-primay" type="button">로그인 페이지</button></a>
            </div>
        </c:if>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    	<script src="js/bootstrap.js"></script>
    </body>
</html>