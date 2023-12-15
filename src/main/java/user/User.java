package user;
//한명의 회원데이터를 담는 자바빈즈 데이터베이스 테이블과 동일하게 작성
public class User {
	private String userID;//학번-교번
	private String userPassword;
	private String school;
	private int userLevel;
	
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
public int getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}
	
}
