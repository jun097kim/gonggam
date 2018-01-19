<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<article class="content items-list-page">
	<div class="title-search-block">
		<div class="title-block">
			<div class="row">
				<div class="col-md-6">
					<h3 class="title">사용자
						<a href="#" class="btn btn-primary btn-sm rounded-s" data-toggle="modal" data-target="#confirm-modal">추가</a>
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
	<div class="card items">
		<ul class="item-list striped">
			<li class="item item-list-header">
				<div class="item-row">
					<div class="item-col fixed item-col-check">
						<label class="item-check" id="select-all-items">
							<input type="checkbox" class="checkbox">
							<span></span>
						</label>
					</div>
					<div class="item-col item-col-header item-col-userid">
						<div>
							<span>아이디</span>
						</div>
					</div>
					<div class="item-col item-col-header item-col-username">
						<div>
							<span>이름</span>
						</div>
					</div>
					<div class="item-col item-col-header item-col-regdate">
						<div class="no-overflow">
							<span>등록일</span>
						</div>
					</div>
					<div class="item-col item-col-header fixed item-col-actions-dropdown"> </div>
				</div>
			</li>
			<c:forEach items="${list}" var="userVO">
				<li class="item">
					<div class="item-row">
						<div class="item-col fixed item-col-check">
							<label class="item-check" id="select-all-items">
								<input type="checkbox" class="checkbox">
								<span></span>
							</label>
						</div>
						<div class="item-col item-col-userid">
							<div class="item-heading">아이디</div>
							<div>${userVO.userid}</div>
						</div>
						<div class="item-col item-col-username">
							<div class="item-heading">이름</div>
							<div>${userVO.username}</div>
						</div>
						<div class="item-col item-col-regdate">
							<div class="item-heading">등록일</div>
							<div>
								<fmt:formatDate value="${userVO.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</div>
						</div>
						<div class="item-col fixed item-col-actions-dropdown">
							<div class="item-actions-dropdown">
								<a class="item-actions-toggle-btn">
									<span class="inactive">
										<i class="fa fa-cog"></i>
									</span>
									<span class="active">
										<i class="fa fa-chevron-circle-right"></i>
									</span>
								</a>
								<div class="item-actions-block">
									<ul class="item-actions-list">
										<li>
											<a class="remove" href="#" data-toggle="modal" data-target="#confirm-modal">
												<i class="fa fa-trash-o "></i>
											</a>
										</li>
										<li>
											<a class="edit" href="item-editor.html">
												<i class="fa fa-pencil"></i>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	<nav class="text-right">
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" href="">이전</a>
			</li>
			<li class="page-item active">
				<a class="page-link" href=""> 1 </a>
			</li>
			<li class="page-item">
				<a class="page-link" href=""> 2 </a>
			</li>
			<li class="page-item">
				<a class="page-link" href=""> 3 </a>
			</li>
			<li class="page-item">
				<a class="page-link" href=""> 4 </a>
			</li>
			<li class="page-item">
				<a class="page-link" href=""> 5 </a>
			</li>
			<li class="page-item">
				<a class="page-link" href="">다음</a>
			</li>
		</ul>
	</nav>
</article>

<div class="modal fade" id="confirm-modal">
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
				<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<%@ include file="../include/footer.jsp"%>