package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	
	//DB연동
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//현재 시간 가져오는 함수
	public String getDate() {
		String SQL = "SELECT NOW()"; //현재시간가져오는 mysql문장
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	//게시글 번호 달아주는 함수
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC"; //bbsID가져와서 마지막 글에 +1해서 다음게시글 번호 달아주는 문장
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	//게시글 작성하는 함수
	public int write(String bbsTitle, String userID, String bbsContent,String userSchool,String bbsKategorie) {
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?, ?, ?)"; //DB에 게시글 작성해서 넣어주는 문장
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			pstmt.setString(7, userSchool);
			pstmt.setString(8, bbsKategorie);
			
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
		
	public ArrayList<Bbs> getList(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setUserSchool(rs.getString(7));
				bbs.setBbsKategorie(rs.getString(8));
				bbs.setBbsLikeCnt(rs.getInt(9));
				bbs.setBbsAvailable(rs.getInt(1));
				list.add(bbs);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setUserSchool(rs.getString(6));
				bbs.setBbsKategorie(rs.getString(7));
				bbs.setBbsLikeCnt(rs.getInt(8));
				bbs.setBbsAvailable(rs.getInt(1));
				return bbs;
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//게시글 수정해서 업데이트 해주는 함수
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	//게시글 삭제하는 함수
	public int delete(int bbsID) {
		String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int updateLikeCnt(int bbsID, int bbsLikeCnt) {
		String SQL = "UPDATE BBS SET likeCnt = ? WHERE bbsID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsLikeCnt);
			pstmt.setInt(2, bbsID);
			
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public ArrayList<Bbs> getCommentList(int bbsID) {
		String SQL = "SELECT commContent FROM COMMENT WHERE bbsID = ? ORDER BY commentID";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsCommContent(rs.getString(1));
				list.add(bbs);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
		public int writeComment(int bbsID, String comment) {
			String SQL = "INSERT INTO comment VALUES (?, ?, ?)"; 
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getCommentNext());
				pstmt.setInt(2, bbsID);
				pstmt.setString(3, comment);
				
				return pstmt.executeUpdate(); 
			} catch(Exception e) {
				e.printStackTrace();
			}
			return -1; 
		}
		
		
		public int getCommentNext() {
			String SQL = "SELECT commentID FROM comment ORDER BY commentID DESC limit 1"; 
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; 
			} catch(Exception e) {
				e.printStackTrace();
			}
			return -1; 
		}
	
}
