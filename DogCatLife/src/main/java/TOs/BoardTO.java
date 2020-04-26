package TOs;

public class BoardTO {
	// 게시글 관련 부분
	private String pseq;
	private String seq;
	private String subject;
	private String mseq;
	private String writer;
	private String content;
	private String filename_ori;
	private String filename_new;
	private int wgap;
	private String hit;
	private String cmt;
	private String wdate_ori;
	private String wdate_mod;
	private String aseq;

	// 댓글 관련 부분
	private String cseq;
	private String cmseq;
	private String cwriter;
	private String comment;
	private String cwdate_ori;
	private String cwdate_mod;
	private String pseq_kind;
	
	private String searchKeyWord;
	private String searchField;
	
	public String getAseq() {
		return aseq;
	}

	public void setAseq(String aseq) {
		this.aseq = aseq;
	}

	public String getSearchKeyWord() {
		return searchKeyWord;
	}

	public void setSearchKeyWord(String searchKeyWord) {
		this.searchKeyWord = searchKeyWord;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getPseq_kind() {
		return pseq_kind;
	}

	public void setPseq_kind(String pseq_kind) {
		this.pseq_kind = pseq_kind;
	}

	// 현재 페이지
	private String cpage;
	
	public String getPseq() {
		return pseq;
	}

	public void setPseq(String pseq) {
		this.pseq = pseq;
	}

	public String getFilename_ori() {
		return filename_ori;
	}

	public void setFilename_ori(String filename_ori) {
		this.filename_ori = filename_ori;
	}

	public String getFilename_new() {
		return filename_new;
	}

	public void setFilename_new(String filename_new) {
		this.filename_new = filename_new;
	}

	public String getCseq() {
		return cseq;
	}

	public void setCseq(String cseq) {
		this.cseq = cseq;
	}

	public String getCmseq() {
		return cmseq;
	}

	public void setCmseq(String cmseq) {
		this.cmseq = cmseq;
	}

	public String getCwriter() {
		return cwriter;
	}

	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCwdate_ori() {
		return cwdate_ori;
	}

	public void setCwdate_ori(String cwdate_ori) {
		this.cwdate_ori = cwdate_ori;
	}

	public String getCwdate_mod() {
		return cwdate_mod;
	}

	public void setCwdate_mod(String cwdate_mod) {
		this.cwdate_mod = cwdate_mod;
	}

	public String getCpage() {
		return cpage;
	}

	public void setCpage(String cpage) {
		this.cpage = cpage;
	}

	public int getWgap() {
		return wgap;
	}

	public void setWgap(int wgap) {
		this.wgap = wgap;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMseq() {
		return mseq;
	}

	public void setMseq(String mseq) {
		this.mseq = mseq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getCmt() {
		return cmt;
	}

	public void setCmt(String cmt) {
		this.cmt = cmt;
	}

	public String getWdate_ori() {
		return wdate_ori;
	}

	public void setWdate_ori(String wdate_ori) {
		this.wdate_ori = wdate_ori;
	}

	public String getWdate_mod() {
		return wdate_mod;
	}

	public void setWdate_mod(String wdate_mod) {
		this.wdate_mod = wdate_mod;
	}
}
