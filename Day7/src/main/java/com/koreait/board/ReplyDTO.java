package com.koreait.board;

public class ReplyDTO {
	private int idx;
	private String user;
	private String content;
	private String regdate;
	private int boardidx;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getBoardidx() {
		return boardidx;
	}
	public void setBoardidx(int boardidx) {
		this.boardidx = boardidx;
	}
	@Override
	public String toString() {
		return "ReplyDTO [idx=" + idx + ", user=" + user + ", content=" + content + ", regdate=" + regdate
				+ ", boardidx=" + boardidx + "]";
	}
	
	
}
