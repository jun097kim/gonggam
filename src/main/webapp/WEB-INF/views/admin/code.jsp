<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<div class="title-block">
	<h3 class="title">공통코드 관리</h3>
</div>
<section class="section">
	<div class="card">
		<div class="card-block">
			<div class="card-title-block">
				<h3 class="title">코드그룹
					<a href="#" class="btn btn-primary btn-sm rounded" id="btn-add-codegroup"
						data-toggle="modal" data-target="#modal-addEdit-codegroup">추가</a>
				</h3>
			</div>
			<div class="table-responsive">
				<table class="table table-striped table-hover" id="table-codegroup">
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
				 <h3 class="title">공통코드
 					<a href="#" class="btn btn-primary btn-sm rounded" id="btn-add-code"
						data-toggle="modal" data-target="#modal-addEdit-code">추가</a>
				 </h3>
				 <p class="title-description"></p>
			</div>
			<div class="table-responsive">
				<table class="table table-striped" id="table-code">
					<thead>
						<tr>
							<th class="fit"></th>
							<th>코드ID</th>
							<th>코드명</th>
							<th>코드설명</th>
							<th>정렬순서</th>
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

<div class="modal fade" id="modal-addEdit-codegroup">
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
<!-- /#modal-addEdit-codegroup -->

<div class="modal fade" id="modal-delete-codegroup">
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
<!-- /#modal-delete-codegroup -->

<div class="modal fade" id="modal-addEdit-code">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">공통코드 추가</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
				<div class="modal-body">
					<div class="form-group row">
						<div class="col-sm-4">
							<label for="codeId">코드ID</label>
						</div>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="codeId"
								name="codeId" placeholder="코드ID">
							<input type="hidden" name="old_codeId">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-4">
							<label for="codeName">코드명</label>
						</div>
						<div class="col-sm-8">
							<input type="text" class="form-control"	id="codeName"
								name="codeName" placeholder="코드명">
						</div>
					</div>
					<div class="form-group">
						<label for="codeDesc">코드설명</label>
						<textarea rows="3" class="form-control" id="codeDesc"
							name="codeDesc" placeholder="코드설명"></textarea>
					</div>
					<div class="form-group row">
						<div class="col-sm-4">
							<label for="sortNo">정렬순서</label>
						</div>
						<div class="col-sm-8">
							<input type="number" class="form-control" id="sortNo"
								name="sortNo" placeholder="정렬순서">
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
<!-- /#modal-addEdit-code -->

<div class="modal fade" id="modal-delete-code">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">공통코드 삭제</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
				<input type="hidden" name="codeId">
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
<!-- /#modal-delete-code -->

