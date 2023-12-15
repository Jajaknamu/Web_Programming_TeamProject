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
		// �겢�옒�뒪?���? 媛�吏�??�� ���꽌 �궗�슜�븳�떎�뒗 �쓽誘�
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	}catch(Exception e) {
		e.printStackTrace();
	}
}
//참여?��교목�?
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

//濡쒓?���씤 �븯�뒗 �븿�닔
public int login(String userID, String userPassword) {
	  String SQL = "SELECT userPassword FROM USER WHERE userID=?";
	  try {
	   pstmt = conn.prepareStatement(SQL);
	   pstmt.setString(1, userID);
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
	    if(rs.getString(1).equals(userPassword))
	     return 1;  // 濡쒓?���씤 �꽦??��
	    else
	     return 0;  // ?��꾨�踰덊?�� ?��?��?��移�
	   }
	   return -1;  // �븘�씠�뵒媛� �뾾�쓬
	   
	  } catch(Exception e) {
	   e.printStackTrace();
	  }
	  return -2; // �뜲�씠�꽣 踰좎?���뒪 �삤?���?

	 }

//?��?���??�� ?��?�� ?��?��
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
		 return -1; //?��?��?��베이?�� ?���?
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
				return 1; // 泥� 踰덉?�� 寃뚯?��?��?��?�� 寃쎌?��	
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			return -1;
		}
	}
	 

