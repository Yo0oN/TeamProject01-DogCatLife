<div class="comm_cont comm_cont_edit">
	<table role="presentation" cellspacing="0" class="cminput">
		<tr>
			<td class="i2">
				<div class="pers_nick_area">
					<table role="presentation" cellspacing="0">
						<tbody>
							<tr>
								<td class="p-nick"><a class="m-tcol-c _rosRestrict _nickUI"
									href="#">{writernick}</a>{articleWriterTpl}</td>
							</tr>
						</tbody>
					</table>
				</div> <span class="date m-tcol-c filter-50">{writedt}</span> <span
				class="dsc_comm"><a href="#"
					class="m-tcol-c {cmtClass} _btnReply">답글</a></span>
				</div>
				<div class="comm_write_wrap border-sub skin-bgcolor">
					<textarea id="comment_text" cols="50" rows="2"
						class="textarea m-tcol-c" maxlength="6000"
						style="overflow: hidden; line-height: 14px; height: 39px;"
						title="댓글수정">{content}</textarea>
					<div class="u_cbox_upload_image" style="display: {displayStyle">
						{attachAreaTpl}</div>
			</td>
			<td class="i3">
				<p class="btn_edit m-tcol-c">
					<a href="#" class="m-tcol-p _btnEditCancel">수정취소</a>
				</p>
				<div class="u_cbox_btn_upload _submitBtn">
					<a href="#" class="u_cbox_txt_upload _submitCmt{submitClass}"
						alt="{buttonText}입력">수정</a>
				</div>
			</td>
		</tr>
	</table>
</div>