<script id="template-codegroup" type="text/x-handlebars-template">
	{{#each .}}
		<tr>
			<th>{{oneBased @index}}</th>
			<td class="codegroupId">{{codegroupId}}</td>
			<td class="codegroupName">{{codegroupName}}</td>
			<td class="codegroupDesc">{{codegroupDesc}}</td>
			<td>{{regUserId}}</td>
			<td>{{formatDate regDate}}</td>
			<td>{{updateUserId}}</td>
			<td>{{formatDate updateDate}}</td>
			<td>
				<div class="btn-group">
					<button type="button" class="btn-edit-codegroup btn btn-secondary btn-sm rounded"
						data-toggle="modal" data-target="#modal-addEdit-codegroup">수정</button>
					<button type="button" class="btn-remove-codegroup btn btn-secondary btn-sm rounded"
						data-toggle="modal" data-target="#modal-delete-codegroup">삭제</button>
				</div>
			</td>
		</tr>
	{{else}}
		<tr>
			<td colspan="10">등록된 코드그룹이 없습니다.</td>
		</tr>
	{{/each}}
</script>

<script id="template-code" type="text/x-handlebars-template">
	{{#each .}}
		<tr>
			<th>{{oneBased @index}}</th>
			<td class="codeId">{{codeId}}</td>
			<td class="codeName">{{codeName}}</td>
			<td class="codeDesc">{{codeDesc}}</td>
			<td class="sortNo">{{sortNo}}</td>
			<td>{{regUserId}}</td>
			<td>{{formatDate regDate}}</td>
			<td>{{updateUserId}}</td>
			<td>{{formatDate updateDate}}</td>
			<td>
				<div class="btn-group">
					<button type="button" class="btn-edit-code btn btn-secondary btn-sm rounded"
						data-toggle="modal" data-target="#modal-addEdit-code">수정</button>
					<button type="button" class="btn-remove-code btn btn-secondary btn-sm rounded"
						data-toggle="modal" data-target="#modal-delete-code">삭제</button>
				</div>
			</td>
		</tr>
	{{else}}
		<tr>
			<td colspan="10">등록된 공통코드가 없습니다.</td>
		</tr>
	{{/each}}
</script>

<script>
	/* 코드그룹
	-------------------------------------------- */
	
	(getCodegroup = function() {
		$.getJSON('/api/codegroups', function(result) {
			replaceData(result, $('#table-codegroup tbody'), $('#template-codegroup'));
			
			// 공통코드 초기 데이터 설정을 위해 첫 번째 코드그룹 클릭 
			$('#table-codegroup tbody tr').eq(0).click();
			
			$('#modal-addEdit-codegroup').modal('hide');
			$('#modal-delete-codegroup').modal('hide');
		});
	})();
	
	const $codegroupId = $('#modal-addEdit-codegroup input[name=codegroupId]');
	const $old_codegroupId = $('#modal-addEdit-codegroup input[name=old_codegroupId]');
	const $codegroupName = $('#modal-addEdit-codegroup input[name=codegroupName]');
	const $codegroupDesc = $('#modal-addEdit-codegroup textarea[name=codegroupDesc]');
	
	$('#modal-addEdit-codegroup form').submit(function(event) {
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
			dataType: "text",
			success: function(msg) {
				alert(msg);
				getCodegroup();
			},
			error: function(xhr) {
				alert(xhr.responseText);
			}
		});
	});
	
	$('#modal-delete-codegroup form').submit(function(event) {
		event.preventDefault();
		
		$.ajax({
			type: "DELETE",
			url: "/api/codegroups",
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "DELETE"
			},
			data: JSON.stringify({
				codegroupId: $('#modal-delete-codegroup input[name=codegroupId]').val()
			}),
			dataType: "text",
			success: function(msg) {
				alert(msg);
				getCodegroup();
			},
			error: function(xhr) {
				alert(xhr.responseText);
				$('#modal-delete-codegroup').modal('hide');
			}
		});
	});
	
	$('#btn-add-codegroup').on('click', function() {
		document.querySelector('#modal-addEdit-codegroup form').reset();
		
		$('#modal-addEdit-codegroup .modal-title').html('코드그룹 추가');
		$('#modal-addEdit-codegroup form').attr('method', 'post');
	});
	
	$('tbody').on('click', '.btn-edit-codegroup', function() {
		$('#modal-addEdit-codegroup .modal-title').html('코드그룹 수정');
		$('#modal-addEdit-codegroup form').attr('method', 'put');
		
		const $tr = $(this).closest('tr');
		
		const codegroupId = $tr.children('.codegroupId').html();
		const old_codegroupId = $tr.children('.codegroupId').html();
		const codegroupName = $tr.children('.codegroupName').html();
		const codegroupDesc = $tr.children('.codegroupDesc').html();
		
		$codegroupId.val(codegroupId);
		$old_codegroupId.val(codegroupId);
		$codegroupName.val(codegroupName);
		$codegroupDesc.val(codegroupDesc);
	});
	
	$('tbody').on('click', '.btn-remove-codegroup', function() {
		const codegroupId = $(this).closest('tr').children('.codegroupId').html();
		$('#modal-delete-codegroup input[name=codegroupId]').val(codegroupId);
	});
	
	let codegroupId;
	$('#table-codegroup > tbody').on('click', 'tr', function(event) {
		if (!$(event.target).is('.btn-edit-codegroup, .btn-remove-codegroup')) {
			codegroupId = $(this).children('.codegroupId').html();
			$('.title-description').html(codegroupId);
			getCode();
		}
	});
	
	/* 공통코드
	----------------------------------------- */
	
	const getCode = function() {
		$.ajax({
			type: "GET",
			url: "/api/codes",
			data: {
				codegroupId: codegroupId
			},
			success: function(result) {
				replaceData(result, $('#table-code tbody'), $('#template-code'));
				$('#modal-addEdit-code').modal('hide');
				$('#modal-delete-code').modal('hide');
			}
		});
	}
	
	const $codeId = $('#modal-addEdit-code input[name=codeId]');
	const $old_codeId = $('#modal-addEdit-code input[name=old_codeId]');
	const $codeName = $('#modal-addEdit-code input[name=codeName]');
	const $codeDesc = $('#modal-addEdit-code textarea[name=codeDesc]');
	const $sortNo = $('#modal-addEdit-code input[name=sortNo]');
	
	$('#modal-addEdit-code form').submit(function(event) {
		event.preventDefault();
		
		$.ajax({
			type: $(this).attr('method'),
			url: "/api/codes",
			headers: {
				"Content-Type" : "application/json"
			},
			data: JSON.stringify({
				codegroupId: codegroupId,
				codeId: $codeId.val(),
				old_codeId: $old_codeId.val(),
				codeName: $codeName.val(),
				codeDesc: $codeDesc.val(),
				sortNo: $sortNo.val()
			}),
			dataType: "text",
			success: function() {
				getCode();
			},
			complete: function(xhr) {
				alert(xhr.responseText);
			}
		});
	});
	
	$('#modal-delete-code form').submit(function(event) {
		event.preventDefault();
		
		$.ajax({
			type: "DELETE",
			url: "/api/codes",
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "DELETE"
			},
			data: JSON.stringify({
				codeId: $('#modal-delete-code input[name=codeId]').val()
			}),
			dataType: "text",
			success: function() {
				getCode();
			},
			error: function() {
				$('#modal-delete-code').modal('hide');
			},
			complete: function(xhr) {
				alert(xhr.responseText);
			}
		});
	});
	
	$('#btn-add-code').on('click', function() {
		document.querySelector('#modal-addEdit-code form').reset();
		
		$('#modal-addEdit-code .modal-title').html('공통코드 추가');
		$('#modal-addEdit-code form').attr('method', 'post');
	});
	
	$('tbody').on('click', '.btn-edit-code', function() {
		$('#modal-addEdit-code .modal-title').html('공통코드 수정');
		$('#modal-addEdit-code form').attr('method', 'put');
		
		const $tr = $(this).closest('tr');
		
		const codeId = $tr.children('.codeId').html();
		const codeName = $tr.children('.codeName').html();
		const codeDesc = $tr.children('.codeDesc').html();
		const sortNo = $tr.children('.sortNo').html();
		
		$codeId.val(codeId);
		$old_codeId.val(codeId);
		$codeName.val(codeName);
		$codeDesc.val(codeDesc);
		$sortNo.val(sortNo);
	});
	
	$('tbody').on('click', '.btn-remove-code', function() {
		const codeId = $(this).closest('tr').children('.codeId').html();
		$('#modal-delete-code input[name=codeId]').val(codeId);
	});
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>