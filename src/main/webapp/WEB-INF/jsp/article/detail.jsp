<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf"%>
<%@ include file="../part/toastuiEditor.jspf"%>

<style>
.form1 {
	padding-bottom: 30px;
}

.title {
	text-align: center;
	margin: 30px;
}

.title>.name {
	text-decoration: none;
	color: crimson;
	letter-spacing: -3px;
}

.table-box {
	
}

.table-box>table>thead {
	
}

.table-box>table th, .table-box>table>th {
	background: #111111;
	color: crimson;
	text-align: center;
}

.article-detail-box {
	margin-top: 150px;
}

.article-detail-box>.tr {
	background-color: black;
	color: crimson;
	text-align-last: center;
}

.article-detail-box>.td {
	text-align: center;
}

.button {
	margin-top: 30px;
	text-align: center;
}
</style>
<div class="title">
	<a class="name">${board.name} 게시판</a>
</div>
<div class="article-detail-box table-box table-box-vertical con">

	<table>
		<colgroup>
			<col class="table-first-col" />
		</colgroup>
		<tbody>
			<tr>
				<th>번호</th>
				<td>${article.id}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${article.regDate}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${article.extra.writer}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${article.title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><script type="text/x-template">${article.body}</script>
					<div class="toast-editor toast-editor-viewer"></div></td>
			</tr>
			<tr>
				<c:forEach var="i" begin="1" end="3" step="1">
					<c:set var="fileNo" value="${String.valueOf(i)}" />
					<c:set var="file" value="${article.extra.file__common__attachment[fileNo]}" />
					<c:if test="${file != null}">
						<tr>
							<th>첨부파일 ${fileNo}</th>
							<td>
								<c:if test="${file.fileExtTypeCode == 'video'}">
									<div class="video-box">
										<video controls	src="/usr/file/streamVideo?id=${file.id}&updateDate=${file.updateDate}"></video>
									</div>
								</c:if> 
								<c:if test="${file.fileExtTypeCode == 'img'}">
									<div class="img-box img-box-auto">
										<img src="/usr/file/img?id=${file.id}&updateDate=${file.updateDate}" alt="" />
									</div>
								</c:if>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<th>비고</th>
				<td>
				<c:if test="${article.extra.actorCanModify}">
						<a class="btn btn-info"	href="${board.code}-modify?id=${article.id}&listUrl=${Util.getUriEncoded(listUrl)}">수정</a>
				</c:if>
				<c:if test="${article.extra.actorCanDelete}">
						<a class="btn btn-danger" href="${board.code}-delete?id=${article.id}" onclick="if ( confirm('삭제하시겠습니까?') == false ) return false;">삭제</a>
				</c:if>
				</td>
			</tr>
		</tbody>
	</table>

	<div class="btn-box con margin-top-20" style="float: right">
		<a href="${listUrl}" class="btn btn-info">목록</a>
	</div>
	<c:if test="${isLogined}">
	<h2 class="con">댓글 작성</h2>
		<script>
		function WriteReplyForm__submit(form) {
			if (isNowLoading()) {
				alert('처리중입니다.');
			}
			form.body.value = form.body.value.trim();
			if (form.body.value.length == 0) {
				alert('댓글을 입력해주세요.');
				form.body.focus();
				return;
			}
			startLoading();
			var startUploadFiles = function(onSuccess) {
				var needToUpload = false;
				if (needToUpload == false) {
					needToUpload = form.file__reply__0__common__attachment__1 && form.file__reply__0__common__attachment__1.value.length > 0;
				}
				if (needToUpload == false) {
					needToUpload = form.file__reply__0__common__attachment__2 && form.file__reply__0__common__attachment__2.value.length > 0;
				}
				if (needToUpload == false) {
					needToUpload = form.file__reply__0__common__attachment__3 && form.file__reply__0__common__attachment__3.value.length > 0;
				}
				if (needToUpload == false) {
					onSuccess();
					return;
				}
				var fileUploadFormData = new FormData(form);
				$.ajax({
					url : './../file/doUploadAjax',
					data : fileUploadFormData,
					processData : false,
					contentType : false,
					dataType : "json",
					type : 'POST',
					success : onSuccess
				});
			}
			var startWriteReply = function(fileIdsStr, onSuccess) {
				$.ajax({
					url : './../reply/doWriteReplyAjax',
					data : {
						fileIdsStr : fileIdsStr,
						body : form.body.value,
						relTypeCode : form.relTypeCode.value,
						relId : form.relId.value
					},
					dataType : "json",
					type : 'POST',
					success : onSuccess
				});
			};
			startUploadFiles(function(data) {
				var idsStr = '';
				if (data && data.body && data.body.fileIdsStr) {
					idsStr = data.body.fileIdsStr;
				}
				startWriteReply(idsStr, function(data) {
					if (data.msg) {
						alert(data.msg);
					}
					form.body.value = '';
					if (form.file__reply__0__common__attachment__1) {
						form.file__reply__0__common__attachment__1.value = '';
					}
					if (form.file__reply__0__common__attachment__2) {
						form.file__reply__0__common__attachment__2.value = '';
					}
					if (form.file__reply__0__common__attachment__3) {
						form.file__reply__0__common__attachment__3.value = '';
					}
					endLoading();
				});
			});
		}
	</script>
	
	<form class="table-box table-box-vertical con form1" onsubmit="WriteReplyForm__submit(this); return false;">
		<input type="hidden" name="replTypeCode" value="article" />
		<input type="hidden" name="replId" value="${article.id}" />
		<table>
			<colgroup>
				<col class="table-first-col" />
			</colgroup>
			<tbody>
				<tr>
					<th>내용</th>
					<td>
						<div class="form-control-box">
							<textarea maxlength="300" name="body" placeholder="내용을 입력해주세요." class="height-300"></textarea>
						</div>
					</td>
				</tr>
				<c:foreach var="i" end="3" step="1">
					<c:set var="fileNo" value="${String.valueOf(i)}"/>
					<c:set var="fileExtTypeCode" value="${appConfig.getAttachmentFileExtTypeCode('reply',i)}"/>
					<tr>
						<th>첨부${fileNo} ${appConfig.getAttachmentFileExtTypeDisplayName('reply',i)}</th>
						<td>
							<div class="form-control-box">
								<input type="file" accept="${appConfig.getAttachmentFileInputAccept('article',i)}" name="file__reply__0__common__attachment__${fileNo}" />
							</div>
						</td>
					</tr>
				</c:foreach>
				<tr class="tr-do">
					<th>작성</th>
					<td>
						<input class="btn btn-primary" type="submit" value="작성"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</c:if>
	<h2 class="con"> 댓글 목록</h2>
	
<style>
	.reply-list-box .media-box > * {
	    margin-top:10px;    
	}
	.reply-list-box .media-box > *:empty {
	    display:none;
	}
	.reply-list-box .media-box > :first-chidl {
	    margin-top:10px;
	} 
</style>
<div class="reply-list-box table-box table-box-data con">
<table>
	<colgroup>
		<col class="table-first-col"/>
		<col width="100"/>
		<col width="140"/>
		<col />
		<col width="180"/>
	</colgroup>
	<thead>
		<tr>
			<th>번호</th>
			<th>날짜</th>
			<th>작성자</th>
			<th>내용</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
	
	</tbody>
</table>
</div>
<style>
.reply-modify-form-modal-actived, reply-modify-form-modal-actived>body {
    overflow: hidden;
}
.reply-modify-form-modal {
    display: none;
}
.reply-modify-form-modal-actived .reply-modify-form-modal {
    display: flex;
}
.reply-modify-form-modal .video-box {
    width: 100px;
}
.reply-modify-form-modal .img-box {
    width: 100px;
}
</style>
<div class="popup-1 reply-modify-form-modal">
	<div>
		<h1>댓글 수정</h1>
		<form action="" class="form1 padding-10 table-box table-box-vertical" onsubmit="ReplyList__submitModifyForm(this); return false;">
			<input type="hidden" name="id" />
			<table>
				<colgroup>
					<col class="table-first-col"/>
				</colgroup>			
				<tbody>
					<tr>
						<th>내용</th>
						<td>
							<div class="form-control-box">
								<textarea name="body" placeholer="내용을 입력해주세요."></textarea>
							</div>
						</td>
					</tr>
					
					<c:foreach var="i" begin="1" end="3" step="1">
						<c:set var="fileNo" value="${String.valueOf(i)}" />
						<c:set var="fileExtTypeCode" value="${appConfig.getAttachmentFileExtTypeCode('article',i)}" />
						<tr>
							<th>첨부 ${fileNo}</th>
							<td>
								<div class="form-control-box">
									<input type="file" accept="${appConfig.getAttachmentFileInputAccept('article',i)}" data-name="file__reply__0__common__attachment__${fileNo}" />
								</div>
								<div style="width:100%" class="video-box video-box-file-${fileNo}"></div>
								<div style="width:100%" class="img-box img-box-auto img-box-file-${fileNo}"></div>
							</td>
						</tr>
						<tr>
							<th>첨부 ${fileNo } 삭제</th>
							<td>
								<div class="form-control-box">
									<label>
										<input type="checkbox" data-name="deleteFile__reply__0__common__attachment__${fileNo}" value="Y"/>
										삭제
									</label>
								</div>
							</td>
						</tr>						
					</c:foreach>
					<tr class="tr-do">
						<th>수정</th>
						<td>
							<button class="btn btn-primary" type="submit">수정</button>
							<button class="btn btn-info" type="button" onclick="ReplyList__hideModifyFormModal();">취소</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>

<script>
	var ReplyList__$box = $('.reply-list-box');
	var ReplyList__$tbody = ReplyList__$box.find('tbody');

	var ReplyList__lastLodedId = 0;

	function ReplyList__submitModifyForm(form){
			if(isNowLoading()){
				alert('처리중입니다.');
				return;
				}

			form.body.value = form.body.value.trim();

			if(form.body.value.length == 0){
					alert('내용을 입력해 주세요.');
					form.body.focus();

					return;
				}

			var id = form.id.value;
			var body = form.body.value;

			var fileInput1 = form['file__reply__'+id+'__common__attachment__1'];
			var fileInput2 = form['file__reply__'+id+'__common__attachment__2'];
			var fileInput3 = form['file__reply__'+id+'__common__attachment__3'];

			var deleteFileInput1 = form["deleteFile__reply__"+id+"__common__attachment__1"];
			var deleteFileInput2 = form["deleteFile__reply__"+id+"__common__attachment__2"];
			var deleteFileInput3 = form["deleteFile__reply__"+id+"__common__attachment__3"];
			if (fileInput1 && deleteFileInput1 && deleteFileInput1.checked){

					fileInput1.value='';
				}
			if (fileInput2 && deleteFileInput2 && deleteFileInput2.checked){
					fileInput1.value='';
				}
			if (fileInput3 && deleteFileInput3 && deleteFileInput3.checked){
					fileInput1.value='';
				}
			startLoading();

			var startUploadFiles = function(){
					var needToUpload = false;

					if (needToUpload == false){
							needToUpload = fileInput1 && fileInput1.value.length > 0;
						}
					if (needToUpload == false){
							needToUpload = deleteFileInput1 && deleteFileInput1.checked;
						}

					if (needToUpload == false){
							needToUpload = fileInput2 && fileInput2.value.length > 0;
						}
					if (needToUpload == false){
							needToUpload = deleteFileInput2 && deleteFileInput2.checked;
						}

					if (needToUpload == false){
							needToUpload = fileInput3 && fileInput3.value.length > 0;
						}
					if (needToUpload == false){
							needToUpload = deleteFileInput3 && deleteFileInput3.checked;
						}
					if (needToUpload == false){
							onUploadFilesConplete();
							return;
						}

					var fileUploadFormData = new FormData(form);

					$.ajax({
						url : './../file/doUploadAjax',
						data : fileUploadFormData,
						processData : false,
						contentType : false,
						dataType : "json",
						type : 'POST',
						success : onUploadFilesComplete
						});
				}

				var onUploadFilesComplete = function(data){
						var fileIdsStr = '';
						if (data && data.body && data.body.fileIdsStr) {
								fileIdsStr = data.body.fileIdsStr;
							}
						startModifyReply(fileIdsStr);
					};

				var startModifyReply = function(fileIdsStr) {
						$.post('../reply/doModifyReplyAjax', {
							id : id,
							body : body,
							fileIdsStr : fileIdsStr
							}, onModifyReplyComplete, 'json');
					};

				var onModifyReplyComplete = function(data){
						if (data.resultCode && data.resultCode.substr(0,2) == 'S-'){
								$('.reply-list-box tbody > tr[data-id="'+id+'"]').data('data-originBody', body);
								$('.reply-list-box tbody > tr[data-id="'+id+'"].reply-body').empty().append(getHtmlEncoded(body).replaceAll('\n','<br>'));

								$('.reply-list-box tbody > tr[data-id="'+id+'"].video-box').empty();
								$('.reply-list-box tbody > tr[data-id="'+id+'"].img-box').empty();

								if (data && data.body && data.body.file__common__attachment){
										for (var fileNo in data.body.file__common__attachment){
											var file = data.body.file__common__attachment[fileNo];

											if (file.fileExtTypeCode == 'video'){
												var html = '<video preload="none" controls src="/usr/file/streamVideo?id='+file.id+'&updateDate='+file.updateDate+'">video not supported</video>';
												$('.reply-list-box tbody > tr[data-id="'+id+'"][data-file-no="'+fileNo+'"].video-box').append(html);
												}
											}
									}
							}
				if (data.msg){
					alert(data.msg);
					}
				replyList__hideModifyFormModal();
				endLoading();
					};
					startUploadFiles();
		}	
	function ReplyList__showModifyFormModal(el) {
		$('html').addClass('reply-modify-form-modal-actived');
		var $tr = $(el).closest('tr');
		var originBody = $tr.data('data-originBody');

		var id = $tr.attr('data-id');
		var form = $('.reply-modify-form-modal form').get(0);

		$(form).find('[data-name]').each(function(index, el) {
			var $el = $(el);

			var name = $el.attr('data-name');
			name = name.replaceAll('__0__','__'+id+'__');
			$el.attr('name',name);

			if($el.prop('type') == 'file'){
				$el.val('');
			}else if ($el.prop('type') == 'checkbox'){
				$el.prop('checked',false);
			}
		});

		for (var fileNo = 1; fileNo <=3; fileNo++){
				$('.reply-modify-form-modal .video-box-file-'+fileNo).empty();

				var videoName = 'reply__'+id+'__common__attachment__'+fileNo;

				var $videoBox = $('.reply-list-box [data-video-name="'+videoName+'"]');

				if ($videoBox.length > 0){
					$('.reply-modify-form-modal .video-box-file-'+fileNo).append($videoBox.html());	
				}
				$('.reply-modify-form-modal .img-box-file-'+fileNo).empty();
				var imgName = 'reply__'+id+'__common__attachment__'+fileNo;
				var $imgBox = $('.reply-list-box [data-img-name ="'+imgName+'"]');

				if ($imgBox.length > 0){
					$('.reply-modify-form-modal .img-box-file-'+fileNo).append($imgBox.html());
				}
			}
			form.id.value = id;
			form.body.value = originBody;
	}
	function ReplyList__hideModifyFormModal(){
			$('html').removeClass('reply-modify-form-modal-actived');
	}

	ReplyList__loadMoreInterval = 1 * 1000;

	
</script>



</div>

<%@ include file="../part/foot.jspf"%>