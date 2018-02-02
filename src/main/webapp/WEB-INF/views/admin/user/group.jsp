<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<div class="title-search-block">
	<div class="title-block">
		<div class="row">
			<div class="col-md-6">
				<h3 class="title">그룹
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
				<h3 class="title">그룹</h3>
			</div>
			<div class="table-responsive">
				<table class="table table-sm table-striped table-bordered">
					<thead>
						<tr>
							<th class="fit"></th>
							<th>그룹ID</th>
							<th>그룹명</th>
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
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">그룹 추가</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
				<input type="hidden" name="groupNo">
				<div class="modal-body">
					<div class="form-group row">
						<div class="col-sm-3">
							<label for="groupId">그룹ID</label>
						</div>
						<div class="col-sm-9">
							<div class="input-group">
								<span class="input-group-addon">GRP_</span>
								<input type="text" class="form-control text-uppercase"
									id="groupId" name="groupId" placeholder="그룹ID">
							</div>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-3">
							<label for="groupName">그룹명</label>
						</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								id="groupName" name="groupName" placeholder="그룹명">
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
				<h4 class="modal-title">그룹 삭제</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
				<input type="hidden" name="groupNo">
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
		<tr data-no="{{groupNo}}">
			<th>{{oneBased @index}}</th>
			<td class="groupId">{{groupId}}</td>
			<td class="groupName">{{groupName}}</td>
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
	(getGroup = function() {
		$.getJSON('/api/groups', function(result) {
			replaceData(result, $('tbody'), $('#template'));
			$('#modal-addEdit').modal('hide');
			$('#modal-delete').modal('hide');
		});
	})();

	const $groupNo = $('#modal-addEdit input[name=groupNo]');
	const $groupId = $('#modal-addEdit input[name=groupId]');
	const $groupName = $('#modal-addEdit input[name=groupName]');
	
	$('#modal-addEdit form').submit(function(event) {
		event.preventDefault();
		
		$.ajax({
			type: $(this).attr('method'),
			url: "/api/groups",
			headers: {
				"Content-Type": "application/json"
			},
			data: JSON.stringify({
				groupNo: $groupNo.val(),
				groupId: "GRP_" + $groupId.val(),
				groupName: $groupName.val()
			}),
			dataType: "text",
			success: function(msg) {
				alert(msg);
				getGroup();
			},
			error: function(xhr) {
				alert(xhr.responseText);
				$groupId.focus();
			}
		});
	});
	
	$('#modal-delete form').submit(function(event) {
		event.preventDefault();
		
		$.ajax({
			type: "DELETE",
			url: "/api/groups",
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "DELETE"
			},
			data: JSON.stringify({
				groupNo: $('#modal-delete input[name=groupNo]').val()
			}),
			dataType: "text",
			success: function(msg) {
				alert(msg);
				getGroup();
			},
			error: function(xhr) {
				alert(xhr.responseText);
			}
		});
	});
	
	$('#btn-add').on('click', function() {
		document.querySelector('#modal-addEdit form').reset();
		
		$('#modal-addEdit .modal-title').html('그룹 추가');
		$('#modal-addEdit form').attr('method', 'post');
	});
	
	$('tbody').on('click', '.btn-edit', function(event) {
		$('#modal-addEdit .modal-title').html('그룹 수정');
		$('#modal-addEdit form').attr('method', 'put');
		
		const $tr = $(this).closest('tr');
		
		const groupNo = $tr.data('no');
		const groupId = $tr.children('.groupId').html().replace('GRP_', '');
		const groupName = $tr.children('.groupName').html();
		
		$groupNo.val(groupNo);
		$groupId.val(groupId);
		$groupName.val(groupName);
	});
	
	$('tbody').on('click', '.btn-remove', function() {
		const groupNo = $(this).closest('tr').data('no');
		$('#modal-delete input[name=groupNo]').val(groupNo);
	});
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>