package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
	try {
		String dbURL = "jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "1234";
		// ï¿½ê²¢ï¿½ì˜’ï¿½ë’ª?‘œï¿? åª›ï¿½ï§ï¿½??¨ï¿½ ï¿½ï¿½ï¿½ê½Œ ï¿½ê¶—ï¿½ìŠœï¿½ë¸³ï¿½ë–ï¿½ë’— ï¿½ì“½èª˜ï¿½
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	}catch(Exception e) {
		e.printStackTrace();
	}
}
//ì°¸ì—¬?•™êµëª©ë¡?
	public ArrayList<User> SchoolList() {
		String SQL = "SELECT * FROM USER WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<User> school = new ArrayList<User>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setSchool(rs.getString("school"));
				school.add(user);
			}
			rs.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return school;
	}

//æ¿¡ì’“? ‡ï¿½ì”¤ ï¿½ë¸¯ï¿½ë’— ï¿½ë¸¿ï¿½ë‹”
public int login(String userID, String userPassword) {
	  String SQL = "SELECT userPassword FROM USER WHERE userID=?";
	  try {
	   pstmt = conn.prepareStatement(SQL);
	   pstmt.setString(1, userID);
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
	    if(rs.getString(1).equals(userPassword))
	     return 1;  // æ¿¡ì’“? ‡ï¿½ì”¤ ï¿½ê½¦??¨ï¿½
	    else
	     return 0;  // ?®ê¾¨ï¿½è¸°ëŠ?ƒ‡ ?º?‰?”ªç§»ï¿½
	   }
	   return -1;  // ï¿½ë¸˜ï¿½ì” ï¿½ëµ’åª›ï¿½ ï¿½ë¾¾ï¿½ì“¬
	   
	  } catch(Exception e) {
	   e.printStackTrace();
	  }
	  return -2; // ï¿½ëœ²ï¿½ì” ï¿½ê½£ è¸°ì¢?” ï¿½ë’ª ï¿½ì‚¤?‘œï¿?

	 }

//?šŒ?›ê°??… ?•˜?Š” ?•¨?ˆ˜
	 public int join(User user) {
		 String SQL = "INSERT INTO USER VALUES(?, ?, ?)";
		 try {
			 pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1, user.getUserID());
			 pstmt.setString(2, user.getUserPassword());
			 pstmt.setString(3, user.getSchool());
			 return pstmt.executeUpdate();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return -1; //?°?´?„°ë² ì´?Š¤ ?˜¤ë¥?
	 }
	 
	 public int getUserLevel(String userID) {
			String SQL = "SELECT level FROM User WHERE userID = ? limit 1";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userID);
				
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return rs.getInt(1);
				}
				return 1; // ï§£ï¿½ è¸°ë‰? å¯ƒëš¯?–†?‡¾?‡±?”¤ å¯ƒìŒ?Š¦	
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			return -1;
		}
	}
	 

