<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<div class="title-search-block">
	<div class="title-block">
		<div class="row">
			<div class="col-md-6">
				<h3 class="title">사용자
					<a href="#" class="btn btn-primary btn-sm rounded-s" id="btn-add"
						data-toggle="modal" data-target="#modal-addEdit">추가</a>
				</h3>
			</div>
		</div>
	</div>
	<div class="items-search">
		<form class="form-inline">
			<div class="input-group">
				<input type="text" class="form-control boxed rounded-s" placeholder="검색">
				<span class="input-group-btn">
					<button class="btn btn-secondary rounded-s" type="button">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
	</div>
</div>
<section class="section">
	<div class="card">
		<div class="card-block">
			<div class="card-title-block">
				<h3 class="title">사용자</h3>
			</div>
			<div class="table-responsive">
				<table class="table table-sm table-striped table-bordered">
					<thead>
						<tr>
							<th class="fit"></th>
							<th>아이디</th>
							<th>이름</th>
							<th>등록일</th>
							<th class="fit"></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
</section>

<div class="modal fade" id="modal-addEdit">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">사용자 추가</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
				<div class="modal-body">
					<div class="form-group row">
						<div class="col-sm-3">
							<label for="userId">아이디</label>
						</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								id="userId" name="userId" placeholder="아이디">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-3">
							<label for="userPw">비밀번호</label>
						</div>
						<div class="col-sm-9">
							<input type="password" class="form-control"
								id="userPw" name="userPw" placeholder="비밀번호">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-3">
							<label for="userName">이름</label>
						</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								id="userName" name="userName" placeholder="이름">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">확인</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /#modal-addEdit -->

<div class="modal fade" id="modal-delete">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">사용자 삭제</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
				<input type="hidden" name="userId">
				<div class="modal-body">
					<p>정말 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">확인</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /#modal-delete -->

<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<tr>
			<th>{{oneBased @index}}</th>
			<td class="userId">{{userId}}</td>
			<td class="userName">{{userName}}</td>
			<td class="regDate">{{formatDate regDate}}</td>
			<td>
				<div class="btn-group">
					<button type="button" class="btn-edit btn btn-secondary btn-sm"
						data-toggle="modal" data-target="#modal-addEdit">수정</button>
					<button type="button" class="btn-remove btn btn-secondary btn-sm"
						data-toggle="modal" data-target="#modal-delete">삭제</button>
				</div>
			</td>
		</tr>
	{{/each}}
</script>

<script>
	(getUser = function() {
		$.getJSON('/api/users', function(result) {
			replaceData(result, $('tbody'), $('#template'));
			$('#modal-addEdit').modal('hide');
			$('#modal-delete').modal('hide');
		});
	})();
	
	let $userId = $('#modal-addEdit input[name=userId]');
	let $userPw = $('#modal-addEdit input[name=userPw]');
	let $userName = $('#modal-addEdit input[name=userName]');
	
	$('#modal-addEdit form').submit(function(event) {
		event.preventDefault();
		
		$.ajax({
			type: $(this).attr('method'),
			url: "/api/users",
			data: JSON.stringify({
				userId: $userId.val(),
				userPw: $userPw.val(),
				userName: $userName.val()
			}),
			headers: {
				"Content-Type": "application/json"
			},
			success: function(msg) {
				alert(msg);
				getUser();
			},
			error: function(msg) {
				alert(msg);
				$userid.focus();
			}
		});
	});
	
	$('#modal-delete form').submit(function(event) {
		event.preventDefault();
		
		$.ajax({
			type: "DELETE",
			url: "/api/users",
			headers: {
				"Content-Type": "application/json"
			},
			data: JSON.stringify({
				userId: $('#modal-delete input[name=userId]').val()
			}),
			success: function(msg) {
				alert(msg);
				getUser();
			},
			error: function(msg) {
				alert(msg);
				$('#modal-delete').modal('hide');
			}
		});
	});
	
	$('#btn-add').on('click', function() {
		initModal($('#modal-addEdit'));
		
		$('#modal-addEdit .modal-title').html('사용자 추가');
		$('#modal-addEdit input[name=userId]').prop('disabled', false);
		$('#modal-addEdit form').attr('method', 'post');
	});
	
	$('tbody').on('click', '.btn-edit' , function() {
		initModal($('#modal-addEdit'));
		
		$('#modal-addEdit .modal-title').html('사용자 수정');
		$('#modal-addEdit input[name=userId]').prop('disabled', true);
		$('#modal-addEdit form').attr('method', 'put');
		
		let $tr = $(this).closest('tr');
		
		let userId = $tr.children('.userId').html();
		let userName = $tr.children('.userName').html();
		
		$userId.val(userId);
		$userName.val(userName);
	});
	
	$('tbody').on('click', '.btn-remove', function() {
		let userId = $(this).closest('tr').children('.userId').html();
		$('#modal-delete input[name=userId]').val(userId);
	});
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>