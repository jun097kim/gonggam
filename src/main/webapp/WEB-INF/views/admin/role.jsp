<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<div class="title-block">
	<h3 class="title">접근권한 관리</h3>
</div>
<section>
	<div class="card">
		<div class="card-block">
			<div class="card-title-block">
				<h3 class="title">URL
					<a href="#" class="btn btn-primary btn-sm rounded" id="btn-add"
						data-toggle="modal" data-target="#modal-addEdit">추가</a>
				</h3>
				<p class="title-description">
					특정 그룹만 접근 가능한 URL
				</p>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th class="fit"></th>
						<th>URL</th>
						<th>접근가능 그룹</th>
						<th class="fit"></th>
					</tr>
				</thead>
				<tbody id="urlTable"></tbody>
			</table>
		</div>
	</div>
</section>

<div class="modal fade" id="modal-addEdit">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">URL 추가</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
				<div class="modal-body">
					<div class="form-group row">
						<div class="col-sm-4">
							<label for="url">URL</label>
						</div>
						<div class="col-sm-8">
							<div class="input-group">
								<span class="input-group-addon">gonggam.jun0.kim</span>
								<input type="text" class="form-control" id="url" name="url" placeholder="/admin/resources">
							</div>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-4">
							<label>접근가능 그룹</label>
						</div>
						<div class="col-sm-8">
							<c:forEach var="group" items="${groups}">
								<label>
									<input class="checkbox" type="checkbox" name="groupName" value="${group.groupName}">
									<span>${group.groupName}</span>
								</label>
							</c:forEach>
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
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">URL 삭제</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
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

<script id="template-url" type="text/x-handlebars-template">
	{{#each .}}
		<tr>
			<th>{{oneBased @index}}</th>
			<td>{{url}}</td>
			<td>
				{{#each groupName}}
					<span class="badge badge-pill badge-primary">{{.}}</span>
				{{/each}}
			</td>
			<td>
				<div class="btn-group">
					<button type="button" class="btn btn-secondary btn-sm rounded">수정</button>
					<button type="button" class="btn-remove btn btn-secondary btn-sm rounded">삭제</button>
				</div>
			</td>
		</tr>
	{{/each}}
</script>

<script>
	(listUrl = function() {
		$.getJSON("/api/roles", function(list) {
			replaceData(list, $('#urlTable'), $('#template-url'));
			$('#modal-addEdit').modal('hide');
			$('#modal-delete').modal('hide');
		});
	})();
	
	const $url = $('input[name=url]');
	const $groupName = $('input[name=groupName]');
	
	$('#modal-addEdit form').submit(function(event) {
		event.preventDefault();
		
		const groupNameArr = [];
		$('input[name=groupName]:checked').each(function() {
			groupNameArr.push($(this).val());
		});

		if (mode == 'ADD') {
			$.ajax({
				type: "POST",
				url: "/api/roles",
				headers: {
					"Content-Type": "application/json"
				},
				data: JSON.stringify({
					url: $url.val(),
					groupName: groupNameArr
				}),
				dataType: "text",
				success: function(xhr) {
					listUrl();
				},
				complete: function(xhr) {
					alert(xhr.responseText);
				}
			});
			
		} else if (mode == 'MOD') {
			$.ajax({
				type: "PUT",
				url: "/api/roles",
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "PUT"
				},
				data: JSON.stringify({
					url: $url.val(),
					old_url: old_url,
					groupName: groupNameArr
				}),
				dataType: "text",
				success: function(list) {
					listUrl(list);
				},
				complete: function(xhr) {
					alert(xhr.responseText);
				}
			});
		}
	});
	
	let mode;
	
	$('#btn-add').on('click', function() {
		mode = 'ADD';
		document.querySelector('#modal-addEdit form').reset();
		$('#modal-addEdit .modal-title').html('URL 추가');
	});
	
	let old_url;
	
	$('#urlTable').on('click', 'tr', function() {
		mode = 'MOD';
		document.querySelector('#modal-addEdit form').reset();
		$('#modal-addEdit .modal-title').html('URL 수정');

		const tds = $(this).children('td');
		
		old_url = tds[0].innerHTML;
		const groupName = tds.eq(1).children('span');
		groupName.each(function() {
			$('input[value=' + $(this).text() + ']').prop('checked', true);
		});

		$url.val(old_url);
		$('#modal-addEdit').modal('show');
	});

	$('#urlTable').on('click', '.btn-remove', function(event) {
		event.stopPropagation();
		old_url = $(this).closest('tr').children('td')[0].innerHTML;
		$('#modal-delete').modal('show');
	});
	
	$('#modal-delete form').submit(function(event) {
		event.preventDefault();
		
		$.ajax({
			type: "DELETE",
			url: "/api/roles",
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "DELETE"
			},
			data: JSON.stringify({
				old_url: old_url
			}),
			dataType: "text",
			success: function(list) {
				listUrl(list);
			},
			complete: function(xhr) {
				alert(xhr.responseText);
			}
		});
	});
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>