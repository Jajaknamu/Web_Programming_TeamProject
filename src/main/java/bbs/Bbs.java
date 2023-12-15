package bbs;
//하나의 게시글을 쓰는 자바빈즈 데이터베이스 테이블과 동일하게 작성
public class Bbs {
	
	
	private int bbsID;
	private String bbsTitle;
	private String userID;
	private String bbsDate;
	private String bbsContent;
	private int bbsAvailable;
	private String userSchool;
	private String bbsKategorie;
	private int bbsLikeCnt;
	private String bbsCommContent;

	
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	public String getBbsKategorie() {
		return bbsKategorie;
	}
	public void setBbsKategorie(String bbsKategorie) {
		this.bbsKategorie = bbsKategorie;
	}
	
	public String getUserSchool() {
		return userSchool;
	}
	public void setUserSchool(String userSchool) {
		this.userSchool = userSchool;
	}
	public int getBbsLikeCnt() {
		return bbsLikeCnt;
	}
	public void setBbsLikeCnt(int bbsLikeCnt) {
		this.bbsLikeCnt = bbsLikeCnt;
	}
	public String getBbsCommContent() {
		return bbsCommContent;
	}
	public void setBbsCommContent(String bbsCommContent) {
		this.bbsCommContent = bbsCommContent;
	}

}
