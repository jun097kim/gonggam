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
					<a href="#" class="btn btn-primary btn-sm rounded-s" data-toggle="modal" data-target="#modal-user-add-edit">추가</a>
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
	<div class="card table-responsive">
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
</section>

<div class="modal fade" id="modal-user-add-edit">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">사용자 추가</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group row">
						<div class="col-sm-3">
							<label for="userid">아이디</label>
						</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								id="userid" name="userid" placeholder="아이디">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-3">
							<label for="userpw">비밀번호</label>
						</div>
						<div class="col-sm-9">
							<input type="password" class="form-control"
								id="userpw" name="userpw" placeholder="비밀번호">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-3">
							<label for="username">이름</label>
						</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								id="username" name="username" placeholder="이름">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="btn-ok">확인</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /#modal-user-add-edit -->

<div class="modal fade" id="modal-user-delete">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">사용자 삭제</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>정말 삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btn-ok">확인</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /#modal-user-delete -->

<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<tr>
			<th>{{oneBased @index}}</th>
			<td>{{userId}}</td>
			<td>{{userName}}</td>
			<td>{{formatDate regDate}}</td>
			<td>
				<div class="btn-group">
					<button type="button" class="btn btn-secondary btn-sm" id="btn-edit"
						data-toggle="modal" data-target="#modal-user-add-edit">수정</button>
					<button type="button" class="btn btn-secondary btn-sm"
						data-toggle="modal" data-target="#modal-user-delete">삭제</button>
				</div>
			</td>
		</tr>
	{{/each}}
</script>

<script>
	(getUser = function() {
		$.getJSON('/api/users', function(result) {
			replaceData(result, $('tbody'), $('#template'));
			$('#modal-user-add-edit').modal('hide');
		});
	})();
	
	$('#btn-ok').on('click', function() {
		let $userid = $('input[name=userid]');
		let $userpw = $('input[name=userpw]');
		let $username = $('input[name=username]');
		
		$.ajax({
			type: "post",
			url: "/api/users",
			data: JSON.stringify({
				userid: $userid.val(),
				userpw: $userpw.val(),
				username: $username.val()
			}),
			headers: {
				"Content-Type": "application/json"
			},
			success: function(result) {
				alert('사용자가 성공적으로 등록되었습니다.');
				getUser();
			},
			error: function() {
				alert('사용자 등록에 실패하였습니다.');
				$userid.focus();
			},
			complete: function() {
				$userid.val('');
				$userpw.val('');
				$username.val('');
			}
		});
	});
	
	$('#btn-edit').on('click', function() {
		$('#modal-user-add-edit .modal-title').html('사용자 수정');
	});
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>