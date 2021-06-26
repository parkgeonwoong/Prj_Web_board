<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
request.setCharacterEncoding("utf-8");
%>
<%@ page import="tool.DBConn"%>
<%@ page import="vo.Board"%>


<%
String num = request.getParameter("num");
Board board = DBConn.selectBoard(Long.parseLong(num));

request.setAttribute("board", board);
%>

<sql:query var="rs" dataSource="jdbc/mydb">
  select * from board where num = <%=num%>;
</sql:query>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="style.css" />
<title>게시판</title>
</head>
<body>
	<%-- 카테고리 --%>
	<div class="sub7_tab_menu" style="text-align: center;">
		<a class="sub7_tab" href="introduce.jsp" style="display: inline-block;">소개</a> <a
			class="sub7_tab check" href="./first.jsp?page=1"
			style="display: inline-block;">공지사항</a> <a class="sub7_tab" href="#"
			style="display: inline-block;">서식</a> <a class="sub7_tab" href="#"
			style="display: inline-block;">성과</a>
	</div>
	<table>
		<form name=writeform method="post" action="./update.jsp">
		<c:forEach var="row" items="${rs.rows}">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr
							style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
							<td width="5"><img src="img/table_left.gif" width="5"
								height="30" /></td>
							<td>글읽기</td>
							<td width="5"><img src="img/table_right.gif" width="5"
								height="30" /></td>
						</tr>
					</table>
					<div class="container">
						<table class="table">
						<input type = "hidden" name="num" value="${row.num}">
							<tr>
								<td>&nbsp;</td>
								<td align="center">제목</td>
								<td><input name="title" size="50" maxlength="100"
									value="${board.title}"></td>
								<td>&nbsp;</td>
							</tr>

							<tr>
								<td>&nbsp;</td>
								<td align="center">이름</td>
								<td><input name="writer" size="50" maxlength="50"
									value="${board.writer}"></td>
								<td>&nbsp;</td>
							</tr>

							<tr>
								<td>&nbsp;</td>
								<td align="center">내용</td>
								<td><textarea name="memo" cols="50" rows="13">${board.memo}</textarea></td>
								<td>&nbsp;</td>
							</tr>

							<tr>
								<td>&nbsp;</td>
								<td align="center">첨부파일</td>
								<td><a href="file_download.jsp?num=${board.num}">${board.fileName}</a></td>
								<td>&nbsp;</td>
							</tr>


								<table class="table">
								<!-- 삭제하기 버튼 boardread에서 num값이 일치할 경우 -->
									
										<tr>
											<td style="float:left;width:50%;">
											<input type=button value="취소"OnClick="javascript:history.back(-1)">
											</td>
											
											<td style="float:Right;width:50%;"><a href="./delete.jsp?db=boardread&num=${row.num}" onClick="javascript: return confirm('정말 삭제하시겠습니까?');">
													<button class="btn btn-danger" type="button" >삭제</button>
											</a>
											<a href="./update.jsp?db=boardread&num=${row.num}" onClick="javascript: return confirm('수정하시겠습니까?');">
													<button class="btn btn-danger" type="submit">수정</button>
											</a></td>
										</tr>
									
								</table>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			</c:forEach>
		</form>
	</table>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>