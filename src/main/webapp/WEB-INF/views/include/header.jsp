<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="ko">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Gonggam</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- ModularAdmin -->
	<link rel="stylesheet" href="/css/vendor.css">
	<link rel="stylesheet" href="/css/app.css">
	<script src="/js/vendor.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	
	<!-- Gonggam -->
	<link rel="stylesheet" href="/css/gonggam.css">
	<script src="/js/gonggam.js"></script>
	
	<link rel="stylesheet" href="/dist/themes/proton/style.min.css" />
</head>

<body>
	<div class="main-wrapper">
		<div class="app" id="app">
			<header class="header">
				<div class="header-block header-block-collapse d-lg-none d-xl-none">
					<button class="collapse-btn" id="sidebar-collapse-btn">
						<i class="fa fa-bars"></i>
					</button>
				</div>
				<div class="header-block header-block-nav">
					<ul class="nav-profile">
						<li class="profile dropdown">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
								<span class="name">${login.userId}</span>
							</a>
							<div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
								<a class="dropdown-item" href="/auth/logout">
									<i class="fa fa-power-off icon"></i> 로그아웃</a>
							</div>
						</li>
					</ul>
				</div>
			</header>
			<aside class="sidebar">
				<div class="sidebar-container">
					<div class="sidebar-header">
						<div class="brand">
							<div class="logo">
								<span class="l l1"></span>
								<span class="l l2"></span>
								<span class="l l3"></span>
								<span class="l l4"></span>
								<span class="l l5"></span>
							</div> Gonggam Admin</div>
					</div>
					<nav class="menu">
						<ul class="sidebar-menu metismenu" id="sidebar-menu">
							<li class="open">
								<a href="">
									<i class="fa fa-user"></i> 사용자
									<i class="fa arrow"></i>
								</a>
								<ul class="sidebar-nav">
									<li>
										<a href="/admin/user">모든 사용자</a>
									</li>
									<li>
										<a href="/admin/user/group">그룹</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="">
									<i class="fa fa-plug"></i> 공통코드
									<i class="fa arrow"></i>
								</a>
								<ul class="sidebar-nav">
									<li>
										<a href="/admin/code"> 모든 공통코드</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="">
									<i class="fa fa-sitemap"></i> 메뉴
									<i class="fa arrow"></i>
								</a>
								<ul class="sidebar-nav">
									<li>
										<a href="/admin/menu"> 모든 메뉴</a>
									</li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</aside>
			<div class="sidebar-overlay" id="sidebar-overlay"></div>
			<div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
			<div class="mobile-menu-handle"></div>
			<article class="content items-list-page">