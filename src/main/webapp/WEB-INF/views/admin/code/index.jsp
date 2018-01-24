<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<div class="title-search-block">
	<div class="title-block">
		<div class="row">
			<div class="col-md-6">
				<h3 class="title">코드그룹
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
				<h3 class="title">코드그룹</h3>
			</div>
			<div class="table-responsive">
				<table class="table table-sm table-striped table-bordered">
					<thead>
						<tr>
							<th class="fit"></th>
							<th>코드그룹ID</th>
							<th>코드그룹명</th>
							<th>코드그룹설명</th>
							<th>등록자</th>
							<th>등록일시</th>
							<th>수정자</th>
							<th>수정일시</th>
							<th class="fit"></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
</section>
<section class="section">
	<div class="card">
		<div class="card-block table-responsive">
			<div class="card-title-block">
				 <h3 class="title">공통코드</h3>
			</div>
		</div>
	</div>
</section>

<div class="modal fade" id="modal-addEdit">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">코드그룹 추가</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
				<div class="modal-body">
					<div class="form-group row">
						<div class="col-sm-4">
							<label for="codegroupId">코드그룹ID</label>
						</div>
						<div class="col-sm-8">
							<input type="text" class="form-control text-uppercase" id="codegroupId"
								name="codegroupId" placeholder="코드그룹ID">
							<input type="hidden" name="old_codegroupId">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-4">
							<label for="codegroupName">코드그룹명</label>
						</div>
						<div class="col-sm-8">
							<input type="text" class="form-control"	id="codegroupName"
								name="codegroupName" placeholder="코드그룹명">
						</div>
					</div>
					<div class="form-group">
						<label for="codegroupDesc">코드그룹설명</label>
						<textarea rows="3" class="form-control" id="codegroupDesc"
							name="codegroupDesc" placeholder="코드그룹설명"></textarea>
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
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">코드그룹 삭제</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
				<input type="hidden" name="codegroupId">
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
			<td class="codegroupId" data-old="{{codegroupId}}">{{codegroupId}}</td>
			<td class="codegroupName">{{codegroupName}}</td>
			<td class="codegroupDesc">{{codegroupDesc}}</td>
			<td>{{regUserId}}</td>
			<td>{{formatDate regDate}}</td>
			<td>{{updateUserId}}</td>
			<td>{{formatDate updateDate}}</td>
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
	(getCode = function() {
		$.getJSON('/api/codegroups', function(result) {
			replaceData(result, $('tbody'), $('#template'));
			$('#modal-addEdit').modal('hide');
			$('#modal-delete').modal('hide');
		});
	})();
	
	let $codegroupId = $('#modal-addEdit input[name=codegroupId]');
	let $old_codegroupId = $('#modal-addEdit input[name=old_codegroupId]');
	let $codegroupName = $('#modal-addEdit input[name=codegroupName]');
	let $codegroupDesc = $('#modal-addEdit textarea[name=codegroupDesc]');
	
	$('#modal-addEdit form').submit(function(event) {
		event.preventDefault();
		
		$.ajax({
			type: $(this).attr('method'),
			url: "/api/codegroups",
			headers: {
				"Content-Type": "application/json"
			},
			data: JSON.stringify({
				codegroupId: $codegroupId.val(),
				old_codegroupId: $old_codegroupId.val(),
				codegroupName: $codegroupName.val(),
				codegroupDesc: $codegroupDesc.val()
			}),
			success: function(msg) {
				alert(msg);
				getCode();
			},
			error: function(msg) {
				alert(msg);
				$codegroupId.focus();
			},
			complete: function() {
				$codegroupId.val('');
				$codegroupName.val('');
				$codegroupDesc.val('');
			}
		});
	});
	
	$('#modal-delete form').submit(function(event) {
		event.preventDefault();
		console.log($('#modal-delete input[name=codegroupId]').val());
		
		$.ajax({
			type: "DELETE",
			url: "/api/codegroups",
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "DELETE"
			},
			data: JSON.stringify({
				codegroupId: $('#modal-delete input[name=codegroupId]').val()
			}),
			success: function(msg) {
				alert(msg);
				getCode();
			},
			error: function(msg) {
				alert(msg);
			}
		});
	});
	
	$('#btn-add').on('click', function() {
		initModal($('#modal-addEdit'));
		
		$('#modal-addEdit .modal-title').html('코드그룹 추가');
		$('#modal-addEdit form').attr('method', 'post');
	});
	
	$('tbody').on('click', '.btn-edit', function() {
		$('#modal-addEdit .modal-title').html('코드그룹 수정');
		$('#modal-addEdit form').attr('method', 'put');
		
		let $tr = $(this).closest('tr');
		
		let codegroupId = $tr.children('.codegroupId').html();
		let old_codegroupId = $tr.children('.codegroupId').data('old');
		let codegroupName = $tr.children('.codegroupName').html();
		let codegroupDesc = $tr.children('.codegroupDesc').html();
		
		$codegroupId.val(codegroupId);
		$old_codegroupId.val(codegroupId);
		$codegroupName.val(codegroupName);
		$codegroupDesc.val(codegroupDesc);
	});
	
	$('tbody').on('click', '.btn-remove', function() {
		let codegroupId = $(this).closest('tr').children('.codegroupId').html();
		$('#modal-delete input[name=codegroupId]').val(codegroupId);
	});
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>