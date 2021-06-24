<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>

<html>
    <body>
        <c:catch var="exception">
        <sql:update dataSource="jdbc/mydb" var="updatedTable">
            INSERT INTO form1(num, title, memo, writer, date, hit, file_name, file1, file2) VALUES(?,?,?,?,?,?,?,?,?)
            <sql:param value="${param.num}"/>
            <sql:param value="${param.title}"/>
            <sql:param value="${param.memo}"/>
            <sql:param value="${param.writer}"/>
            <sql:param value="${param.date}"/>
            <sql:param value="${param.hit}"/>
            <sql:param value="${param.file_name}"/>
            <sql:param value="${param.file1}"/>
            <sql:param value="${param.file2}"/>        
        </sql:update>

        <c:if test="${updatedTable >= 1}">
            
            <script>
                alert("${param.title}의 등록이 성공적으로 되었습니다.");
                location.href=("./outcome.jsp");
            </script>
        </c:if>

        

        </c:catch>
    </body>
</html>