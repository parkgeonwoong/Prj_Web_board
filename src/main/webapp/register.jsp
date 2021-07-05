<%@ page contentType="text/html;charset=utf-8" %>
<html>
    <head><title>사용자 등록</title></head>
    <link rel="stylesheet" href="style_login.css">
    <body>
        <div id="wrap" class="main">
		<div id="container" class="container">
			<div id="content" class="content">
				<div class="sub-left"></div>
				<div class="sub-right">
					<h3>회원가입</h3>
					<div class="login">
						<div class="wrapper">

							<form name="loginpage" id="loginpage" method='post' action='auser.jsp'>
								<div class="loginbox">
									<div class="loginInput">
										<input type="text" name="uid" class="userid"
											placeholder="아이디">  <input type='text' name='uname' placeholder="이름"> 
											<input type="password"
											name="upasswd" class="passwd" placeholder="비밀번호">
									</div>
									<div class="loginSubmit">
										<input type="submit" value="회원가입" class="submit">
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
        
        
        
        
    </body>
</html>