<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<title>로그인</title>
</head>
<link rel="stylesheet" href="style_login.css">
<body>

	<div id="wrap" class="main">
		<div id="container" class="container">
			<div id="content" class="content">
				<div class="sub-left"></div>
				<div class="sub-right">
					<h3>로그인</h3>
					<div class="login">
						<div class="wrapper">

							<form name="loginpage" id="loginpage" method='post'
								action='plogin.jsp'>
								<div class="loginbox">
									<div class="loginInput">
										<input type="text" name="uid" class="userid"
											placeholder="아이디"> <input type="password"
											name="upasswd" class="passwd" placeholder="비밀번호">
									</div>
									<div class="loginSubmit">
										<input type="submit" value="로그인" class="submit">
									</div>
								</div>
							</form>


							<div class="join">
								<p>회원가입을 하시면 다양하고 특별한 혜택이 준비되어 있습니다.</p>
								<a href="register.jsp">회원가입</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>