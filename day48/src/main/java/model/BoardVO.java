package model;

import java.util.Date;

public class BoardVO {
	
	private int bid;
	private String mid;
	private String content;
	private int favCnt;
	private int replyCnt;
	private Date date;
	
	public int getBid() {
		return bid;
	}
	
	public void setBid(int bid) {
		this.bid = bid;
	}
	
	public String getMid() {
		return mid;
	}
	
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public int getFavCnt() {
		return favCnt;
	}
	
	public void setFavCnt(int favCnt) {
		this.favCnt = favCnt;
	}
	
	public int getReplyCnt() {
		return replyCnt;
	}
	
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "BoardVO [bid=" + bid + ", mid=" + mid + ", content=" + content + ", favCnt=" + favCnt + ", replyCnt="
				+ replyCnt + ", date=" + date + "]";
	}

	
}
