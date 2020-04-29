package TOs;

import java.util.ArrayList;

public class BoardListsTO {
	private int cpage;
	private int recordPerPage;
	private int blockPerPage;
	private int totalPage;
	private int totalRecord;
	private int startBlock;
	private int endBlock;
	private int pseq;
	private String mseq;
	private String pseq_kind = "";
	private String searchKeyWord;
	private String searchField;
	// 관리자용
	private int boardToday;
	private int commentToday;
	private int userToday;
	private int userSecession;
	private int totalSecession;
	private int totalBoard;
	private int totalComment;
	private int totalUser;

	private ArrayList<BoardTO> boardLists;
	private ArrayList<UserTO> userLists;
	private ArrayList<BoardTO> commentLists;
	private ArrayList<AdminsTO> adminsLists;
	private ArrayList<BoardTO> qnaLists;
	private ArrayList<QuestionsTO> qLists;
	private ArrayList<PersonalQTO> qnLists;

	public ArrayList<UserTO> getUserLists() {
		return userLists;
	}

	public void setUserLists(ArrayList<UserTO> userLists) {
		this.userLists = userLists;
	}

	public ArrayList<BoardTO> getCommentLists() {
		return commentLists;
	}

	public void setCommentLists(ArrayList<BoardTO> commentLists) {
		this.commentLists = commentLists;
	}

	public ArrayList<AdminsTO> getAdminsLists() {
		return adminsLists;
	}

	public void setAdminsLists(ArrayList<AdminsTO> adminsLists) {
		this.adminsLists = adminsLists;
	}

	public ArrayList<BoardTO> getQnaLists() {
		return qnaLists;
	}

	public void setQnaLists(ArrayList<BoardTO> qnaLists) {
		this.qnaLists = qnaLists;
	}

	public ArrayList<QuestionsTO> getqLists() {
		return qLists;
	}

	public void setqLists(ArrayList<QuestionsTO> qLists) {
		this.qLists = qLists;
	}

	public ArrayList<PersonalQTO> getQnLists() {
		return qnLists;
	}

	public void setQnLists(ArrayList<PersonalQTO> qnLists) {
		this.qnLists = qnLists;
	}

	public int getBoardToday() {
		return boardToday;
	}

	public void setBoardToday(int boardToday) {
		this.boardToday = boardToday;
	}

	public int getCommentToday() {
		return commentToday;
	}

	public void setCommentToday(int commentToday) {
		this.commentToday = commentToday;
	}

	public int getUserToday() {
		return userToday;
	}

	public void setUserToday(int userToday) {
		this.userToday = userToday;
	}

	public int getUserSecession() {
		return userSecession;
	}

	public void setUserSecession(int userSecession) {
		this.userSecession = userSecession;
	}

	public int getTotalSecession() {
		return totalSecession;
	}

	public void setTotalSecession(int totalSecession) {
		this.totalSecession = totalSecession;
	}

	public int getTotalBoard() {
		return totalBoard;
	}

	public void setTotalBoard(int totalBoard) {
		this.totalBoard = totalBoard;
	}

	public int getTotalComment() {
		return totalComment;
	}

	public void setTotalComment(int totalComment) {
		this.totalComment = totalComment;
	}

	public int getTotalUser() {
		return totalUser;
	}

	public void setTotalUser(int totalUser) {
		this.totalUser = totalUser;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getSearchKeyWord() {
		return searchKeyWord;
	}

	public void setSearchKeyWord(String searchKeyWord) {
		this.searchKeyWord = searchKeyWord;
	}

	public String getPseq_kind() {
		return pseq_kind;
	}

	public void setPseq_kind(String pseq_kind) {
		this.pseq_kind = pseq_kind;
	}

	public BoardListsTO() {
		// 페이지 시작되면 제일처음 1페이지니까 현재페이지는 1
		this.cpage = 1;
		// 한페이지에 보이는 글은 10개
		this.recordPerPage = 10;
		// 페이지 넘기는 부분에는 최대 5개의 숫자를 선택할수있다
		this.blockPerPage = 5;
		// DB에서 아직 읽어오기 전이니까 총 페이지 수는 1개
		this.totalPage = 1;
		// DB에서 아직 읽어오기 전이니까 총 글 수는 0개
		this.totalRecord = 0;
	}

	public String getMseq() {
		return mseq;
	}

	public void setMseq(String mseq) {
		this.mseq = mseq;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public int getCpage() {
		return cpage;
	}

	public void setCpage(int cpage) {
		this.cpage = cpage;
	}

	public int getRecordPerPage() {
		return recordPerPage;
	}

	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}

	public int getBlockPerPage() {
		return blockPerPage;
	}

	public void setBlockPerPage(int blockPerPage) {
		this.blockPerPage = blockPerPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public ArrayList<BoardTO> getBoardLists() {
		return boardLists;
	}

	public void setBoardLists(ArrayList<BoardTO> boardLists) {
		this.boardLists = boardLists;
	}

}
