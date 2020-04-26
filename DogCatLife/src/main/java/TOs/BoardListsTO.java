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

	private ArrayList<BoardTO> boardLists;

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
