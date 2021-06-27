<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script language="javascript">
	// 자바 스크립트 시작

	function writeCheck() {
		var form = document.writeform;

		if (!form.writer.value) // form 에 있는 name 값이 없을 때
		{
			alert("이름을 적어주세요"); // 경고창 띄움
			form.writer.focus(); // form 에 있는 name 위치로 이동
			return;
		}
		if (!form.title.value) {
			alert("제목을 적어주세요");
			form.title.focus();
			return;
		}
		if (!form.memo.value) {
			alert("내용을 적어주세요");
			form.memo.focus();
			return;
		}

		form.submit();
	}
</script>

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
    	    	<a class="sub7_tab" href="#" style="display: inline-block;">소개</a>
    	    	<a class="sub7_tab check" href="./first.jsp?page=1" style="display: inline-block;">공지사항</a>
    	    	<a class="sub7_tab" href="#" style="display: inline-block;">서식</a>
    	    	<a class="sub7_tab" href="#" style="display: inline-block;">성과</a>
    	    </div>	


	<table>
		<form name=writeform method="post" action="write_ok.jsp" enctype="multipart/form-data">
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr
						style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
						<td width="5"><img src="img/table_left.gif" width="5"
							height="30" /></td>
						<td>글쓰기</td>
						<td width="5"><img src="img/table_right.gif" width="5"
							height="30" /></td>
					</tr>
				</table>
				<div class="container">
     			 <table class="table">
				
					<tr>
						<td>&nbsp;</td>
						<td align="center">제목</td>
						<td><input name="title" size="50" maxlength="100"></td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td align="center">이름</td>
						<td><input name="writer" size="50" maxlength="50"></td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td align="center">내용</td>
						<td><textarea name="memo" cols="50" rows="13"></textarea></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center">첨부파일</td>
						<td><input type="file" name=file></td>
						<td>&nbsp;</td>
					</tr>
					
	sdnd0614
	
					<tr align="center">
						<td>&nbsp;</td>
						<td colspan="2"><input type=button value="등록"
							OnClick="javascript:writeCheck();"> <input type=button
							value="취소" OnClick="javascript:history.back(-1)">
						<td>&nbsp;</td>
					</tr>
				</table>
				</div>
			</td>
		</tr>
		</form>
	</table>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>