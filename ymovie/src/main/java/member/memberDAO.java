package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import defaultConn.getConn;
import movie.CodeNameYearDTO;

public class memberDAO {
	public int signInCheck(String targetId, String targetPw)  {
		int result = 1;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "select * from member where mem_id =\"" + targetId + "\" and mem_pw = " + "sha1(\"" + targetPw + "\")";
		//System.out.println(query);
		try {
			getConn getCon = new getConn();
			con = getCon.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			if (rs.next()) {
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public int signUpCheck(String targetId, String targetNick)  {
		int result = 1;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		String query = "select * from member where mem_id =\"" + targetId + "\" or mem_nickname = \"" +  targetNick + "\"";
		//System.out.println(query);
		try {
			getConn getCon = new getConn();
			con = getCon.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			if (rs.next()) {
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int matchIdNick(String targetId, String targetNick)  {
		int result = 1;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		String query = "select * from member where mem_id =\"" + targetId + "\" and mem_nickname = \"" +  targetNick + "\"";
		//System.out.println(query);
		try {
			getConn getCon = new getConn();
			con = getCon.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			if (rs.next()) {
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public void resetPW(String targetId, String targetPw)  {

		Connection con = null;		
		PreparedStatement pstmt = null;
		String query = "update member set mem_pw = sha1(?) where mem_id = ?";
		//System.out.println(query);
		try {
			getConn getCon = new getConn();
			con = getCon.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, targetPw);
			pstmt.setString(2, targetId);
			pstmt.execute();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public memberDTO selectMember(Connection con, String targetId, String targetPw)  {
		memberDTO dto = new memberDTO("","","",0);
		
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from member where mem_id =\"" + targetId + "\" and mem_pw = " + "sha1(\"" + targetPw + "\")";
		//System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			if (rs.next()) {
				String mem_id = rs.getString("mem_id");
				String mem_nickname = rs.getString("mem_nickname");
				int mem_icon = rs.getInt("mem_icon");
				int mem_reviewCount = rs.getInt("mem_reviewCount");
				String mem_favGenre = rs.getString("mem_favGenre");
				String mem_favActor = rs.getString("mem_favActor");
				String mem_favDirector = rs.getString("mem_favDirector");

				dto = new memberDTO(mem_id, "", mem_nickname, mem_icon, mem_reviewCount, mem_favGenre, mem_favActor, mem_favDirector);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	public void addReviewCount(Connection con, String targetId)  {
		String query = "update movie set mem_reviewCount = mem_reviewCount + 1 where mem_id= ?";
		try {
			PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, targetId);
			pstmt.execute();
			pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
	}
	public int insertMember(memberDTO dto) {
		PreparedStatement pstmt = null;
		String query = "insert into member values (?, sha1(?), ?, ?, ?, ?, ?, ?)";
		int result = 0;
		try {

			Connection con = null;		
			getConn getCon = new getConn();
			con = getCon.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getMem_id());
			pstmt.setString(2, dto.getMem_pw());
			pstmt.setString(3, dto.getMem_nickname());
			pstmt.setString(4, Integer.toString(dto.getMem_icon()));
			pstmt.setString(5, Integer.toString(dto.getMem_reviewCount()));
			pstmt.setString(6, dto.getMem_favGenre());
			pstmt.setString(7, dto.getMem_favActor());
			pstmt.setString(8, dto.getMem_favDirector());
			
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<memberDTO> memReviewRank()  {
	    ArrayList<memberDTO> results = new ArrayList<memberDTO>();
	    
	    Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    String query = "select mem_nickname, mem_reviewCount, mem_favGenre, mem_favDirector from member order by mem_reviewCount limit 20";
	    //System.out.println(query);
	    try {
			getConn getCon = new getConn();
			con = getCon.getConnection();
	        stmt = con.createStatement();
	        rs = stmt.executeQuery(query);
	        while (rs.next()) {
	            results.add(new memberDTO(rs.getString("mem_nickname"), rs.getInt("mem_reviewCount"), rs.getString("mem_favGenre"), rs.getString("mem_favDirector")));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if(rs != null) rs.close();
	            if(stmt != null) stmt.close();
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return results;
	}
	
	public int deleteMember(Connection con, String targetId, String targerPw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "delete from member where mem_id = ? and mem_pw = sha1(?)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, targetId);
			pstmt.setString(2, targerPw);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}	
}