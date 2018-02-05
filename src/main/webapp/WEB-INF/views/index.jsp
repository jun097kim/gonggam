<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<title>Gonggam</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<style>
		body {
			display: flex;
			flex-direction: column;
			height: 100vh;
		}
		.navbar-brand {
			font-weight: 300;
		}
		
		header .menu h5 {
			color: #fff;
		}
		footer .menu h5 {
			color: #000;
		}
		.menu a {
			color: inherit;
		}
		
		.jumbotron {
			margin-bottom: 0;
			background-color: #fff;
		}
		.jumbotron p:last-child {
			margin-bottom: 0;
		}
		.jumbotron-heading {
			font-weight: 300;
		}
		
		main {
			flex: 1;
		}
		
		footer {
			width: 100%;
			padding: 3rem 0;
		}
		footer p {
			margin-bottom: .25rem;
	    }
	</style>
</head>

<body class="bg-light">
	<header>
		<nav class="navbar navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="#">Gonggam</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</nav>
		<div class="collapse" id="navbarToggleExternalContent">
			<div class="bg-dark">
				<div class="container">
					<div class="menu row text-white"></div>
				</div>
			</div>
		</div>
	</header>
	
	<main>
		<section class="jumbotron text-center">
			<div class="container">
				<h1 class="jumbotron-heading">사용자 페이지</h1>
				<p class="lead text-muted">views/index.jsp</p>
			</div>
		</section>
		<article>
			<div class="container"></div>
		</article>
	</main>
	
	<footer class="bg-white text-muted">
		<div class="container">
			<div class="menu row">
			</div>
			<p>&copy; Gonggam</p>
		</div>
	</footer>
	
	<script id="template-menu" type="text/x-handlebars-template">
		{{#each .}}
			<div class="col">
				<h5>{{name}}</h5>
				<ul class="list-unstyled">
					{{#each children}}
						<li>
							<a href="{{url}}">{{name}}</a>
						</li>
					{{/each}}
				</ul>
			</div>
		{{/each}}
	</script>
	
	<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
	<script src="/js/gonggam.js"></script>
	
	<script>
		const menuArr = [];
		const Menu = function (name, url) {
			this.name = name;
			this.url = url;
			this.children = [];
		}
		
		$.ajax({
			type: "GET",
			url: "/api/public/menus",
			dataType: "xml",
			success: function(xml) {
				$(xml).find('rootMenu > item').each(function() {
					console.log('--' + $(this).attr('name'));
					const parent = new Menu($(this).attr('name'));
					
					$(this).children('subMenu').children('item').each(function() {
						console.log('----' + $(this).attr('name'));
						const child = new Menu(
							$(this).attr('name'),
							$(this).attr('url')
						);
						parent.children.push(child);
					});
					menuArr.push(parent);
				});
				replaceData(menuArr, $('.menu'), $('#template-menu'));
			}
		});
	</script>
</body>

</html>
