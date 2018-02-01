<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<div class="title-search-block">
	<div class="title-block">
		<div class="row">
			<div class="col-md-6">
				<h3 class="title">메뉴</h3>
			</div>
		</div>
	</div>
</div>
<section class="section">
	<form>
		<div class="card">
			<div class="card-header">
				<div class="header-block">
					<p class="title">메뉴 관리</p>
				</div>
			</div>
			<div class="card-block">
				<div class="row">
					<div class="col-6">
						<div class="pull-right">
							<button type="button" class="btn btn-secondary btn-sm" id="btn-add">
								<i class="fa fa-plus"></i> 추가
							</button>
							<button type="button" class="btn btn-secondary btn-sm" id="btn-remove">
								<i class="fa fa-minus"></i> 삭제
							</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div id="tree-menu" class="border"></div>
					</div>
					<div class="col">
						<div class="form-group row">
							<label for="menuName" class="col-sm-3 col-form-label">메뉴명</label>
							<div class="col-sm-9">
								<input type="text" class="form-control boxed"
									id="menuName" name="menuName" placeholder="메뉴명">
							</div>
						</div>
						<div class="form-group row">
							<label for="menuUrl" class="col-sm-3 col-form-label">메뉴URL</label>
							<div class="col-sm-9">
								<div class="input-group">
									<span class="input-group-addon">http://gonggam.jun0.kim/</span>
									<input type="text" class="form-control boxed"
										id="menuUrl" name="menuUrl" placeholder="메뉴URL">
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="sortNo" class="col-sm-3 col-form-label">정렬순서</label>
							<div class="col-sm-9">
								<input type="number" class="form-control boxed"
									id="sortNo" name="sortNo" placeholder="정렬순서">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">공개설정</label>
							<div class="col-sm-9">
								<label>
									<input type="radio" class="radio" id="useYn" name="useYn" value="Y">
									<span>공개</span>
								</label>
								<label>
									<input type="radio" class="radio" id="useYn" name="useYn" value="N">
									<span>비공개</span>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer">
				<button type="submit" class="btn btn-primary pull-right">저장</button>
			</div>
		</div>
	</form>
</section>

<script>
	let tree;
	const $menuName = $('input[name=menuName]');
	const $menuUrl = $('input[name=menuUrl]');
	const $sortNo = $('input[name=sortNo]');

	$('#tree-menu').jstree({
		core: {
			data: {
				url: "/api/menus"
			},
			themes: {
				name: "proton",
				responsive: true
			},
			check_callback: true,
			multiple: false
		},
		plugins: ['wholerow', 'changed']
	})
	.on('loaded.jstree', function(event, data) {
		tree = $('#tree-menu').jstree(true);
		
		// 로딩 후 2depth까지 펼치기
		let depth = 2;
		data.instance.get_container().find('li').each(function() {
			if(data.instance.get_path($(this)).length <= depth) {
				data.instance.open_node($(this));
			}
		});
	})
	.on('select_node.jstree', function(event, data) {
		$('form input').prop('disabled', false);
		
		let node = data.node;
		$menuName.val(node.text);
		
		if (node.data == null) {
			$('input[name=useYn][value=Y]').prop('checked', true);
			return;
		}
		
		$menuUrl.val(node.data.menuUrl);
		$sortNo.val(node.data.sortNo);
		$('input[name=useYn][value=' + node.data.openYn + ']').prop('checked', true);
	});
	
	$('#btn-add').on('click', function() {
		let selectedId = tree.get_selected();
		
		if (!selectedId.length) {
			selectedId = tree.create_node('#', {text: '새 메뉴', data: {openYn: "Y"}});
			return;
		}
		
		selectedId = tree.create_node(selectedId, {text: '새 메뉴', data: {openYn: "Y"}}, 'last', function(node) {
			tree.open_node(selectedId);
		});
		
		$(this).blur();
	});
	
	let deleted = [];
	$('#btn-remove').on('click', function() {
		let selectedId = tree.get_selected();
		if (!selectedId.length) { return false; }
		deleted.push(selectedId[0]);
		tree.delete_node(selectedId);
		
		$('form').get(0).reset();
		$('form input').prop('disabled', true);
	});
	
	$('form').focusout(function() {
		let selectedId = tree.get_selected();
		
		let menuName = $menuName.val();
		let menuUrl = $menuUrl.val();
		let sortNo = $sortNo.val();
		let openYn = $('input[name=useYn]:checked').val();
		
		tree.rename_node(selectedId, menuName);
		tree.get_node(selectedId).data = {
			menuUrl: menuUrl == '' ? null : menuUrl,
			sortNo: sortNo == '' ? null : sortNo,
			openYn: openYn
		};
	});
	
	$('form').submit(function(event) {
		event.preventDefault();
		
		$.ajax({
			type: "PUT",
			url: "/api/menus",
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "PUT"
			},
			data: JSON.stringify({
				menus: tree.get_json('#', {flat: true, no_data: false}),
				deleted: deleted
			}),
			dataType: "text",
			success: function() {
				tree.refresh();
			},
			complete: function(xhr) {
				alert(xhr.responseText);
			}
		});
	})
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>