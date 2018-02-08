<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="ko">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Gonggam</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/css/vendor.css">
	<link rel="stylesheet" href="/css/app.css">
</head>

<body>

	<div class="auth">
		<div class="auth-container">
			<div class="card">
				<header class="auth-header">
					<h1 class="auth-title">
						<div class="logo">
							<span class="l l1"></span>
							<span class="l l2"></span>
							<span class="l l3"></span>
							<span class="l l4"></span>
							<span class="l l5"></span>
						</div> Gonggam</h1>
				</header>
				<div class="auth-content">
					<form id="login-form" method="POST">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<div class="form-group">
							<label for="username">아이디</label>
							<input type="text" class="form-control underlined" name="username" placeholder="아이디" required> </div>
						<div class="form-group">
							<label for="password">비밀번호</label>
							<input type="password" class="form-control underlined" name="password" placeholder="비밀번호" required> </div>
						<div class="form-group">
							<button type="submit" class="btn btn-block btn-primary" id="loginBtn">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="/js/vendor.js"></script>
	<script src="/js/app.js"></script>
</body>

</html>